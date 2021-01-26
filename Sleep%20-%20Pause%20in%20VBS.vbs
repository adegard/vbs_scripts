' So simple, so elegant, so elusive.  Behold its glory:

 ' ------------------------------------------------------------------
    
Sub wait_function(secs)
	Dim enter_time, leave_time
	enter_time = Timer
	leave_time = Timer
	While (enter_time + secs > leave_time)
		leave_time = Timer
	Wend
end sub

 ' ------------------------------------------------------------------