@echo off
cd ..
rem create a loop
:fullLoop

rem Launch the HEMTT server
hemtt.exe launch server

rem Check if the process gives an error
if errorlevel 1 goto armaClosed

rem Sleep for 5 seconds
timeout /t 5 >nul

rem Launch the Arma 3 clients (2 clients)
hemtt.exe launch player -i 2 -Q

rem sleep for 5 seconds
timeout /t 5 >nul

rem Check every 1 second if Arma 3 is still running
:loop
tasklist /fi "imagename eq arma3_x64.exe" | find /i /n "arma3_x64.exe" >nul
if errorlevel 1 goto armaClosed
timeout /t 1 >nul
goto loop
:armaClosed

rem Restart options
ECHO 1.Restart only
ECHO 2.Close
ECHO.

CHOICE /C 12 /M "Select an option: "
IF ERRORLEVEL 2 GOTO stopDebug
IF ERRORLEVEL 1 GOTO fullLoop

:stopDebug
exit