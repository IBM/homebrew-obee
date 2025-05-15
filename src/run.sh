#!/bin/zsh

LAUNCH_CMD=""

if [[ $1 == "start" ]]; then
    LAUNCH_CMD="load"
elif [[ $1 == "stop" ]]; then
    LAUNCH_CMD="unload"
elif [[ $1 == "update" ]]; then
    echo "Updating Open WebUI ..."
    launchctl start $HOME/Library/LaunchAgents/com.granite.obee.update.plist
    exit 0
elif [[ $1 == "--help" ]] || [ -z "$1" ] ; then
    echo """

Commands:
    start       Starts Ollama and Open Webui
    stop        Stops Ollama and Open Webui
    update      Updates Obee to the latest version -- WIP

Usage:
    obee [command]

    """
    exit 1
fi

launchctl $LAUNCH_CMD $HOME/Library/LaunchAgents/com.granite.ollama.plist
launchctl $LAUNCH_CMD $HOME/Library/LaunchAgents/com.granite.obee.plist
echo "Ollama and Open Webui $LAUNCH_CMD"
