@echo off
set IMAGE=lucky-mpd:latest
set OUTPUT=lucky-mpd.tar

echo.
echo === Building %IMAGE% for Raspberry Pi (linux/arm64) ===
echo.

docker buildx build ^
    --platform linux/arm64 ^
    -t %IMAGE% ^
    --load .

if errorlevel 1 (
    echo.
    echo BUILD FAILED
    pause
    exit /b 1
)

echo.
echo === Exporting image ===
echo.

docker save -o %OUTPUT% %IMAGE%

if errorlevel 1 (
    echo.
    echo EXPORT FAILED
    pause
    exit /b 1
)

echo.
echo === DONE ===
echo Image: %IMAGE%
echo File:  %OUTPUT%
echo.

pause
