:: If your school requires you to log in for a spefic amount of time change the 2nd timeout in run to the amount of seconds it is required for attendance to count
:: If this file is in startup change FILELOCATION_HERE to where you unzipped the files to. 
:: If you DO NOT want your computer to turn off after the 3rd timeout delete line 22
@echo off

:st
title CrazyKitty school.bat
:sources
set school=YOUR_SCHOOL_LOGIN_SITE_HERE
set input=FILELOCATION_HERE\input.vbs

IF NOT EXIST "config.bat" goto nosources
IF EXIST "config.bat" call "config.bat" goto run

:run
cd C:\Program Files\Google\Chrome\Application
start chrome.exe -e "%school%"
TIMEOUT /t 7
pushd %~dp0
cscript %input%
TIMEOUT /t 300
echo Shutting down...
TIMEOUT /t 2
shutdown /s /f /t 0

exit /b

:nosources
echo The config file is missing
@TIMEOUT /t 2 /nobreak > nul
cls
goto sources