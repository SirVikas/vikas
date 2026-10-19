@echo off
setlocal
TITLE Git Backup Tool - SirVikas/vikas
SET "GIT=C:\Program Files\Git\cmd\git.exe"
SET "REPO_URL=https://github.com/SirVikas/vikas.git"
SET "BRANCH=main"

IF NOT EXIST "%GIT%" (
    echo Error: Git for Windows nahi mila! https://git-scm.com se install karein.
    pause
    exit /b 1
)

:: Local folder chunne ka dialog
for /f "usebackq delims=" %%I in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.FolderBrowserDialog; $f.Description = 'Woh folder chunein jise GitHub par backup karna hai'; if($f.ShowDialog() -eq 'OK'){$f.SelectedPath}"`) do set "LOCAL_PATH=%%I"
if "%LOCAL_PATH%"=="" (
    echo Koi folder nahi chuna. Bahar ja raha hun.
    pause
    exit /b 1
)

echo.
echo Backup shuru ho raha hai...
echo Folder : %LOCAL_PATH%
echo Repo   : %REPO_URL%
echo.

cd /d "%LOCAL_PATH%"
if errorlevel 1 goto FAIL_FOLDER

:: ---- 1. GitHub connection check (3 baar try) ----
SET /A TRY=0
:NETCHECK
SET /A TRY+=1
echo [%TRY%/3] GitHub connection check kar raha hun...
"%GIT%" ls-remote "%REPO_URL%" HEAD >nul 2>&1
if not errorlevel 1 goto NETOK
if %TRY%==1 ipconfig /flushdns >nul 2>&1
if %TRY% LSS 3 (
    timeout /t 5 /nobreak >nul
    goto NETCHECK
)
:: Asli error dikhane ke liye ek baar bina chhupaye chalao
"%GIT%" ls-remote "%REPO_URL%" HEAD >nul
goto FAIL_NET
:NETOK
echo Connection theek hai.
echo.

:: ---- 2. Folder ko GitHub repo se jodna ----
if exist ".git" goto HAVEGIT
echo Pehli baar: yeh folder GitHub repo se joda ja raha hai...
"%GIT%" init -q
"%GIT%" symbolic-ref HEAD refs/heads/%BRANCH%
"%GIT%" remote add origin "%REPO_URL%"
"%GIT%" fetch origin %BRANCH%
if errorlevel 1 goto FAIL_PUSH
"%GIT%" reset -q origin/%BRANCH%
if errorlevel 1 goto FAIL_GIT
:: Jo files GitHub par hain par is folder mein nahi, unhe wapas le aao
:: (taaki backup se GitHub ki koi file delete na ho)
"%GIT%" ls-files -d -z | "%GIT%" checkout-index -f -z --stdin
goto SYNC

:HAVEGIT
"%GIT%" remote get-url origin >nul 2>&1
if errorlevel 1 (
    "%GIT%" remote add origin "%REPO_URL%"
) else (
    "%GIT%" remote set-url origin "%REPO_URL%"
)
SET "CUR="
for /f "usebackq delims=" %%B in (`"%GIT%" branch --show-current`) do set "CUR=%%B"
if /i not "%CUR%"=="%BRANCH%" goto FAIL_BRANCH

:SYNC
:: ---- 3. Naam/email (commit ke liye zaroori) ----
"%GIT%" config user.name >nul 2>&1
if errorlevel 1 "%GIT%" config user.name "Vikas Gandhi"
"%GIT%" config user.email >nul 2>&1
if errorlevel 1 "%GIT%" config user.email "vikas@gandhi.im"

if not exist ".gitignore" (
    >".gitignore" echo venv/
    >>".gitignore" echo .venv/
    >>".gitignore" echo __pycache__/
    >>".gitignore" echo *.pyc
)

:: ---- 4. Apne changes commit karo ----
"%GIT%" add -A
if errorlevel 1 goto FAIL_GIT
"%GIT%" diff --cached --quiet
if not errorlevel 1 (
    echo Koi naya change nahi mila - commit skip kiya.
    goto PULL
)
"%GIT%" commit -q -m "Backup: %DATE% %TIME%"
if errorlevel 1 goto FAIL_GIT
echo Changes commit ho gaye.

:PULL
:: ---- 5. GitHub ke naye changes pehle le aao (merge; force push NAHI) ----
echo GitHub se naye changes la raha hun...
"%GIT%" pull --no-rebase --no-edit origin %BRANCH%
if errorlevel 1 goto FAIL_PULL

:: ---- 6. Push ----
echo GitHub par bhej raha hun...
"%GIT%" push -u origin %BRANCH%
if errorlevel 1 goto FAIL_PUSH

powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Backup Successful!`nRepo: github.com/SirVikas/vikas', 'Backup Complete', 'OK', 'Information')"
pause
exit /b 0

:FAIL_FOLDER
echo Folder khul nahi paya: %LOCAL_PATH%
goto FAILBOX

:FAIL_NET
echo.
echo ============================================================
echo  GitHub tak connection nahi ho paya.
echo  - "Could not resolve host" = internet / DNS problem:
echo      WiFi band-chalu karein, hotspot try karein, VPN band karein.
echo  - "Authentication failed" / "Repository not found" =
echo      GitHub login ki problem: Windows "Credential Manager" mein
echo      github.com wala entry hata kar dobara chalayein, login karein.
echo ============================================================
goto FAILBOX

:FAIL_BRANCH
echo.
echo Is folder mein abhi branch "%CUR%" chalu hai, "%BRANCH%" nahi.
echo Kuch nahi badla gaya. Pehle "%BRANCH%" branch par aayein, phir chalayein.
goto FAILBOX

:FAIL_PULL
"%GIT%" merge --abort >nul 2>&1
echo.
echo ============================================================
echo  GitHub par aur is folder mein EK HI file alag-alag badli hai
echo  (merge conflict). Kuch bhi delete ya overwrite NAHI hua.
echo  Aapka commit folder mein surakshit hai. Upar ki error ka
echo  screenshot Claude ko bhejein.
echo ============================================================
goto FAILBOX

:FAIL_PUSH
echo.
echo ============================================================
echo  GitHub par bhejna fail hua. Upar ki error dekhein:
echo  - "Authentication failed": GitHub login window mein login karein.
echo  - "exceeds GitHub's file size limit": 100 MB se badi file hai,
echo      use folder se hata dein ya .gitignore mein daal dein.
echo  - "Could not resolve host": internet / DNS problem.
echo  Aapka kaam folder mein commit ho chuka hai, kuch khoya nahi.
echo ============================================================
goto FAILBOX

:FAIL_GIT
echo.
echo Git command fail hua - upar ki error dekhein.
goto FAILBOX

:FAILBOX
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Backup mein kuch gadbad hui! Upar ki error dekhen.', 'Backup Failed', 'OK', 'Error')"
pause
exit /b 1
