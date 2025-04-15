#!/bin/zsh

function find_cmd_bin {
    command -v $1
}

OLLAMA_BIN=$(find_cmd_bin ollama || true)
UV_BIN=$(find_cmd_bin uv || true)

# replace <OLLAMA_BIN>
sed -i '' -e 's|<OLLAMA_BIN>|'"$OLLAMA_BIN"'|g' ~/Library/LaunchAgents/com.granite.ollama.plist
# replace <UV_BIN>
sed -i '' -e 's|<UV_BIN>|'"$UV_BIN"'|g' ~/Library/LaunchAgents/com.granite.obee.plist


LAUNCH_CMD=""
USER_INPUT=$1

echo "User input $USER_INPUT"

if [ $USER_INPUT == "run" ]; then
    LAUNCH_CMD="load"
elif [ $USER_INPUT == "stop" ]; then
    LAUNCH_CMD="unload"
fi

launchctl $LAUNCH_CMD ~/Library/LaunchAgents/com.granite.ollama.plist
launchctl $LAUNCH_CMD ~/Library/LaunchAgents/com.granite.obee.plist

echo "Ollama and Open Webui $LAUNCH_CMD"
