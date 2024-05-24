@echo off

echo Start updating:
echo "==========GET LIST OF FILES IN FTP SERVER========="


mkdir C:\Users\%USERNAME%\temporaryauto\

curl ftp://--put your ftp url here --/profile/mods/1.txt >> 2.txt

echo "==========DOWNLOADING FILES========="

for /F "tokens=*" %%A in (2.txt) do curl --remote-name --output-dir C:\Users\%USERNAME%\temporaryauto\ ftp://-- put your ftp url here --/profile/mods/%%A

echo "==========GETTING MOD FOLDER========="

for /f usebackq %%a in (
    `powershell -command "[Environment]::GetFolderPath('Personal')"`
) do (set "docs_folder=%%a")
echo %docs_folder%

echo "==========MOVED TO MODS========="


copy "C:\Users\%USERNAME%\temporaryauto\*.*" "%docs_folder%\My Games\FarmingSimulator2022\mods"

echo "==========DELETING OLD FILES========="


del /s /q C:\Users\%USERNAME%\temporaryauto\*.*
del 2.txt

echo "==========DONE========="
pause

