@echo off
setlocal

:: Set the source and destination directories
set "src=D:\Downloads\Files"
set "dst=D:\Downloads\Archive"

:: Get today's date in YYYY-MM-DD format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set "datetime=%%I"
@REM set "today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%"
set "today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%.%datetime:~10,2%"

:: Copy the source directory to the destination directory
xcopy /h /i /c /k /e /r /y "%src%" "%dst%\%today%"

:: Count the number of directories in the destination directory
for /f %%A in ('dir /b /ad "%dst%" ^| find /v /c ""') do set "count=%%A"

:: If there are more than 3 directories, delete the oldest one
:: /o:d get oldest - /o-d get newest
if %count% gtr 3 (
    for /f "delims=" %%I in ('dir /b /ad /o:d "%dst%"') do (
        set "oldest=%%I"
        goto continue
    )
    :continue
    rd /s /q "%dst%\%oldest%"
)

endlocal