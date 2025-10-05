@echo off
echo ============================================
echo   Weather Intelligence Dashboard Launcher
echo ============================================
echo.
echo Starting Backend API and Frontend Development Server...
echo.

REM Start the backend API in a new window
start "Backend API" cmd /k "cd /d %~dp0 && START_HYBRID_API.bat"

REM Wait a moment for backend to initialize
timeout /t 3 /nobreak > nul

REM Start the frontend in a new window
start "Frontend Dev Server" cmd /k "cd /d %~dp0Frontend_nasa && npm run dev"

echo.
echo ============================================
echo   Both services are starting...
echo   - Backend API: http://127.0.0.1:8081
echo   - Frontend:    http://localhost:5173
echo ============================================
echo.
echo Press any key to exit this launcher...
pause > nul
