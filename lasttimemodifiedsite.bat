@if (@X)==(@Y) @end /* (batch + jscript hybrid script init)

:: *** Batch script *****https://stackoverflow.com/questions/15364653/can-we-fetch-scrape-particular-data-from-html-site-into-batch-to-do-following


@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%I in ('wget "%~1" -O- -q 2^>NUL ^| findstr /i "last.*updated.*as.*of"') do (
    for /f "delims=" %%x in ('cscript /nologo /e:jscript "%~f0" "%%I"') do (

        rem test whether date diff >= 30 minutes
        set /a "thirtyMinutes = 30 * 60 * 1000"
        if %%x GEQ !thirtyMinutes! (
            echo Do that voodoo that you do.
        )

        rem Just to demonstrate, you can do some maths to make further sense of the date difference.
        rem set milliseconds=%%x
        set /a "seconds = %%x / 1000, seconds %%= 60"
        set /a "minutes = %%x / 1000 / 60, minutes %%= 60"
        set /a "hours = %%x / 1000 / 60 / 60, hours %%= 24"
        set /a "days = %%x / 1000 / 60 / 60 / 24"
        echo %~1 last modified !days! days !hours! hours !minutes! minutes ago.
    )

    rem Once the for loop has fired, exit.
    exit /b
)

rem In case the web page does not contain "last updated as of"
exit /b


:: *** JScript script *****/
var args = [];
for (var i=0; i<WScript.arguments.length; i++) { args.push(WScript.arguments(i)) }
var t = args.join(' ').replace(/^\s+|<[^>]+>|\s+$/g,'').replace(/\&nbsp;/g, ' ').split(' ');