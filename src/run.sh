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



if [ $1 == "start" ]; then
    launchctl load ~/Library/LaunchAgents/com.granite.ollama.plist
    launchctl load ~/Library/LaunchAgents/com.granite.obee.plist
    echo "Ollama and Open Webui running"

elif [ $1 == "stop" ]; then
    launchctl unload ~/Library/LaunchAgents/com.granite.ollama.plist
    launchctl unload ~/Library/LaunchAgents/com.granite.obee.plist
    echo "Ollama and Open Webui stopped"
fi


