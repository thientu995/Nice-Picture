@echo off
rem Tai model AI (khoang 270 MB) ve thu muc Chon-Anh\models
rem Can Windows 10/11 (co san curl) va ket noi mang. Chay 1 lan la du.
setlocal
cd /d "%~dp0"
set "DIR=Chon-Anh\models"
set "BASE=https://github.com/thientu995/Nice-Picture/releases/download/v2.2.1"
if not exist "%DIR%" mkdir "%DIR%"

call :get emotion_quantized.onnx
call :get kawai_aesthetic_i8.onnx

echo.
echo Hoan tat. Mo Chon-Anh-Dep.exe de su dung.
pause
exit /b

:get
if exist "%DIR%\%~1" (
    echo [OK] %~1 da co san
    goto :eof
)
echo Dang tai %~1 ...
curl -L --fail --retry 3 --progress-bar -o "%DIR%\%~1.part" "%BASE%\%~1"
if errorlevel 1 (
    echo [LOI] tai %~1 that bai — thu lai hoac kiem tra mang.
    del "%DIR%\%~1.part" 2>nul
    goto :eof
)
move /y "%DIR%\%~1.part" "%DIR%\%~1" >nul
echo [OK] %~1
goto :eof
