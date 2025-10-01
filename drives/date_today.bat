@REM взима файлове от дадена папка търсейки форма на дата 2024_04_17 и завършващи с .zip

@echo off
setlocal

:: Set the source and destination directories
set "src=D:\Archive"
set "dst=E:\Archive"

:: Get today's date in YYYY-MM-DD format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set "datetime=%%I"
set "onlyDay=%datetime:~0,4%_%datetime:~4,2%_%datetime:~6,2%"
set "today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%.%datetime:~10,2%"

:: Copy the source directory to the destination directory
xcopy /h /i /c /k /e /r /y "%src%\*%onlyDay%*.zip" "%dst%\%today%"

:: Count the number of directories in the destination directory
for /f %%A in ('dir /b /ad "%dst%" ^| find /v /c ""') do set "count=%%A"

:: If there are more than 3 directories, delete the oldest one
if %count% gtr 3 (
    for /f "delims=" %%I in ('dir /b /ad /o:d "%dst%"') do (
        set "oldest=%%I"
        goto continue
    )
    :continue
    rd /s /q "%dst%\%oldest%"
)

endlocal