@echo off

set /P brightness=Enter brightness level (1-100):% brightness:  %=%

:: Set Brightness Level
POWERCFG /SETDCVALUEINDEX 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%
POWERCFG /SETACVALUEINDEX 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%

:: Set Active
POWERCFG /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

::timeout /t 20

:: Restore Brightness Level
::POWERCFG /SETDCVALUEINDEX 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
::POWERCFG /SETACVALUEINDEX 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100

:: Set Active
::POWERCFG /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

::pause