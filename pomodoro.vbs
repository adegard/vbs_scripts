' Pomdoro timer . make a little break . Notification VBS 
' To start automatically on logon, put into the directory that opens on:
' Win+R: Open: [shell:startup] -> [OK]
' (C:\Users\YOU\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup)

'set brightness based on day hour
Dim mytimer

mytimer = 50 'min

Set HH = CreateObject("Internet.HHCtrl")

while (1)
     HH.TextPopup " make a little break now! ","Verdana,12",12,12,12,12 
     WScript.Sleep(mytimer*60000)
wend
