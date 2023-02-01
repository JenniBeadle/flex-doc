
@ECHO OFF
SETLOCAL
IF "%1"=="" GOTO MENU
SET M=%1
SET X=1
GOTO :AFTER_MENU
:MENU
CLS

ECHO.
ECHO Using Docusaurus with yarn commands
ECHO.
ECHO ---------------------------------------------
ECHO PRESS 1-9 to select your task, or 0 to EXIT
ECHO ---------------------------------------------
ECHO .
ECHO 1 - View English site
ECHO 2 - View French site
ECHO 3 - Translate French site
ECHO 4 - Create version
ECHO 5 - Build site
ECHO 6 - Serve site to check build
ECHO 7 - Deploy to github
ECHO 8 - Upgrade Docusaurus to latest 
ECHO 9 - Clear the cache, build etc 
ECHO 0 - EXIT
ECHO.

SET /P M= Type 1-9 or 0 then press ENTER:
:AFTER_MENU
IF %M%==1 GOTO ENGLISH
IF %M%==2 GOTO FRENCH
IF %M%==3 GOTO TRANSLATE
IF %M%==4 GOTO VERSION
IF %M%==5 GOTO BUILD
IF %M%==6 GOTO SERVE
IF %M%==7 GOTO DEPLOY
IF %M%==8 GOTO UPGRADE
IF %M%==9 GOTO CLEARC
IF %M%==0 GOTO EOF

:ENGLISH
ECHO Start English (yarn run start)
yarn run start
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:FRENCH
ECHO Start French (yarn run start -- --locale fr)
yarn run start -- --locale fr
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:TRANSLATE
ECHO Translate (yarn run write-translations -- --locale fr)
yarn run write-translations -- --locale fr
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:DEPLOY
cmd /C "set GIT_USER=JenniBeadle&& yarn deploy"
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:VERSION
ECHO Version - use the following command changing x.x as appropriate
ECHO yarn run docusaurus docs:version x.x
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:UPGRADE
ECHO Upgrade
yarn i @docusaurus/core@latest @docusaurus/preset-classic@latest @docusaurus/module-type-aliases@latest
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:BUILD
ECHO Build
yarn run build
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:SERVE
ECHO Serve (yarn run serve)
yarn run serve
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:CLEARC
ECHO Docusarus clear (cache, build...) yarn run docusaurus clear
yarn run docusaurus clear
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:EOF
