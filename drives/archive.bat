cd /d "%~dp0"
call diskOn.bat
timeout /t 10 /nobreak >nul
call date_today.bat
timeout /t 10 /nobreak >nul
call diskOff.bat
