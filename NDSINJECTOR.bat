@echo off
set CurrentVersion=3
echo Checking Internet Connection...
C:\windows\system32\PING.EXE google.com
if %errorlevel% GTR 0 goto Head
cls
cd TOOLS
cd Updater
wget -q --no-check-certificate https://www.dropbox.com/s/iy9x80yjdma21yh/NDSVERSION.txt
rename file NDSVERSION.txt
set /p UpdatedVersion=<NDSVERSION.txt
if %CurrentVersion%==%UpdatedVersion% (
del /f /q NDSVERSION.txt
cls
goto Head
) 
if not %CurrentVersion%==%UpdatedVersion% (
del /f /q NDSVERSION.txt
cls
goto updating
) 
:updating
cd ..
cd ..
cls
echo A new update is aviable!
pause
start Updater.bat
exit

::::::::::::HEAD::::::::::::
:Head
cd ..
cd ..
cls
title NicoAICP's WiiU NDS VC Injector Script
echo Choose your Baserom
echo (1) Wario Ware
echo (2) Mario and Luigi: Partners in Time 
echo (3) New Super Mario Bros. 
echo (4) The Legend of Zelda: Phantom Hourglass
set /p BR=Enter the number behind the baserom: 

::::::::::BASE ROM REGION::::::::::
if %BR%==1 (
cls
goto ww
)
if %BR%==2 (
cls
goto ml
)
if %BR%==3 (
cls
goto mb
)
if %BR%==4 (
cls
goto zh
)
:ww
echo What region do you want to use
echo (1) EU
echo (2) US
set /p Test=Enter the number which is infront of the region: >con
If %Test%==1 set BR=5
If %Test%==2 set BR=6
goto tkstuff
:ml
echo What region do you want to use
echo (1) EU
echo (2) US
set /p Test=Enter the number which is infront of the region: >con
If %Test%==1 set BR=7
If %Test%==2 set BR=8
goto tkstuff
:mb
echo What region do you want to use
echo (1) EU
echo (2) US
set /p Test=Enter the number which is infront of the region: >con
If %Test%==1 set BR=9
If %Test%==2 set BR=10
goto tkstuff
:zh
echo What region do you want to use
echo (1) EU
echo (2) US
set /p Test=Enter the number which is infront of the region: >con
If %Test%==1 set BR=11
If %Test%==2 set BR=12
goto tkstuff
:::::::::::::KEYSTUFF:::::::::::::

::::::TILEKEY STUFF::::::

::WARIOWARE EUR::
:tkstuff
if %BR%==5 (
set TKHINT=1337
set TID=00050000101a2000
set TIKPATH=TOOLS\Storage\WWEUTITLEKEY
set BRTITLE=Wario Ware: Touched! [EUR]
set DWNLDFOLDER=WarioWare Touched! [DAGP01]
set SRLNAME=WUP-N-DAGP
goto tk
)

::WARIOWARE US::
IF %BR%==6 (
set TKHINT=efaa
set TID=00050000101a1f00
set TIKPATH=TOOLS\Storage\WWUSTITLEKEY
set BRTITLE=Wario Ware: Touched! [USA]
set DWNLDFOLDER=WarioWare Touched! [DAGE01]
set SRLNAME=WUP-N-DAGE
goto tk
)

::Mario & Luigi US::

if %BR%==7 (
set TKHINT=1a51
set TID=00050000101a2200
set TIKPATH=TOOLS\Storage\MLUSTITLEKEY
set BRTITLE=Mario and Luigi Partners in Time [US]
set DWNLDFOLDER=Mario & Luigi Partners in Time [DAHE01]
set SRLNAME=WUP-N-DAHE
goto tk
)

::Mario & Luigi US::
IF %BR%==8 (
set TKHINT=095a
set TID=00050000101a2300
set TIKPATH=TOOLS\Storage\MLEUTITLEKEY
set BRTITLE=Mario and Luigi Partners in Time [EUR]
set DWNLDFOLDER=Mario & Luigi Partners in Time [DAHP01]
set SRLNAME=WUP-N-DAHP
goto tk
)

::NSMB EUR::

if %BR%==9 (
set TKHINT=54b4
set TID=0005000010195b00
set TIKPATH=TOOLS\Storage\MBEUTITLEKEY
set BRTITLE=NEW SUPER MARIO BROS. [EUR]
set DWNLDFOLDER=NEW SUPER MARIO BROS. [DADP01]
set SRLNAME=WUP-N-DADP
goto tk
)

::NSMB US::
IF %BR%==10 (

set TKHINT=9fe3
set TID=0005000010195a00
set TIKPATH=TOOLS\Storage\MBUSTITLEKEY
set BRTITLE=New Super Mario Bros. [USA]
set DWNLDFOLDER=New Super Mario Bros. [DADE01]
set SRLNAME=WUP-N-DADE
goto tk
)

