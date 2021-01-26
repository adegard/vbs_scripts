@echo off
:start
cls
echo.
echo G O O G L E Web Search Version 1.1
echo.
echo Type search terms, and your internet browser will open it.
echo.
set /p Web=
start www.google.com/search?q=%Web%
goto start