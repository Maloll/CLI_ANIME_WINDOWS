@echo off

title Installation du setup [0/6]

set "ESC="
set "V=%ESC%[38;2;172;252;151m"
set "B=%ESC%[94m"
set "O=%ESC%[33m"
set "J=%ESC%[93m"
set "RD=%ESC%[91m"
set "R=%ESC%[0m"

set FILTER=ForEach-Object { if ($_ -match 'Download: \[#') { Write-Host $_.ToString().Trim() } elseif ($_ -match 'Extracting') { Write-Host $_.ToString().Trim() } }

echo --- LOGS du %date% %time% --- > logs.txt
echo %B%[*] Installation du setup en cours...%R%

:: Installation de Scoop (silencieux)
title Installation du setup [1/6]
echo %O%[%R%1/6%O%] %B%Installation de Scoop...%R%
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >>logs.txt 2>&1
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression" >>logs.txt 2>&1

if exist "%USERPROFILE%\scoop\shims\scoop.cmd" (
    echo %O%[%R%OK%O%]%R% %V%Scoop installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%Scoop n'a pas ete correctement installe.%R%
    pause
    exit
)

echo %O%[%R%2/6%O%] %B%Installation de git...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install git 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\git" (
    echo %O%[%R%OK%O%]%R% %V%git installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%git n'a pas ete correctement installe.%R%
)

:: Ajout du bucket (silencieux)
title Installation du setup [2/6]
echo %O%[%R%2/6%O%] %B%Ajout du bucket extras...%R%
call %USERPROFILE%\scoop\shims\scoop.cmd bucket add extras >>logs.txt 2>&1
if exist "%USERPROFILE%\scoop\buckets\extras" (
    echo %O%[%R%OK%O%]%R% %V%Bucket extras ajoute.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%Bucket extras n'a pas ete correctement ajoute.%R%
    pause
    exit
)

:: Installation des logiciels (silencieux)
title Installation du setup [3/6]
echo %O%[%R%3/6%O%] %B%Installation des logiciels...%R%

start "Installation des logiciels" /wait cmd /c "scoopInstalls.bat"

echo %O%[%R%OK%O%]%R% %V%Logiciels installes.%R%

:: --- CONFIGURATION MPV ---
title Installation du setup [4/6]
echo %O%[%R%4/6%O%] %B%Configuration de MPV...%R%

set "MPV_TARGET=%USERPROFILE%\scoop\apps\mpv\current\portable_config"
if not exist "%MPV_TARGET%" mkdir "%MPV_TARGET%" >>logs.txt 2>&1

copy /y "config\mpv.zip" "%MPV_TARGET%\mpv.zip" >>logs.txt 2>&1
powershell -Command "Expand-Archive -Path '%MPV_TARGET%\mpv.zip' -DestinationPath '%MPV_TARGET%' -Force" >>logs.txt 2>&1
del "%MPV_TARGET%\mpv.zip" >>logs.txt 2>&1

echo %O%[%R%OK%O%]%R% %V%Configuration MPV appliquee.%R%

:: --- CONFIGURATION SYNCPLAY ---
title Installation du setup [5/6]
echo %O%[%R%5/6%O%] %B%Configuration de Syncplay...%R%

set "SYNCPLAY_PERSIST=%USERPROFILE%\scoop\persist\syncplay"
if not exist "%SYNCPLAY_PERSIST%" mkdir "%SYNCPLAY_PERSIST%" >>logs.txt 2>&1
copy /y "config\syncplay.ini" "%SYNCPLAY_PERSIST%\syncplay.ini" >>logs.txt 2>&1

powershell -Command "(Get-Content '%SYNCPLAY_PERSIST%\syncplay.ini') -replace 'playerpath = NULL', 'playerpath = %USERPROFILE%\scoop\apps\mpv\current\mpv.exe' | Set-Content '%SYNCPLAY_PERSIST%\syncplay.ini'" >>logs.txt 2>&1


echo %O%[%R%OK%O%]%R% %V%Configuration Syncplay appliquee.%R%

echo.
echo ==================================================
echo %V%     TOUT EST INSTALLE ET PRET A L'EMPLOI ! %R%
echo ==================================================
pause