::ZELDA HOURGLASS EUR::

if %BR%==11 (

set TKHINT=5069
set TID=00050000101c3800
set TIKPATH=TOOLS\Storage\ZHEUTITLEKEY
set BRTITLE=The Legend of Zelda: Phantom Hourglass [EU]
set DWNLDFOLDER=The Legend of Zelda Phantom Hourglass [DATP01]
set SRLNAME=WUP-N-DATP
goto tk
)

::ZELDA HOURGLASS US::
IF %BR%==12 (

set TKHINT=2de3
set TID=00050000101c3700
set TIKPATH=TOOLS\Storage\ZHUSTITLEKEY
set BRTITLE=The Legend of Zelda: Phantom Hourglass [US]
set DWNLDFOLDER=The Legend of Zelda Phantom Hourglass [DATE01]
set SRLNAME=WUP-N-DATE
goto tk
)


::::TITLEKEY::::
:tk
IF NOT EXIST "%TIKPATH%" set /p TK=Enter or copypaste the eShop Title Key for %BRTITLE% (Will not be required next time): >con
IF NOT EXIST "%TIKPATH%" echo %TK:~0,32%>%TIKPATH%
set /p TK=<%TIKPATH%
cls
:wtk
cls
del %TIKPATH%
echo You entered a wrong Titlekey.
pause
cls
goto tk
::::::COMMONKEY::::::
:ckey
IF NOT EXIST "TOOLS\Storage\COMMONKEY" set /p COMMONKEY=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "TOOLS\Storage\COMMONKEY" echo %COMMONKEY:~0,32%>TOOLS\Storage\COMMONKEY
set /p COMMONKEY=<TOOLS\Storage\COMMONKEY
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>TOOLS\JNUSTool\config
echo %COMMONKEY:~0,32%>>TOOLS\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>TOOLS\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>TOOLS\JNUSTool\config
goto DWNLDBASEROM

::::::::::DOWNLOADING::::::::::
:DWNLDBASEROM
cd Tools
cd JNUSTool
cls
echo Checking Internet Connection...
C:\windows\system32\PING.EXE google.com
if %errorlevel% GTR 0 goto netfail
cls
echo Downloading necessary base files with JNUSTool...>con
java -jar JNUSTool.jar %TID% %TK% -file .*
cls
if not exist "%DWNLDFOLDER%" goto Downloaderror
cd "%DWNLDFOLDER%"
xcopy /s *.* ..\..\..\SOURCE_FILES
cd ..
cls
echo Complete!
pause
goto injecting_rom
:Downloaderror
cls
echo An error has accured during Downloading.
echo The commonkey and the Titlekey will be deleted, you have to reenter them.
pause
cls
cd ..
cd Storage
del /f /q COMMONKEY
cd ..
cd ..
del /f /q %TIKPATH%
exit
::::::::::INJECTING::::::::::
:injecting_rom
cd ..
cd ..
cd ..
cd ..
cd Files
xcopy *.* ..\Tools\NDS\SOURCE_FILES
cd ..
cd Tools
cd NDS
cd SOURCE_FILES
rename *.srl %SRLNAME%.srl
rename *.nds %SRLNAME%.srl
cd content
cd 0010
del rom.zip
cd ..
cd ..
start 7za.exe a rom.zip %SRLNAME%.srl
cls
echo if the 7z window closes press Enter
pause 
move rom.zip content/0010
cls
goto create_id

::::::::::TGA/PNG/XML STUFF:::::::::::
:create_id
cls
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (A-F, 0-9): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
if %errorlevel%==1 goto create_appxml
:erroridcheck
cls
echo you entered a symbol which is not a hex id (hex id = a to f, 0 to 9)
pause
del ..\TOOLS\Storage\ID
goto create_id

:create_appxml
del "..\TOOLS\Storage\ID"
fnr --cl --dir "%cd%\code" --fileMask "app.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
cls

:create_metaxmlwweu
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): >con
echo.>con
set /p Name=Enter the Game name:  >con
echo.>con
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<product_code.*WUP-N-)(.{4})" --replace "$1%PDC%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<longname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<shortname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
cls
cls
goto bootimageDRCpng
:bootimageDRCpng
if exist bootDrcTex.png goto convertdrc
if not exist bootDrcTex.png goto bootimageDRCtga
:bootimageDRCtga
if exist bootDrcTex.tga goto movedrc
if not exist bootDrcTex.tga goto usetemplatedrc
:usetemplatedrc
xcopy.exe /y ..\TOOLS\GameFiles\bootDrcTex.tga meta
cls
goto bootimageTVpng
:convertdrc
del meta/bootDrcTex.tga
png2tgacmd.exe -i bootDrcTex.png -o meta --width=854 --height=480 --tga-bpp=24 --tga-compression=none
cls
goto bootimageTVpng
:movedrc
del meta/bootDrcTex.tga
move bootDrcTex.tga meta
cls
goto bootimageTVpng
:bootimageTVpng
if exist bootTvTex.png goto converttv
if not exist bootTvTex.png goto bootimageTVtga
:bootimageTVtga
if exist bootTvTex.tga goto movetv
if not exist bootTvTex.tga goto usetemplatetv
:usetemplatetv
xcopy.exe /y ..\TOOLS\GameFiles\bootTvTex.tga meta
cls
goto bootimageIconpng
:converttv
del meta/bootTvTex.tga
png2tgacmd.exe -i bootTvTex.png -o meta --width=1280 --height=720 --tga-bpp=24 --tga-compression=none
cls
goto bootimageIconpng
:movetv
del meta/bootTvTex.tga
move bootTvTex.tga meta
cls
goto bootimageIconpng
:bootimageIconpng

