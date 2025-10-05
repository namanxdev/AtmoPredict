@echo off
echo ============================================
echo Starting Hybrid Weather Forecast System
echo ============================================
echo.

REM Activate virtual environment if it exists
if exist venv\Scripts\activate.bat (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo Warning: Virtual environment not found.
    echo Run INSTALL_FIRST.bat to set up environment.
    echo.
    pause
    exit /b 1
)

echo.
echo Starting API server on http://127.0.0.1:8081
echo.
echo Available endpoints:
echo   - POST /forecast/hybrid (Main hybrid forecast)
echo   - POST /forecast (Compatibility wrapper)
echo   - GET /climate/summary (Climate information)
echo   - GET /docs (API documentation)
echo.
echo Press Ctrl+C to stop the server
echo ============================================
echo.

REM Start the API server
python -m uvicorn src.api:app --host 127.0.0.1 --port 8081 --reload

pause
