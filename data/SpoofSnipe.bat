@echo off
color 0B
title SpoofSnipe
echo SpoofSnipe - Press any key to spoof
pause >nul

echo Starting loader...
start "" "%~dp0Loader.exe"
timeout /t 1 >nul

echo.

setlocal enabledelayedexpansion
set "progress=0"

:loading
cls
echo Spoofing in progress...

REM Mensajes simulando spoofing
if %progress% lss 20 echo Spoofing motherboard...
if %progress% lss 40 if %progress% geq 20 echo Spoofing RAM...
if %progress% lss 60 if %progress% geq 40 echo Spoofing disk...
if %progress% lss 80 if %progress% geq 60 echo Spoofing motherboard offsets...
if %progress% geq 80 echo Finalizing spoofing process...

REM Barra de progreso
set "bar=["
for /L %%A in (1,1,%progress%) do set "bar=!bar!#"
for /L %%B in (%progress%,1,100) do set "bar=!bar! "
set "bar=!bar!]"

REM Mostrar progreso
echo !bar! %progress%%

REM Incrementar el progreso
set /a progress+=2
timeout /t 1 >nul

REM Seguir hasta completar
if %progress% lss 100 goto loading

cls
echo Spoof complete! System spoofed successfully.
echo Please restart your system.
echo If you paid for this, you have been scammed!
pause >nul
exit
