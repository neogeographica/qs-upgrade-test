@echo off

REM Installer for mapsets that fit the following criteria:
REM * released before Nehahra (in 2000)
REM * a start map and at least four non-startmaps
REM * Quaddicted user rating 3.85 or better (normalized Bayesian average)

REM Note that Nehahra is not included here because many Quake engines cannot
REM run it. See https://www.quaddicted.com/reviews/nehahra.html

setlocal

REM remember dir where this script lives
set scriptspath=%~dp0

REM find the basedir by looking for id1 folder here or above one level
set basedir=
pushd "%~dp0"
dir id1 /ad >nul 2>&1
if not %errorlevel% equ 0 (
  cd ..
  dir id1 /ad >nul 2>&1
)
if %errorlevel% equ 0 (
  set basedir=%cd%
)
popd
if "%basedir%"=="" (
  echo Couldn't find the id1 folder.
  pause
  goto :eof
)

:menu
set renamed_gamedir=
set review_page=
set base_game=
set patch_url=
set patch_required=false
set patch_skipfiles=
set patch2_url=
set patch2_required=false
set patch2_skipfiles=
set start_map=
set extra_launch_args=
set prelaunch_msg[0]=
set postlaunch_msg[0]=
set skip_quakerc_gen=false
set modsettings[0]=
set startdemos=
set junkdirs=
cls
call :installed_check prodigy_se
call :installed_check bbelief
call :installed_check mexx9
call :installed_check zer
echo.
echo Selected custom episodes/hubs released before mid-2000:
echo %is_prodigy_se_installed%  1: prodigy_se - Prodigy Special Edition ^(1997^)
echo %is_bbelief_installed%  2: bbelief - Beyond Belief ^(1997^)
echo %is_mexx9_installed%  3: mexx9 - Penumbra of Domination ^(1997^)
echo %is_zer_installed%  4: zer - Zerstoerer ^(1997^)
echo.
echo Note that Nehahra is not included here because many Quake engines cannot
echo run it. See https://www.quaddicted.com/reviews/nehahra.html
echo.
echo Enter a number to install/launch/manage one of the releases above.
echo.
echo Or, to just view its Quaddicted page, use Shift+Enter to submit your
echo choice; keep holding shift until the webpage opens.
echo.
set menu_choice=:eof
set /p menu_choice=enter your choice or just press Enter to exit:
echo.
goto %menu_choice%

:1
set start_map=start
call "%scriptspath%_handle_mod_choice.cmd" prodigy_se
goto :menu

:2
set patch_url=https://www.quaddicted.com/filebase/bbelief6_fix.zip
REM The map "start" here is just a copy of bbstart, so that we can run the
REM startdemos and then just break out by using the Single Player menu to
REM start a game.
set start_map=start
set startdemos=demo1 demo2 demo3
call "%scriptspath%_handle_mod_choice.cmd" bbelief
goto :menu

:3
set start_map=mexx9
set modsettings[0]=r_wateralpha 0.3
set modsettings[1]=
call "%scriptspath%_handle_mod_choice.cmd" mexx9
goto :menu

:4
set patch_url=https://www.quaddicted.com/filebase/zer11.zip
set patch2_url=https://www.quaddicted.com/filebase/zerend_fix.zip
set start_map=start
call "%scriptspath%_handle_mod_choice.cmd" zer
goto :menu


REM functions used above

:installed_check
if exist "%basedir%\%1" (
  set is_%1_installed=*
) else (
  set is_%1_installed= 
)
goto :eof
