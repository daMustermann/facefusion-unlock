@echo off
echo Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not found in your system's PATH.
    echo Please install Python (https://www.python.org/downloads/) and ensure it's added to your PATH.
    pause
    goto :eof
)

echo Creating virtual environment (.venv)...
python -m venv .venv
if %errorlevel% neq 0 (
    echo Failed to create virtual environment. Please check your Python installation.
    pause
    goto :eof
)

echo Activating virtual environment and installing dependencies from requirements.txt...
call .venv\Scripts\activate.bat
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Failed to install dependencies.
    echo Please check your requirements.txt file, internet connection, and ensure pip is working.
    pause
    goto :eof
)

echo Setup complete!
echo The virtual environment '.venv' has been created and dependencies are installed.
echo To activate this environment manually in the future, open a command prompt in this directory and run: .venv\Scripts\activate.bat
echo You can now use run_app.bat to start your application.
pause
