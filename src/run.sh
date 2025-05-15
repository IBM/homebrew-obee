#!/bin/zsh

LAUNCH_CMD=""
OPEN_WEBUI_SCRIPT=${OPEN_WEBUI_SCRIPT:-"https://raw.githubusercontent.com/IBM/lm-desk/refs/heads/main/scripts/openwebui.py"}

if [[ $1 == "start" ]]; then
    LAUNCH_CMD="load"
elif [[ $1 == "stop" ]]; then
    LAUNCH_CMD="unload"
elif [[ $1 == "update" ]]; then
    echo "Updating Open WebUI ..."
    uv run -P open-webui $OPEN_WEBUI_SCRIPT --update
    exit 0
elif [[ $1 == "--help" ]] || [ -z "$1" ] ; then
    echo """

Commands:
    start       Starts Ollama and Open Webui
    stop        Stops Ollama and Open Webui
    update      Updates Obee to the latest version

Usage:
    obee [command]

    """
    exit 1
fi

launchctl $LAUNCH_CMD $HOME/Library/LaunchAgents/com.granite.ollama.plist
launchctl $LAUNCH_CMD $HOME/Library/LaunchAgents/com.granite.obee.plist
echo "Ollama and Open Webui $LAUNCH_CMD"
