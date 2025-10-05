@echo off
echo ============================================
echo Testing Backend Connection
echo ============================================
echo.
echo Testing if backend is responding...
echo.

curl -s http://127.0.0.1:8081/ && (
    echo.
    echo ✅ Backend is responding!
    echo.
    echo Now testing weather endpoint...
    curl -s "http://127.0.0.1:8081/weather/current?lat=23.2599&lon=77.4126"
    echo.
    echo.
    echo ✅ If you see JSON data above, backend is working!
    echo.
    echo Next steps:
    echo 1. Open a NEW terminal
    echo 2. Run: cd Frontend_nasa
    echo 3. Run: npm run dev
    echo 4. Open browser and check console
) || (
    echo.
    echo ❌ Backend is NOT responding
    echo.
    echo Please make sure START_HYBRID_API.bat is running
)

echo.
echo ============================================
pause
