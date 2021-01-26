Set oVoice = CreateObject("SAPI.SpVoice")
set oSpFileStream = CreateObject("SAPI.SpFileStream")
oSpFileStream.Open "C:\Windows\startup.wav"
oVoice.SpeakStream oSpFileStream
oSpFileStream.Close