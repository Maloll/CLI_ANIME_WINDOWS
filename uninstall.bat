@echo off

set "ESC="
set "V=%ESC%[38;2;172;252;151m"
set "B=%ESC%[94m"
set "O=%ESC%[33m"
set "J=%ESC%[93m"
set "RD=%ESC%[91m"
set "R=%ESC%[0m"

echo ==================================================
echo %O%DESINSTALLATION%R% DU SETUP MPV %O%^|%R% SYNCPLAY %O%^|%R% ANI-CLI%R%
echo ==================================================

set /p "CONFIRM=%RD%Voulez-vous vraiment tout desinstaller ? %O%[%R%O/N%O%]%R% : "
if /i "%CONFIRM%" neq "O" (
    echo %B%Desinstallation annulee.%R%
    timeout /t 3 >nul
    exit /b
)

:: Mise a jour du PATH pour etre sur que scoop est reconnu
set "PATH=%USERPROFILE%\scoop\shims;%PATH%"


call scoop uninstall ani-cli syncplay mpv yt-dlp ffmpeg git 2>nul


if exist "%USERPROFILE%\scoop\persist\mpv" (
    rd /s /q "%USERPROFILE%\scoop\persist\mpv"
)
if exist "%USERPROFILE%\scoop\persist\syncplay" (
    rd /s /q "%USERPROFILE%\scoop\persist\syncplay"
)


set /p "CONFIRM2=%RD%Voulez-vous desinstaller Scoop ? %O%[%R%O/N%O%]%R% : "
if /i "%CONFIRM2%" == "O" (
    echo %O%Suppression de Scoop et du dossier racine...%R%
    :: Commande PowerShell pour desinstaller Scoop proprement
    powershell -Command "scoop uninstall scoop" 2>nul

    :: Nettoyage final du dossier scoop s'il reste des residus
    if exist "%USERPROFILE%\scoop" (
        rd /s /q "%USERPROFILE%\scoop"
    )
)



echo.
echo ====================================================================
echo   DESINSTALLATION TERMINEE ! LE SYSTEME EST PROPRE.
echo ====================================================================
pause