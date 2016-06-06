@ECHO OFF

cd "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
xcopy "%USERPROFILE%\Documents\Github\batch_restart\Batch-Process-Restarter\bootup.cmd"
