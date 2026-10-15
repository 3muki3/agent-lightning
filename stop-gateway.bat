@echo off
REM Stop Agent Lightning API Gateway (agl-server)
setlocal

echo Stopping agl-server.exe ...
taskkill /IM agl-server.exe /F >nul 2>&1
if errorlevel 1 (
    echo   no running agl-server found.
) else (
    echo   stopped.
)

echo Stopping agl-controller.exe ...
taskkill /IM agl-controller.exe /F >nul 2>&1
if errorlevel 1 (
    echo   no running agl-controller found.
) else (
    echo   stopped.
)

endlocal
