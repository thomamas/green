Version 1 of Simple Exit Lister by Thomas Insel begins here.

"Inspired by Eric Eve's Exit Lister, but simpler. If you want features or configurability, use his extension instead."

Chapter 1 - Setup

Use authorial modesty.

A room has a text called destination name. The destination name of a room is usually "".

A room can be familiar or unfamiliar. A room is usually unfamiliar.

Include Basic Screen Effects by Emily Short.

Chapter 2 - Status Line

Table of Exit Status
left	central	right
" [left hand status line]"	""	"[right hand status line]"
" Exits: [exit status line]"	""	""

Status-line-blank is a truth state that varies. Status-line-blank is usually false.

Rule for constructing the status line (this is the exit lister status line rule):
	unless status-line-blank is true:
		fill status bar with the Table of Exit Status;
	rule succeeds.

To say exit status line:
	let printed be false;
	repeat with way running through directions:
		if the room-or-door way from the location is not nowhere:
			now printed is true;
			say "[way] ";
	if printed is false, say "none".

Chapter 3 - Exit listing
  
ExitListing is an action out of world.
Understand "exits" as ExitListing.
Carry out ExitListing: list the exits.

To decide what number is the number of exits:
	let n be 0;
	repeat with way running through directions:
		if the room-or-door way from the location is not nowhere:
			increase n by 1;
	decide on n;

To list the exits:
	let exit count be the number of exits;
	if exit count is:
		-- 0:
			say "There are no obvious exits.";
			rule fails;
		-- 1:
			say "The only exit is ";
		-- otherwise:
			say "The exits are ";
	let i be exit count;
	repeat with way running through directions:
		if the room-or-door way from the location is not nowhere:
			if the room way from the location is visited or the room way from the location is familiar:
				say "[way] to [destname the room way from the location]";
			otherwise:
				say "[way]";
			decrease i by 1;
			if i is 0, say ".";
			if i is 1, say "[if exit count > 2 and serial comma option is active],[end if] and ";
			if i > 1, say ", "

To say destname (place - a room):
	if the destination name of place is "":
		say "[the place]" in lower case;
	otherwise:
		say "[destination name of place]".

Instead of going nowhere, try ExitListing;

Simple Exit Lister ends here.
