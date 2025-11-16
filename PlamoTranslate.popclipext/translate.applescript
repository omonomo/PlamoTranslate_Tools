set source to "{popclip option source}"
set target to "{popclip option target}"
set input to "{popclip text}"

set isRunning to false
try
	do shell script "pgrep -f 'plamo-translate server'"
	set isRunning to true
end try

if isRunning is false then
	do shell script "shortcuts run 'PLaMo-Translate ON'"

	set ready to false
	repeat 30 times
		try
			do shell script "curl -s -o /dev/null http://localhost:30000"
			set ready to true
			exit repeat
		end try
		delay 0.5
	end repeat

	if ready is false then
		display dialog "Failed to start server" buttons {"OK"} default button "OK" with icon stop
		return
	end if
end if

try
	set shResult to do shell script "/usr/local/bin/plamo-translate --from " & quoted form of source & " --to " & quoted form of target & " --input " & quoted form of input
	set dialogResult to display dialog shResult buttons {"Copy", "OK"} default button "OK"

	if button returned of dialogResult is "Copy" then
		set the clipboard to shResult
	end if

on error errMsg
	display dialog "Error: " & errMsg buttons {"OK"} default button "OK" with icon stop
end try
