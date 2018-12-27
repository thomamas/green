#

tell application "Finder"
	set current_path to container of (path to me) as alias
	
	set dirFeelies to ((container of current_path as text) & "art:Feelies")
	set dirBuild to (dirFeelies & ":Build")
	
	try
		make new folder at dirFeelies with properties {name:"Build"}
	end try
end tell

set fList to ""

tell application id "OGfl"
	set feeliesDocument to open ((dirFeelies as text) & ":Feelies.graffle")
	
	repeat with canvasNumber from 1 to count of canvases of feeliesDocument
		set canvas of front window to canvas canvasNumber of feeliesDocument
		save feeliesDocument as "pdf" in file (dirBuild & ":page-" & canvasNumber & ".pdf")
		set fList to (fList & " page-" & canvasNumber & ".pdf")
	end repeat
end tell

set joinCmd to quoted form of "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"

do shell script "cd " & quoted form of POSIX path of dirBuild & " ; " & joinCmd & " --output all.pdf " & fList
