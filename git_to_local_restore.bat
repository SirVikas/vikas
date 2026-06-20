@echo off
TITLE Git Restore Tool — SirVikas/vikas
SET "GIT_SHELL=C:\Program Files\Git\bin\sh.exe"
SET "REPO_URL=https://github.com/SirVikas/vikas.git"

IF NOT EXIST "%GIT_SHELL%" (
    echo Error: Git for Windows nahi mila!
    pause
    exit
)

:: Target folder chunne ka dialog
for /f "usebackq delims=" %%I in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.FolderBrowserDialog; $f.Description = 'Woh folder chunein jahan GitHub se files restore karni hain'; if($f.ShowDialog() -eq 'OK'){$f.SelectedPath}"`) do set "TARGET_DIR=%%I"
if "%TARGET_DIR%"=="" (
    echo Koi folder nahi chuna. Bahar ja raha hun.
    pause
    exit
)

echo.
echo Restore shuru ho raha hai...
echo Folder : %TARGET_DIR%
echo Repo   : %REPO_URL%
echo.

:: Clone ya pull karna
"%GIT_SHELL%" -c "cd '%TARGET_DIR%'; if [ -d '.git' ]; then git pull origin main; else git clone '%REPO_URL%' .; fi"

if %ERRORLEVEL%==0 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore Complete!`nFiles yahan save hain:`n%TARGET_DIR%', 'Restore Complete', 'OK', 'Information')"
) else (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore mein kuch gadbad hui! Upar ki error dekhen.', 'Restore Failed', 'OK', 'Error')"
)
pause
