@ECHO OFF
:: Name: restartprocess.cmd
:: Purpose: Restarts a process if not running

SETLOCAL ENABLEEXTENSIONS
SET searchst=%~1
IF "%searchst%" == "" GOTO :END

SET workingdir=%~2
IF "%workingdir%" == "" GOTO :END

SET pname=""
:REPEAT

SET appname=""

FOR /F "tokens=2 delims=," %%i in ('wmic process get CommandLine /format:csv ^| find "%searchst%" ^| find /V "find"') do ( set appname=%%i )

IF NOT "%appname%" == """" (
    SET pname=%appname%
)

IF NOT "%pname%" == """" (
  IF "%appname%" == """" (
  cd %workingdir% 
  START %pname% 
 )
)
timeout /t 1 /nobreak > NUL

GOTO :REPEAT
ENDLOCAL

:END
echo "Invalid input parameters !"
EXIT /B 1
