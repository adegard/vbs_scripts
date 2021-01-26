@echo off
:start
cls
echo.
echo G O O G L E  DRIVE Search Version 1.0
echo.
echo Type search terms, and your internet browser will open it.
echo.
set /p Web=
start https://drive.google.com/drive/search?q=%Web%
goto start