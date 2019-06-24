global firstRun, waterCount, waterSuffix, waitTime

set theResponse to display dialog "How many waters have you had so far?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"

set waterCount to (text returned of theResponse) as integer


set firstRun to "yes"

on idle
	
	if firstRun = "yes" then
		
		# set waterCount to 1
		set waterSuffix to "st"
		set firstRun to "no"
		set waitTime to ((60 - the (minutes of the (current date))) * 60)
		
		display notification "Thanks. In " & ((waitTime / 60) as integer) & " minutes I'll remind you to start drinking water. Only " & (8 - waterCount) & " left!" with title "Drink Water"
		
	else
		
		if waterCount = 2 then
			set waterSuffix to "nd"
		end if
		
		if waterCount = 3 then
			set waterSuffix to "rd"
		end if
		
		if waterCount = 4 then
			set waterSuffix to "th"
		end if
		
		if waterCount = 8 then
			display notification "Time to drink water. This will be your last cup!" with title "Drink Water" sound name "Submarine"
		else
			display notification "Time to drink water. This will be your " & waterCount & waterSuffix & " cup." with title "Drink Water" sound name "Submarine"
		end if
		
		set waterCount to waterCount + 1
		set waitTime to 3600
		
	end if
	
	if waterCount = 9 then
		quit
	else
		return waitTime
	end if
	
end idle