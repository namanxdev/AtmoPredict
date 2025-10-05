@echo off
echo ============================================
echo Starting Hybrid Weather Forecast Frontend
echo ============================================
echo.

REM Check if Python HTTP server is available
python --version >nul 2>&1
if errorlevel 1 (
    echo Python not found! Please install Python first.
    pause
    exit /b 1
)

echo Starting local web server on http://localhost:8000
echo.
echo IMPORTANT: Make sure the API backend is running!
echo Start backend: START_HYBRID_API.bat
echo.
echo Open your browser to:
echo http://localhost:8000/frontend/hybrid_forecast.html
echo.
echo Press Ctrl+C to stop the server
echo ============================================
echo.

REM Start Python HTTP server in the project root
cd /d "%~dp0.."
python -m http.server 8000

pause
