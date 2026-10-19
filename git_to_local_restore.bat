@echo off
TITLE Git Restore Tool - SirVikas/vikas
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

:: Pehle check karo ki GitHub tak internet pahunch raha hai (3 baar try)
SET /A TRY=0
:NETCHECK
SET /A TRY+=1
echo [%TRY%/3] GitHub connection check kar raha hun...
"%GIT_SHELL%" -c "git ls-remote '%REPO_URL%' HEAD >/dev/null"
if %ERRORLEVEL%==0 goto NETOK
if %TRY%==1 (
    echo DNS cache saaf kar raha hun...
    ipconfig /flushdns >nul 2>&1
)
if %TRY% LSS 3 (
    timeout /t 5 /nobreak >nul
    goto NETCHECK
)
echo.
echo ============================================================
echo  GitHub tak connection nahi ho paya (internet / DNS problem).
echo  Yeh aapki files ya repo ki galti NAHI hai. Yeh karke dekhen:
echo   1. Browser mein https://github.com khol kar dekhen.
echo   2. WiFi band-chalu karein ya mobile hotspot try karein.
echo   3. VPN / proxy / antivirus web-shield ho to band karein.
echo   4. DNS 8.8.8.8 aur 1.1.1.1 set karein (WiFi adapter settings).
echo  Phir yeh tool dobara chalayein.
echo ============================================================
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('GitHub tak internet connection nahi hua (Could not resolve host).`nInternet / WiFi / DNS check karke dobara chalayein.', 'No Internet', 'OK', 'Warning')"
pause
exit

:NETOK
echo Connection theek hai.
echo.

:: Clone ya pull karna
:: - .git maujood hai  -> git pull
:: - folder khaali hai -> seedha usi folder mein clone
:: - folder mein pehle se files hain (bina .git) -> "vikas" sub-folder mein clone,
::   taaki purani files overwrite na hon
"%GIT_SHELL%" -c "cd '%TARGET_DIR%' || exit 1; if [ -d '.git' ]; then git pull origin main; elif [ -z \"$(ls -A)\" ]; then git clone '%REPO_URL%' .; else echo 'Folder khaali nahi hai - files vikas sub-folder mein restore hongi.'; if [ -d 'vikas/.git' ]; then cd vikas && git pull origin main; else git clone '%REPO_URL%' vikas; fi; fi"

if %ERRORLEVEL%==0 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore Complete!`nFiles yahan save hain:`n%TARGET_DIR%', 'Restore Complete', 'OK', 'Information')"
) else (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore mein kuch gadbad hui! Upar ki error dekhen.', 'Restore Failed', 'OK', 'Error')"
)
pause
