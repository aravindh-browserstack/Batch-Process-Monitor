@ECHO OFF
:: Name: restartprocess.cmd
:: Purpose: Restarts a process if not running

SETLOCAL ENABLEEXTENSIONS
SET procname=%~1
IF "%procname%" == "" GOTO :END

FOR /F "tokens=*" %%f in ('dir "C:\" /b /s ^| find "%procname%"') do (
  SET pname=%%f
)

:REPEAT

TASKLIST | find "%procname%" > NUL
IF %ERRORLEVEL% NEQ 0 (
  IF "%pname%" == "" (
    GOTO :END
  )
  echo "Restarting process.."
  START "" "%pname%"
)

timeout /t 1 /nobreak > NUL

GOTO :REPEAT
ENDLOCAL

:END
echo "Process Executable not found !"
EXIT /B 1
