Option Explicit
Dim http,strJson,j,Info,HH,sapi,i
Set http = CreateObject("Msxml2.XMLHTTP")
'CreateObject("Msxml2.XMLHttp.6.0") ' see https://stackoverflow.com/questions/17401413/msxml3-dll-access-denied
http.open "GET","http://newsapi.org/v2/top-headlines?country=it&apiKey=APIKEY",False
http.send
strJson = http.responseText
Set j = Parse(strJson)

Info = Info & j.articles.[0].title & vbCrLf &_
". "&j.articles.[0].content & vbCrLf &_
j.articles.[1].title & vbCrLf &_
". "&j.articles.[1].content

Set HH = CreateObject("Internet.HHCtrl")
HH.TextPopup Info,"Verdana,12",12,12,12,12
WScript.Sleep 1000
Set sapi=CreateObject("sapi.spvoice")
sapi.Speak Info
Wscript.Quit()
'****************************FUNCTION************************************************
Function Parse(strJson)
Dim html,window
    Set html = CreateObject("htmlfile")
    Set window = html.parentWindow
    window.execScript "var json = " & strJson, "JScript"
    Set Parse = window.json
End Function
'****************************************************************************