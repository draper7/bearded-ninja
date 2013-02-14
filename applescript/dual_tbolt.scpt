-- -----
-- dual thunderbolt displays
-- -----
--

--
-- start apps
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
	set bounds of window 1 to {2, 0, 1000, 700}
	set visible of window 1 to true
end tell

tell application "iTerm"
	activate
	set bounds of window 1 to {2562, 2, 4000, 1438}
	set visible of window 1 to true
end tell

tell application "Google Chrome"
	activate
	set bounds of window 1 to {1002, 0, 2558, 1400}
	set visible of window 1 to true
end tell

tell application "Skype"
	activate
	set bounds of window 1 to {2, 745, 1000, 1364}
	set visible of window 1 to false
end tell

tell application "MacVim"
	activate
	set bounds of window 1 to {4002, 2, 5119, 1400}
	set visible of window 1 to true
end tell

tell application "System Events" to tell application process "Spotify"
	tell window 1
		set {size, position} to {{1435, 895}, {5122, 189}}
	end tell
end tell

tell application "System Events" to set visible of process "Spotify" to true

tell application "Finder"
	activate
	reveal the home
	set bounds of window 1 to {2, 745, 1000, 1364}
end tell
