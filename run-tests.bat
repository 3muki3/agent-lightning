@echo off
REM Run Agent Lightning test suite (CPU only, no GPU stack required).
REM
REM NO_PROXY is set on purpose: the local test servers listen on 127.0.0.1,
REM and a system HTTP proxy would hijack those requests and return 404/502,
REM producing false failures.
setlocal

cd /d "%~dp0"

set HTTP_PROXY=
set HTTPS_PROXY=
set http_proxy=
set https_proxy=
set NO_PROXY=127.0.0.1,localhost

if not exist ".venv\Scripts\python.exe" (
    echo [ERROR] .venv not found. Run: uv sync
    pause
    exit /b 1
)

echo Running tests: server + controller + client + package
echo (tests\verl and tests\examples need the GPU stack and are skipped)
echo.

".venv\Scripts\python.exe" -m pytest tests -q --ignore=tests/verl --ignore=tests/examples %*

endlocal
