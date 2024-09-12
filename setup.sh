#!/bin/bash

# Define a list of setup scripts
SCRIPTS=(
    "github_ssh.sh"
    "setup_term.sh"
    "setup_node.sh"
    "setup_go.sh"
    "setup_docker.sh"
    "setup_tools.sh"
)

# Iterate through each script and execute it
for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ]; then
        echo "Running $script..."
        chmod +x "$script"
        ./"$script"
        echo "$script completed successfully."
    else
        echo "Error: $script not found."
    fi
    echo "----------------------------------------"
done

echo "All setup scripts have been executed."
