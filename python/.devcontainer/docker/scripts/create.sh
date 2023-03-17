#!/bin/bash

# Terminate if any command fails
set -e

# Enable conda
__conda_setup="$('/home/vscode/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vscode/conda/etc/profile.d/conda.sh" ]; then
        . "/home/vscode/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/vscode/conda/bin:$PATH"
    fi
fi
unset __conda_setup

## Check if pyproject.toml exists
if [ ! -f "/code/pyproject.toml" ]; then
    echo "----------------------------------------------------------------------------"
    echo "No pyproject.toml found"
    echo "----------------------------------------------------------------------------"
    exit 0
fi

# Enter /code
cd /code

# Activate environment
conda activate python3.11

# Install requirements with poetry
poetry install --no-interaction

echo "----------------------------------------------------------------------------"
echo "Python requirements installed"
echo "----------------------------------------------------------------------------"
