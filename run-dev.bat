@echo off
REM ========================================================================
REM run-dev.bat
REM
REM Start Robot Framework tests in Windows/venv (zonder Docker).
REM - Activeert de .venv
REM - Gebruikt eventueel API_URL en SECRET_KEY uit System Properties
REM - Schrijft resultaten naar .\results\
REM ========================================================================

REM Ga naar projectmap
cd /d "%~dp0"

REM results-map maken
if not exist results mkdir results

REM venv activeren
call .\.venv\Scripts\activate.bat

REM (optioneel) fallback env vars als ze niet in System Properties staan
if "%API_URL%"=="" set API_URL=https://api.dev.local
if "%SECRET_KEY%"=="" set SECRET_KEY=dev-secret

REM Robot tests draaien
python -m robot -d results tests

endlocal
