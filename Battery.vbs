' Battery Full Notification VBS - checking in each 5 min
' To start automatically on logon, put into the directory that opens on:
' Win+R: Open: [shell:startup] -> [OK]
' (C:\Users\YOU\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup)

set oLocator = CreateObject("WbemScripting.SWbemLocator")
set oServices = oLocator.ConnectServer(".","root\wmi")
set oResults = oServices.ExecQuery("select * from batteryfullchargedcapacity")

for each oResult in oResults
iFull = oResult.FullChargedCapacity
next

'Set HH = CreateObject("Internet.HHCtrl")

while (1)
set oResults = oServices.ExecQuery("select * from batterystatus")
for each oResult in oResults
iRemaining = oResult.RemainingCapacity
bCharging = oResult.Charging
next
iPercent = ((iRemaining / iFull) * 100) mod 100
if bCharging and (iPercent > 95) Then msgbox "Battery is at " & iPercent & "%",vbInformation, "Battery monitor"
if (bCharging=false) and (iPercent < 20) Then msgbox "Battery is at " & iPercent & "%",vbInformation, "Battery monitor"
wscript.sleep 300000 ' 5 minutes
wend
