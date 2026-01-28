@echo off
set "ESC="
set "VERT=%ESC%[92m"
set "BLEU=%ESC%[94m"
set "RESET=%ESC%[0m"
set "JAUNE=%ESC%[93m"

echo %BLEU%[*] Installation du setup en cours...%RESET%

:: Installation de Scoop (silencieux)
echo %JAUNE%[1/5]%RESET% %BLEU%Installation de Scoop...%RESET%
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >nul
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression" >nul

:: Ajout du bucket (silencieux)
echo %JAUNE%[2/5]%RESET% %BLEU%Ajout du bucket extras...%RESET%
call scoop bucket add extras >nul

:: Installation des logiciels (silencieux)
:: C'est ici que ça prend du temps, mais rien ne s'affichera
echo %JAUNE%[3/5]%RESET% %BLEU%Installation des logiciels...%RESET%
call scoop install git mpv yt-dlp ffmpeg syncplay ani-cli aria2 >nul
echo %VERT%[OK] Logiciels installes.%RESET%

:: --- CONFIGURATION MPV ---
echo %JAUNE%[4/5]%RESET% %BLEU%Configuration de MPV...%RESET%
set "MPV_TARGET=%USERPROFILE%\scoop\apps\mpv\current\portable_config"
if not exist "%MPV_TARGET%" mkdir "%MPV_TARGET%" >nul

copy /y "config\mpv.zip" "%MPV_TARGET%\mpv.zip" >nul
powershell -Command "Expand-Archive -Path '%MPV_TARGET%\mpv.zip' -DestinationPath '%MPV_TARGET%' -Force" >nul
del "%MPV_TARGET%\mpv.zip" >nul

echo %VERT%[OK] Configuration MPV appliquée.%RESET%

:: --- CONFIGURATION SYNCPLAY ---
echo %JAUNE%[5/5]%RESET% %BLEU%Configuration de Syncplay...%RESET%
set "SYNCPLAY_PERSIST=%USERPROFILE%\scoop\persist\syncplay"
if not exist "%SYNCPLAY_PERSIST%" mkdir "%SYNCPLAY_PERSIST%" >nul
copy /y "config\syncplay.ini" "%SYNCPLAY_PERSIST%\syncplay.ini" >nul
echo %VERT%[OK] Configuration Syncplay appliquée.%RESET%

echo.
echo %VERT%==================================================%RESET%
echo %VERT%       TOUT EST INSTALLE ET PRET A L'EMPLOI ! %RESET%
echo %VERT%==================================================%RESET%
pause