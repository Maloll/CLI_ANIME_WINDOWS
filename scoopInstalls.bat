@echo off

set "ESC="
set "V=%ESC%[38;2;172;252;151m"
set "B=%ESC%[94m"
set "O=%ESC%[33m"
set "J=%ESC%[93m"
set "RD=%ESC%[91m"
set "R=%ESC%[0m"

title Installation des logiciels

set FILTER=ForEach-Object { if ($_ -match 'Download: \[#') { Write-Host $_.ToString().Trim() } elseif ($_ -match 'Extracting') { Write-Host $_.ToString().Trim() } }

:: Une ligne par package
echo %O%[%R%1/6%O%] %B%Installation de aria2...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install aria2 2>&1 | %FILTER% }" 2>&1 
if exist "%USERPROFILE%\scoop\apps\aria2" (
    echo %O%[%R%OK%O%]%R% %V%aria2 installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%aria2 n'a pas ete correctement installe.%R%
)

echo %O%[%R%2/6%O%] %B%Installation de mpv...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install mpv 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\mpv" (
    echo %O%[%R%OK%O%]%R% %V%mpv installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%mpv n'a pas ete correctement installe.%R%
)

echo %O%[%R%3/6%O%] %B%Installation de yt-dlp...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install yt-dlp 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\yt-dlp" (
    echo %O%[%R%OK%O%]%R% %V%yt-dlp installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%yt-dlp n'a pas ete correctement installe.%R%
)

echo %O%[%R%4/6%O%] %B%Installation de ffmpeg...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install ffmpeg 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\ffmpeg" (
    echo %O%[%R%OK%O%]%R% %V%ffmpeg installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%ffmpeg n'a pas ete correctement installe.%R%
)

echo %O%[%R%5/6%O%] %B%Installation de syncplay...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install syncplay 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\syncplay" (
    echo %O%[%R%OK%O%]%R% %V%syncplay installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%syncplay n'a pas ete correctement installe.%R%
)

echo %O%[%R%6/6%O%] %B%Installation de ani-cli...%R%
powershell -Command "& { & %USERPROFILE%\scoop\shims\scoop.cmd install ani-cli 2>&1 | %FILTER% }" 2>&1
if exist "%USERPROFILE%\scoop\apps\ani-cli" (
    echo %O%[%R%OK%O%]%R% %V%ani-cli installe.%R%
) else (
    echo %O%[%R%XXX%O%]%R% %RD%ani-cli n'a pas ete correctement installe.%R%
)

echo.
echo %V%[OK] Installation terminee.%R%
timeout 3