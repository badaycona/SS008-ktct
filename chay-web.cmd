@echo off
setlocal
rem ---------------------------------------------------------------------------
rem  Chay web "Ban tay vo hinh / ban tay huu hinh" (render day du qua HTTP server).
rem  Dung: nhay dup file nay, hoac:  chay-web.cmd 8080
rem ---------------------------------------------------------------------------
set PORT=%1
if "%PORT%"=="" set PORT=8080
set SITE=%~dp0ban-tay-web

where python >nul 2>nul
if errorlevel 1 (
  echo [LOI] Khong tim thay python tren he thong.
  pause
  exit /b 1
)
if not exist "%SITE%\index.html" (
  echo [LOI] Khong thay "%SITE%\index.html"
  pause
  exit /b 1
)

echo Dang khoi chay HTTP Server tai: %SITE%
echo Dia chi trinh duyet: http://127.0.0.1:%PORT%/index.html
echo.
echo Luu y:
echo  - Can co ket noi Internet de tai three.js, GSAP, Lenis, Google Fonts tu CDN.
echo  - Dong cua so nay hoac an Ctrl+C de tat server.
echo.
start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 2; Start-Process 'http://127.0.0.1:%PORT%/index.html'"
cd /d "%SITE%"
python -m http.server %PORT% --bind 127.0.0.1
