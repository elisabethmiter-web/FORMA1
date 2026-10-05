@echo off
REM FormSign: run on this Windows computer for testing.
REM Needs Python 3.10+ from https://www.python.org/downloads/ (tick "Add python.exe to PATH" when installing).
cd /d "%~dp0"
where python >nul 2>nul || (echo Python isn't installed. Get it from https://www.python.org/downloads/ and run this again. & pause & exit /b 1)
if not exist .venv (python -m venv .venv)
call .venv\Scripts\activate.bat
pip install -q -r requirements.txt || (echo Installing packages failed. & pause & exit /b 1)
if "%ADMIN_PASSWORD%"=="" set ADMIN_PASSWORD=test
if "%BUSINESS_NAME%"=="" set BUSINESS_NAME=Miter Consulting
set SECRET_KEY=local-test-key
echo.
echo FormSign is running. Sign in at http://localhost:5000 with password: %ADMIN_PASSWORD%
echo Keep this window open. Close it to stop.
start "" http://localhost:5000
python app.py
