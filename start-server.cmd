@echo off

echo Loading files...
timeout 2 > NUL
YOUR PATH\dlls\FXServer.exe +exec YOURPATH\server.cfg +set onesync on 1
