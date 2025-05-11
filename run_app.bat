@echo off
set VENV_PATH=.venv\Scripts\activate.bat

if not exist %VENV_PATH% (
    echo Virtual environment not found at %VENV_PATH%.
    echo Please run setup_venv.bat first to create the environment and install dependencies.
    pause
    goto :eof
)

echo Activating virtual environment...
call %VENV_PATH%

echo Starting the application...
REM ================================================================================
REM IMPORTANT: Replace 'python your_main_app_script.py' with the actual command
REM            to run your application's main script. For example: python main.py
REM ================================================================================
python your_main_app_script.py

echo Application finished.
pause
