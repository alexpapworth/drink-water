global firstRun, waterCount, waterSuffix, waitTime

set firstRun to "no"
set waterCount to 9

set theResponse to display dialog "How many waters have you had so far?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"

if theResponse = "" then
	quit
else
	set firstRun to "yes"
	set waterCount to (text returned of theResponse) as integer
end if

on idle
	
	if firstRun = "yes" then
		
		set waitTime to ((60 - the (minutes of the (current date))) * 60)
		
		if waterCount ≤ 8 then
			display notification "Thanks. In " & ((waitTime / 60) as integer) & " minutes I'll remind you to start drinking water. Only " & (8 - waterCount) & " left!" with title "Drink Water"
		else
			quit
		end if
		
		set waterCount to waterCount + 1
		set firstRun to "no"
		
	else
		
		if waterCount = 1 then
			set waterSuffix to "st"
		end if
		
		if waterCount = 2 then
			set waterSuffix to "nd"
		end if
		
		if waterCount = 3 then
			set waterSuffix to "rd"
		end if
		
		if waterCount ≥ 4 then
			set waterSuffix to "th"
		end if
		
		if waterCount = 8 then
			display notification "Time to drink water. This will be your last cup!" with title "Drink Water" sound name "Submarine"
		else if waterCount ≥ 9 then
			quit
		else
			display notification "Time to drink water. This will be your " & waterCount & waterSuffix & " cup." with title "Drink Water" sound name "Submarine"
		end if
		
		set waterCount to waterCount + 1
		set waitTime to 3600
		
		
	end if
	
	return waitTime
	
end idle