@if (@CodeSection == @Batch) @then

@echo off
CScript //nologo //E:JScript "%~F0" "%~1" > "%~N1.html"
goto :EOF

@end

var http = WScript.CreateObject('Msxml2.XMLHTTP.6.0');
http.open("GET", WScript.Arguments.Item(0), false);
http.send();

if (http.status == 200) {
   WScript.StdOut.Write(http.responseText);
} else {
   WScript.StdOut.WriteLine("Error: Status "+http.status+" returned on download.");
}

REM https://stackoverflow.com/questions/24975698/get-code-html-to-a-file-whit-cmd