@echo off

REM Top-level installer-picker.

setlocal

REM remember dir where this script lives
set mainpath=%~dp0
set scriptspath=%mainpath%quakestarter_scripts\

REM see if .Net/PowerShell are ok, and check for curl
call :dependencies_check

:menu

REM re-read config each time we come back to menu in case it was edited
call "%scriptspath%_quakestarter_cfg_defaults.cmd"
if exist "%scriptspath%_quakestarter_cfg.cmd" (
  echo A _quakestarter_cfg.cmd file was found in the quakestarter_scripts folder.
  echo That's not the right place for it! The _quakestarter_cfg_defaults.cmd file
  echo does live in the quakestarter_scripts folder, but if you want to define
  echo custom settings then your own personalized _quakestarter_cfg.cmd file must
  echo be in the same folder as quakestarter.cmd. I.e. you should put it at:
  echo   %mainpath%_quakestarter_cfg.cmd
  echo.
  pause
  goto :eof
)
if exist "%mainpath%_quakestarter_cfg.cmd" (
  call "%mainpath%_quakestarter_cfg.cmd"
)

cls
echo.
echo Basic setup:
echo  1: Find ^& copy pak files ^(game data^) on this computer
echo  2: Find soundtrack music files on this computer or download
echo.
echo Additional episodes/hubs:
echo  3: The New Hotness ^(2020; ratings in flux^)
echo  4: Post-AD ^(after the first Arcane Dimensions release; 2016-2019^)
echo  5: Modern ^(after Nehahra; 2000-2015^)
echo  6: Classic
echo.
echo Other highly-rated releases:
echo  7: The New Hotness ^(2020; ratings in flux^)
echo  8: The Age of Jams ^(2014-2019^)
echo  9: Post-Quoth ^(after the first Quoth release; 2006-2013^)
echo 10: Classic
echo.
set menu_choice=:eof
set /p menu_choice=choose a number or just press Enter to exit:
echo.
goto %menu_choice%

:1
call "%scriptspath%install_pakfiles.cmd"
goto :menu

:2
call "%scriptspath%install_music.cmd"
goto :menu

:3
call "%scriptspath%install_latest_episodes.cmd"
goto :menu

:4
call "%scriptspath%install_post_ad_episodes.cmd"
goto :menu

:5
call "%scriptspath%install_modern_episodes.cmd"
goto :menu

:6
call "%scriptspath%install_classic_episodes.cmd"
goto :menu

:7
call "%scriptspath%install_other_latest.cmd"
goto :menu

:8
call "%scriptspath%install_other_aoj.cmd"
goto :menu

:9
call "%scriptspath%install_other_post_quoth.cmd"
goto :menu

:10
call "%scriptspath%install_other_classic.cmd"
goto :menu


REM function used above to check for dependencies
:dependencies_check
powershell.exe -nologo -noprofile -command "&{trap{exit 1;} Add-Type -A 'System.IO.Compression.FileSystem';}" >nul 2>&1
if not %errorlevel% equ 0 (
  echo The installed version of the .Net Framework ^(and/or of PowerShell^) must
  echo be updated. See the basic\1_setup.txt readme file for more details.
  echo.
  pause
  goto :eof
)
curl -V >nul 2>&1
if %errorlevel% equ 0 (
  set hascurl=true
) else (
  set hascurl=false
)
