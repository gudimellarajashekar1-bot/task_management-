@echo off
echo.
echo  ========================================
echo   TaskFlow — Starting Development Server
echo  ========================================
echo.

:: Start backend
echo [1/2] Starting backend server (port 3001)...
start "TaskFlow Backend" cmd /k "cd /d %~dp0server && npm run dev"

:: Wait 3 seconds for backend to initialize
timeout /t 3 /nobreak >nul

:: Start frontend
echo [2/2] Starting frontend (port 5173)...
start "TaskFlow Frontend" cmd /k "cd /d %~dp0client && npm run dev"

echo.
echo  App will be available at: http://localhost:5173
echo  API running at:           http://localhost:3001
echo.
pause
