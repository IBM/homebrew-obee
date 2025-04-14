import click

import socket
from contextlib import closing
import os
import base64
import uvicorn
import random
from pathlib import Path


@click.group()
def obee():
    pass

@obee.command()
# @click.option('--ns', '-n', default="skunk-test", help='namespace')
def start(**kwargs):
        
    KEY_FILE = Path.cwd() / ".webui_secret_key"
    os.environ["FROM_INIT_PY"] = "true"

    if os.getenv("WEBUI_SECRET_KEY") is None:
        if not KEY_FILE.exists():
            KEY_FILE.write_bytes(base64.b64encode(random.randbytes(12)))
        os.environ["WEBUI_SECRET_KEY"] = KEY_FILE.read_text()

    if os.getenv("USE_CUDA_DOCKER", "false") == "true":
        LD_LIBRARY_PATH = os.getenv("LD_LIBRARY_PATH", "").split(":")
        os.environ["LD_LIBRARY_PATH"] = ":".join(
            LD_LIBRARY_PATH
            + [
                "/usr/local/lib/python3.11/site-packages/torch/lib",
                "/usr/local/lib/python3.11/site-packages/nvidia/cudnn/lib",
            ]
        )
        try:
            import torch

            assert torch.cuda.is_available(), "CUDA not available"
        except Exception as e:
            os.environ["USE_CUDA_DOCKER"] = "false"
            os.environ["LD_LIBRARY_PATH"] = ":".join(LD_LIBRARY_PATH)



    import open_webui.main  # we need set environment variables before importing main

    host: str = "0.0.0.0"
    port: int = 8080
    reload: bool = True

    uvicorn.run(open_webui.main.app, host=host, port=port, forwarded_allow_ips="*")


@obee.command()
def stop():
    pass

if __name__ == '__main__':
    obee()
