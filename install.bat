@echo off
set "ESC="
set "V=%ESC%[92m"
set "B=%ESC%[94m"
set "O=%ESC%[33m"
set "J=%ESC%[93m"
set "R=%ESC%[0m"

echo --- Rapport d'erreurs du %date% %time% --- > error.log
echo %B%[*] Installation du setup en cours...%R%

:: Installation de Scoop (silencieux)
echo %O%[1/5] %B%Installation de Scoop...%R%
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >nul 2>> error.log
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression" >nul 2>> error.log
echo %O%[%R%OK%O%] %V%Scoop installe.%R%

:: Ajout du bucket (silencieux)
echo %O%[2/5] %B%Ajout du bucket extras...%R%
call scoop bucket add extras >nul 2>> error.log
echo %O%[%R%OK%O%] %V%Bucket extras ajoute.%R%

:: Installation des logiciels (silencieux)
:: C'est ici que ça prend du temps, mais rien ne s'affichera
echo %O%[3/5] %B%Installation des logiciels...%R%
call scoop install git mpv yt-dlp ffmpeg syncplay ani-cli aria2 >nul 2>> error.log
echo %O%[%R%OK%O%] %V%Logiciels installes.%R%

:: --- CONFIGURATION MPV ---
echo %O%[4/5] %B%Configuration de MPV...%R%
set "MPV_TARGET=%USERPROFILE%\scoop\apps\mpv\current\portable_config"
if not exist "%MPV_TARGET%" mkdir "%MPV_TARGET%" >nul 2>> error.log

copy /y "config\mpv.zip" "%MPV_TARGET%\mpv.zip" >nul 2>> error.log
powershell -Command "Expand-Archive -Path '%MPV_TARGET%\mpv.zip' -DestinationPath '%MPV_TARGET%' -Force" >nul 2>> error.log
del "%MPV_TARGET%\mpv.zip" >nul 2>> error.log

echo %O%[%R%OK%O%] %V%Configuration MPV appliquee.%R%

:: --- CONFIGURATION SYNCPLAY ---
echo %O%[5/5] %B%Configuration de Syncplay...%R%
set "SYNCPLAY_PERSIST=%USERPROFILE%\scoop\persist\syncplay"
if not exist "%SYNCPLAY_PERSIST%" mkdir "%SYNCPLAY_PERSIST%" >nul 2>> error.log
copy /y "config\syncplay.ini" "%SYNCPLAY_PERSIST%\syncplay.ini" >nul 2>> error.log
echo %O%[%R%OK%O%] %V%Configuration Syncplay appliquee.%R%

echo.
echo %O%==================================================%R%
echo %V%       TOUT EST INSTALLE ET PRET A L'EMPLOI ! %R%
echo %O%==================================================%R%
pause