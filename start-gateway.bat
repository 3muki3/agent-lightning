@echo off
REM Start Agent Lightning API Gateway (agl-server)
REM Docs: https://microsoft.github.io/agent-lightning/stable/
setlocal

cd /d "%~dp0"

set AGL_PORT=8181
if not "%~1"=="" set AGL_PORT=%~1

if not exist ".venv\Scripts\agl-server.exe" (
    echo [ERROR] .venv not found. Run setup first:
    echo         uv sync
    pause
    exit /b 1
)

echo Starting Agent Lightning API Gateway on port %AGL_PORT% ...
echo OpenAPI docs: http://127.0.0.1:%AGL_PORT%/docs
echo Press Ctrl+C to stop.
echo.

".venv\Scripts\agl-server.exe" port=%AGL_PORT%

endlocal
