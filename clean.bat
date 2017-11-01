@echo off
cd ..
cd ..
cd Files
del /f /q *.*
cd ..
cd Tools
cd NDS
cd SOURCE_FILES
del /f /q *.srl
del /f /q *.png
del /f /q *.tga
cd ..
cd Tools
cd NUSPACKER
cd input
rd /s /q code
rd /s /q content
rd /s /q meta
exit
