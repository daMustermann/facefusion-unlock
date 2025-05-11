#!/bin/bash

echo "Checking for Python 3..."
if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found."
    echo "Please install Python 3 (e.g., sudo apt install python3 python3-venv) and ensure it's in your PATH."
    exit 1
fi

echo "Creating virtual environment (.venv)..."
python3 -m venv .venv
if [ $? -ne 0 ]; then
    echo "Failed to create virtual environment. Please check your Python 3 installation."
    exit 1
fi

echo "Activating virtual environment and installing dependencies from requirements.txt..."
source .venv/bin/activate
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Failed to install dependencies."
    echo "Please check your requirements.txt file, internet connection, and ensure pip is working."
    # Deactivate if installation fails
    deactivate
    exit 1
fi

echo ""
echo "Setup complete!"
echo "The virtual environment '.venv' has been created and dependencies are installed."
echo "To activate this environment manually in the future, open a terminal in this directory and run: source .venv/bin/activate"
echo "You can now use run_app.sh to start your application."
