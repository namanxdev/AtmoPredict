@echo off
echo ========================================================
echo   HYBRID WEATHER FORECAST - COMPLETE SYSTEM STARTUP
echo ========================================================
echo.
echo This will start both the backend API and frontend web server
echo.
echo Step 1: Starting Backend API on http://127.0.0.1:8081
echo Step 2: Starting Frontend on http://localhost:8000
echo.
echo ========================================================
echo.

REM Activate virtual environment if it exists
if exist venv\Scripts\activate.bat (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo Warning: Virtual environment not found.
    echo Run INSTALL_FIRST.bat to set up environment.
    pause
    exit /b 1
)

echo.
echo Starting backend API server...
echo.

REM Start backend API in a new window
start "Hybrid Forecast API - http://127.0.0.1:8081" cmd /k "venv\Scripts\activate.bat && python -m uvicorn src.api:app --host 127.0.0.1 --port 8081 --reload"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

echo.
echo Backend API started in new window!
echo.
echo Starting frontend web server...
echo.

REM Start frontend server in a new window
start "Hybrid Forecast Frontend - http://localhost:8000" cmd /k "python -m http.server 8000"

REM Wait a moment for frontend to start
timeout /t 2 /nobreak >nul

echo.
echo ========================================================
echo   ✅ SYSTEM STARTED SUCCESSFULLY!
echo ========================================================
echo.
echo Backend API:  http://127.0.0.1:8081
echo API Docs:     http://127.0.0.1:8081/docs
echo.
echo Frontend App: http://localhost:8000/frontend/hybrid_forecast.html
echo.
echo ========================================================
echo.
echo Opening frontend in your default browser...
echo.

REM Open the frontend in default browser
start http://localhost:8000/frontend/hybrid_forecast.html

echo.
echo ========================================================
echo   IMPORTANT NOTES:
echo ========================================================
echo.
echo 1. Two new windows have opened:
echo    - Backend API window (keep it running)
echo    - Frontend Server window (keep it running)
echo.
echo 2. Your browser should open automatically
echo    If not, manually open:
echo    http://localhost:8000/frontend/hybrid_forecast.html
echo.
echo 3. To stop the system:
echo    - Close both server windows
echo    - Or press Ctrl+C in each window
echo.
echo 4. Quick Test:
echo    - Search for "Mumbai" or "New York"
echo    - Load 5-day forecast
echo    - Load 6-month forecast
echo.
echo ========================================================
echo.
echo Press any key to close this window...
echo (The servers will continue running in other windows)
echo.
pause
