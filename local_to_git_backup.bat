@echo off
TITLE Git Backup Tool — SirVikas/vikas
SET "GIT_SHELL=C:\Program Files\Git\bin\sh.exe"
SET "REPO_URL=https://github.com/SirVikas/vikas.git"

IF NOT EXIST "%GIT_SHELL%" (
    echo Error: Git for Windows nahi mila!
    pause
    exit
)

:: Local folder chunne ka dialog
for /f "usebackq delims=" %%I in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.FolderBrowserDialog; $f.Description = 'Woh folder chunein jise GitHub par backup karna hai'; if($f.ShowDialog() -eq 'OK'){$f.SelectedPath}"`) do set "LOCAL_PATH=%%I"
if "%LOCAL_PATH%"=="" (
    echo Koi folder nahi chuna. Bahar ja raha hun.
    pause
    exit
)

echo.
echo Backup shuru ho raha hai...
echo Folder : %LOCAL_PATH%
echo Repo   : %REPO_URL%
echo.

:: Git init, add, commit aur push
"%GIT_SHELL%" -c "cd '%LOCAL_PATH%'; if [ ! -f '.gitignore' ]; then echo 'venv/' > .gitignore; echo '.venv/' >> .gitignore; echo '__pycache__/' >> .gitignore; echo '*.pyc' >> .gitignore; fi; if [ ! -d '.git' ]; then git init; fi; git add .; git commit -m 'Backup: $(date)' || echo 'Koi naya change nahi mila — commit skip kiya'; git branch -M main; git remote add origin '%REPO_URL%' 2>/dev/null || git remote set-url origin '%REPO_URL%'; git push -u origin main --force"

if %ERRORLEVEL%==0 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Backup Successful!`nRepo: github.com/SirVikas/vikas', 'Backup Complete', 'OK', 'Information')"
) else (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Backup mein kuch gadbad hui! Upar ki error dekhen.', 'Backup Failed', 'OK', 'Error')"
)
pause
