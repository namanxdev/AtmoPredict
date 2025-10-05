@echo off
echo ============================================
echo Testing Hybrid Forecast System
echo ============================================
echo.

REM Activate virtual environment if it exists
if exist venv\Scripts\activate.bat (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
)

REM Run the test script
echo Running tests...
python test_hybrid_forecast.py

echo.
echo ============================================
echo Tests complete!
echo ============================================
pause
