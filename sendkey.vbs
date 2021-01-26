Option Explicit
Dim WshShell, intBase, intSleep, myrand
intBase = 5
Set WshShell = WScript.CreateObject("WScript.Shell")
while (1)
    myrand = rnd()
'WScript.Echo myrand
    
    intSleep = (intBase*myrand)*1000

WshShell.SendKeys "+^{TAB}"
'WScript.Sleep 5000


WScript.Sleep (CInt(intSleep))
wend