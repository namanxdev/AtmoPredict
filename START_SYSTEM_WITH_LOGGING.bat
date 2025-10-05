@echo off
color 0A
echo ============================================================
echo   WEATHER INTELLIGENCE SYSTEM - ENHANCED LOGGING
echo ============================================================
echo.
echo This script will start the backend API with detailed logging
echo You'll see every request in the terminal!
echo.
echo ============================================================
echo.

REM Activate virtual environment
if exist venv\Scripts\activate.bat (
    echo [1/3] Activating virtual environment...
    call venv\Scripts\activate.bat
    echo       ✅ Virtual environment activated
    echo.
) else (
    echo ❌ Virtual environment not found!
    echo Please run INSTALL_FIRST.bat first
    pause
    exit /b 1
)

echo [2/3] Starting Backend API Server...
echo.
echo ============================================================
echo   Backend API: http://127.0.0.1:8081
echo   API Docs:    http://127.0.0.1:8081/docs
echo ============================================================
echo.
echo   📡 Request Logging: ENABLED
echo   You will see detailed logs for every request:
echo      - Incoming requests with method and path
echo      - Query parameters
echo      - Response status codes
echo.
echo ============================================================
echo.

echo [3/3] Starting server with reload enabled...
echo.
echo ⚠️  IMPORTANT: Keep this terminal open!
echo    Open a NEW terminal to start the frontend
echo.
echo    Frontend Command:
echo    cd Frontend_nasa
echo    npm run dev
echo.
echo ============================================================
echo.

python -m uvicorn src.api:app --host 127.0.0.1 --port 8081 --reload --log-level info

pause