if exist iconTex.png goto moveicon
if not exist iconText.png goto bootimageIcontga
:bootimageIcontga

if exist iconTex.tga goto moveicon
if not exist iconTex.tga goto usetemplateicon
:usetemplateicon
xcopy.exe /y ..\TOOLS\GameFiles\iconTex.tga meta
cls
goto usetemplatelogo
:converticon
del meta/iconTex.tga
png2tgacmd.exe -i iconTex.png -o meta --width=128 --height=128 --tga-bpp=32 --tga-compression=none
cls
goto usetemplatelogo
:moveicon
del meta/iconTex.tga
move iconTex.tga meta
cls
goto usetemplatelogo
:usetemplatelogo
xcopy.exe /y ..\TOOLS\GameFiles\bootLogoTex.tga meta
cls
goto add_custom_backgrounddrc
:add_custom_backgrounddrc
if exist drcback.png goto movedrcbgm
if not exist drcback.png goto usetemplatedrcbgm
:movedrcbgm
del content/0010/assets/textures/drcback.png
move drcback.png content/0010/assets/textures
goto add_custom_backgroundtv
:usetemplatedrcbgm
xcopy.exe /y ..\TOOLS\GameFiles\drcback.png content\0010\assets\textures
goto add_custom_backgroundtv
:add_custom_backgroundtv
if exist tvback.png goto movetvbgm
if not exist tvback.png goto usetemplatetvbgm
:movetvbgm
del content/0010/assets/textures/tvback.png
move tvback.png content/0010/assets/textures
goto add_custom_backgroundNDSDRC
:usetemplatetvbgm
xcopy.exe /y ..\TOOLS\GameFiles\tvback.png content\0010\assets\textures
goto add_custom_backgroundNDSDRC
:add_custom_backgroundNDSDRC
if exist nds1st_31p.png goto movendsdrc
if not exist nds1st_31p.png goto usetemplatendsdrc
:movendsdrc
del content/0010/assets/textures/nds1st_31p.png
move nds1st_31p.png content/0010/assets/textures
goto add_custom_backgroundNDSTV
:usetemplatendsdrc
xcopy.exe /y ..\TOOLS\GameFiles\nds1st_31p.png content\0010\assets\textures
goto add_custom_backgroundNDSTV
:add_custom_backgroundNDSTV
if exist nds1st_31p_tv.png goto movendstv
if not exist nds1st_31p_tv.png goto usetemplatendstv
:movendstv
del content/0010/assets/textures/nds1st_31p_tv.png
move nds1st_31p_tv.png content/0010/assets/textures
goto packing
:usetemplatendstv
xcopy.exe /y ..\TOOLS\GameFiles\nds1st_31p_tv.png content\0010\assets\textures
goto packing
:::::::::Packing:::::::::
:packing
move code ../TOOLS/NUSPACKER/INPUT
move content ../TOOLS/NUSPACKER/INPUT
move meta ../TOOLS/NUSPACKER/INPUT
cd ..
cd TOOLS
cd NUSPACKER
cls
java -jar NUSPacker.jar -in input -out output -encryptKeyWith %COMMONKEY%
rd /s /q tmp
mkdir install
cd install
mkdir injected_vc_game
cd ..
cd output
move *.* ..\install\injected_vc_game
cd ..
rd /s /q output
pause
cd install
move injected_vc_game ../../../../../Injected_Games
cd ..
cd input
cd ..
cd ..
cd ..
cls
echo (y) yes
echo (n) no
set /p CLEANER=Do you want to run the cleaner? (recommended)

if %CLEANER%==y goto open_cleaner
if %CLEANER%==n goto no_cleaning
:open_cleaner
cls
echo The cleaner window will open after you pressed Enter
pause
start clean.bat
goto fin
:no_cleaning
cls
echo you choosed to not clean.
pause
goto fin
:fin 
echo have fun with your game!
pause
exit
:netfail
cls
echo Your PC is not connected to the Internet, Aborting!
pause
exit