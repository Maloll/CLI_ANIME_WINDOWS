@echo off
set "ESC="
set "V=%ESC%[38;2;172;252;151m"
set "B=%ESC%[94m"
set "O=%ESC%[33m"
set "J=%ESC%[93m"
set "R=%ESC%[0m"

echo --- Rapport d'erreurs du %date% %time% --- > error.log
echo %B%[*] Installation du setup en cours...%R%

:: Installation de Scoop (silencieux)
echo %O%[%R%1/5%O%] %B%Installation de Scoop...%R%
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >nul 2>> error.log
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression" >nul 2>> error.log
echo %O%[%R%OK%O%] %V%Scoop installe.%R%

:: Ajout du bucket (silencieux)
echo %O%[%R%2/5%O%] %B%Ajout du bucket extras...%R%

call scoop bucket add extras >nul 2>> error.log

echo %O%[%R%OK%O%] %V%Bucket extras ajoute.%R%

:: Installation des logiciels (silencieux)
:: C'est ici que ça prend du temps, mais rien ne s'affichera
echo %O%[%R%3/5%O%] %B%Installation des logiciels...%R%

start "Installation des logiciels" /wait cmd /c "scoop install git mpv yt-dlp ffmpeg syncplay ani-cli aria2 & timeout /t 3"

echo %O%[%R%OK%O%] %V%Logiciels installes.%R%

:: --- CONFIGURATION MPV ---
echo %O%[%R%4/5%O%] %B%Configuration de MPV...%R%

set "MPV_TARGET=%USERPROFILE%\scoop\apps\mpv\current\portable_config"
if not exist "%MPV_TARGET%" mkdir "%MPV_TARGET%" >nul 2>> error.log

copy /y "config\mpv.zip" "%MPV_TARGET%\mpv.zip" >nul 2>> error.log
powershell -Command "Expand-Archive -Path '%MPV_TARGET%\mpv.zip' -DestinationPath '%MPV_TARGET%' -Force" >nul 2>> error.log
del "%MPV_TARGET%\mpv.zip" >nul 2>> error.log

echo %O%[%R%OK%O%] %V%Configuration MPV appliquee.%R%

:: --- CONFIGURATION SYNCPLAY ---
echo %O%[%R%5/5%O%] %B%Configuration de Syncplay...%R%

set "SYNCPLAY_PERSIST=%USERPROFILE%\scoop\persist\syncplay"
if not exist "%SYNCPLAY_PERSIST%" mkdir "%SYNCPLAY_PERSIST%" >nul 2>> error.log
copy /y "config\syncplay.ini" "%SYNCPLAY_PERSIST%\syncplay.ini" >nul 2>> error.log

powershell -Command "(Get-Content '%SYNCPLAY_PERSIST%\syncplay.ini') -replace 'playerpath = NULL', 'playerpath = %USERPROFILE%\scoop\apps\mpv\current\mpv.exe' | Set-Content '%SYNCPLAY_PERSIST%\syncplay.ini'" >nul 2>> error.log


echo %O%[%R%OK%O%] %V%Configuration Syncplay appliquee.%R%

echo.
echo ==================================================
echo %V%     TOUT EST INSTALLE ET PRET A L'EMPLOI ! %R%
echo ==================================================
pause