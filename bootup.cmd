@ECHO OFF

SETLOCAL ENABLEEXTENSIONS

START "" C:\Users\aravi\Documents\GitHub\batch_restart\Batch-Process-Restarter\restart.cmd 8000 C:\Users\aravi\Documents\Github\start_stop_server\windows
START cmd.exe /c "cd C:\Users\aravi\Documents\Github\start_stop_server\windows && .\app.rb -p 8000"

ENDLOCAL