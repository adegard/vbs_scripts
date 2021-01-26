'set brightness based on day hour
  Dim dayb, nightb

  nightb = 20 'sarting night hour
  dayb = 7 'sarting day hour

  Set shell = CreateObject("WScript.Shell")

while (1)

Set shell = CreateObject("WScript.Shell")
If Hour(Now()) > dayb Then
    If Hour(Now()) > nightb Then
        shell.Run "setBrightnessToValue.bat 20"  
    Else
        shell.Run "setBrightnessToValue.bat 50"  
    End If
else
    shell.Run "setBrightnessToValue.bat 20"       
End If 
wscript.sleep 3600000 '60 min 
wend