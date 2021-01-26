' Task speak aloud.  
' create a routine for your gscript to a txt file like "C:\tmp\file.txt"
' (see https://gist.github.com/adegard/1a7583baa8cf6b422ce4d2ee04b015ec)
' this vbs will read it when it contains something
' To start automatically on logon, put into the directory that opens on:
' Win+R: Open: [shell:startup] -> [OK]
' (C:\Users\YOU\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup)
' adegard, 2020, v1.0

Option Explicit
Dim strFileText, objFileToRead, objFileToWrite, sapi, myfile, mytimer
'http://eddiejackson.net/wp/?p=8619
myfile="C:\tmp\file.txt"

mytimer = 1 'min

while (1)
    Set objFileToRead = CreateObject("Scripting.FileSystemObject").OpenTextFile(myfile,1)
    strFileText = objFileToRead.ReadAll()
    objFileToRead.Close
    Set objFileToRead = Nothing

    if strFileText <> "" Then
        Set sapi=CreateObject("sapi.spvoice")
        sapi.Speak strFileText

        WScript.Sleep 1000
        'erase content
        Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(myfile,2,true)
        objFileToWrite.WriteLine("")
        objFileToWrite.Close
        Set objFileToWrite = Nothing
    End if

    WScript.Sleep(mytimer*60000)
wend

'Wscript.Quit()
