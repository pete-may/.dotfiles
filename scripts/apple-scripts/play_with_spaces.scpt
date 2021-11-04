tell application "System Events"
	(* do shell script quoted form of "/System/Applications/Mission Control.app/Contents/MacOS/Mission Control" *)
	do shell script "/usr/local/bin/cliclick m:0,0"
	(* delay 1  *)
	(* do shell script "/usr/local/bin/cliclick m:200,80"  *)
	delay 0.3
	key down {option}
	delay 0.1
	delay 3
	key up {option}
end tell
