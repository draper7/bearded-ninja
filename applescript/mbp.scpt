-- -----
-- 15" mbp
-- -----
--
--

--
-- start up my apps
--

if application "Finder" is not running then
	activate application "Finder"
else
	tell application "Finder"
		close every window
	end tell
end if

if application "SizeUp" is not running then
	activate application "SizeUp"
end if

if application "Cloud" is not running then
	activate application "Cloud"
end if

if application "MacVim" is not running then
	activate application "MacVim"
end if

if application "Skype" is not running then
	activate application "Skype"
end if

if application "Google Chrome" is not running then
	activate application "Google Chrome"
end if

if application "HipChat" is not running then
	activate application "HipChat"
end if

if application "iTerm" is not running then
	activate application "iTerm"
end if

if application "Spotify" is not running then
	activate application "Spotify"
end if

delay 5

--
-- orgainize windows
--
tell application "HipChat"
	activate
	get bounds of window 1
	-- set bounds of window 1 to {3, -231, 484, -40}
	-- set visible of window 1 to true
end tell

-- tell application "iTerm"
-- 	activate
-- 	set bounds of window 1 to {2562, 2, 4000, 1438}
-- 	set visible of window 1 to true
-- end tell

tell application "Google Chrome"
	activate
	set bounds of window 1 to {1, 22, 1110, 824}
	set visible of window 1 to true
end tell

tell application "Skype"
	activate
	set bounds of window 1 to {441, 20, 1439, 665}
	set visible of window 1 to false
end tell

using terms from application "SizeUp"
	tell application "MacVim"
		activate
		tell application "SizeUp"
			do action Space Next
			delay 1
		end tell
	end tell
end using terms from

-- 	set bounds of window 1 to {4002, 2, 5119, 1400}
-- 	set visible of window 1 to true
-- end tell

tell application "System Events" to tell application process "Spotify"
	tell window 1
		set {size, position} to {{1110, 665}, {1, 22}}
	end tell
end tell

tell application "System Events" to set visible of process "Spotify" to false

tell application "Finder"
	activate
	reveal the home
	set bounds of window 1 to {441, 44, 1439, 665}
end tell

tell application "System Events" to set visible of process "Finder" to false
