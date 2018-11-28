 "Founder's Mercy" by Thomas Insel

[
	Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
	http://tinsel.org/IF/
	
	This work is licensed under a Creative Commons Attribution 4.0 International License.
	https://creativecommons.org/licenses/by/4.0/	
]

Book 1 - Setup

Chapter 2 - The story

[ There is no way to automatically check, but this story was written for use with Inform 7 build 6M62. ]

Use American dialect and the serial comma.

The story headline is "A Space Story". The story genre is "Science Fiction". The release number is 1. The story creation year is 2018.

The story description is "You awake. You are lonely, so lonely. It was a thousand days ago today. All alone these thousand days. Your parents were the last. No, your father was the last. He held on for nearly a hundred days longer. No, you are the last. Alone. Adrift.

But maybe it isn’t hopeless. There must still be other people in other worlds, and you think you know how to get there.

Today is the day."

When play begins:
	say "[the story description][paragraph break]"

Release along with cover art ("A space station."),
	an interpreter,
	the introductory booklet,
	the library card,
	a file of "Story Map" called "Map.pdf",
	and a "Local" website.

Chapter 3 - Scoring

Use scoring. The maximum score is 50. An object can be scored. An object is usually not scored.

[
	5 - getting the boots out of the vault
	5 - red breaker

	10 - green breaker in the pond

	5 - opening the learning machine
	5 - fixing and closing the atmosphere pump

	10 - visiting pod bay for the first time

	10 - getting the communications unit working (and calling for help)
]

Chapter 4 - Notes

Section 1G (for Glulx only)

Include Glulx Text Effects by Emily Short

Section 1Z (for Z-machine only)

To say note style: say "".

Section 2 - 

To say start note: say "[note style][bracket]".
To say stop note: say "[close bracket][roman type]".

To say start computer: say "[fixed letter spacing]".
To say stop computer: say "[roman type]".

To display (x - some text): say "[start computer][x][stop computer][line break]";
To computerize (x - some text): say "[start computer][x][stop computer][paragraph break]";
To note (x - some text): say "[start note][x][stop note][paragraph break]";
To lnote (x - some text): say "[start note][x][stop note][line break]"; [todo - resolve these two ]


Chapter 5 - Misc Phrases

To find and take (s - an object):	
	now s is in the holder of the player;
	try silently taking s;
	set pronouns from s;

To decide what number is the total minutes of (t - a time): decide on the minutes part of t plus 60 times the hours part of t;

Chapter 6 - Extensions

Section 1 - Basic Infrastructure

Include Unicode Character Names by Graham Nelson.

Section 2 - Exit Listen

Include Exit Lister by Eric Eve.

When play begins: now exit listing is enabled.

The explain exit listing rule response (A) is "[start note]Type 'exits off' to disable the status line exit list and 'exits on' to turn it back on.[no line break][stop note]"

Instead of going nowhere, say "You can't go that way. [list the exits]";

Section 3 - Plugs and Sockets

[ Consider:

	Special language for picking up a cable that is connected to something not carried.
	Blocking putting the cable in the pocket if it is connected to something not carried.
	If there were a portable closable container which could hold a cable, there would be issues.
]

Include Plugs and Sockets by Sean Turner

[ A. adapt to missing Plurality by Emily Short ]

To say it-them of (s - something):
	say "[regarding s][them]".

[ B.  Suppress the list of attachments for sockets because this is too ugly:
		
	You can see an organ (into which is plugged an USB cable), an audio unit (into which is plugged an USB cable), and an USB cable (plugged into an organ and an audio unit) here.

but this is better:		

	You can see an organ, an audio unit, and an USB cable (plugged into an organ and an audio unit) here.

Still not without issues: if you are holding the cable then it doesn't show up in the room at all, complicated connections wouldn't be clear, etc.
]

The list attached things when listing receiver or inserter rule response (A) is "".

[ C. Make style fit for command explanation ]

The ensure-item-only-plugged-into-1-thing rule response (B) is "[The noun] [are] plugged into more than one thing.[paragraph break][start note]Try 'unplug [noun] from SOMETHING'.[stop note][line break]";

[ D. Fix leaving whilst attached bug: the existing rule doesn't apply if the cable is in a container. Also substitute our preferred language. ]

When play begins, now PS-leaving is PS-allowed.

This is the new leaving room whilst attached to fixed things rule:
	repeat with item running through the attached things enclosed by the player:
		repeat with loop-item running through the PS-connectors which are part of the item:
			let the connectee be the attachment of the loop-item;
			if the connectee is not nothing:
				if the holder of the connectee is not enclosed by the player:
					if PS-leaving is PS-denied:
						say "It is impractical to leave with [the item] attached to [the holder of the connectee]." (A);
						stop the action;
					now the attachment of the loop-item is nothing;
					now the attachment of the connectee is nothing;
					say "[The item] [pull] out from [the holder of connectee]." (B).

The new leaving room whilst attached to fixed things rule substitutes for the leaving room whilst attached to fixed things rule.

[ E. Some action synonyms ]

Understand the command "disconnect" as "unplug".
Understand "connect [something] to [something]" as plugging it into.

[ F. Establish a few kinds for future use ]

A usb plug is a kind of PS-plug. 
A usb socket is a kind of PS-socket.

Chapter 7 - Directions

The starboard is a direction. The starboard has opposite port. Understand "s" as starboard.

The port is a direction. The port has opposite starboard. Understand "p" as port.

The spinward is a direction. The spinward has opposite antispinward. Understand "sw" as spinward.

The antispinward is a direction. The antispinward has opposite spinward. Understand "asw" as antispinward.

Does the player mean going a stellar direction: it is very likely.

A direction can be stellar or planetbound. A direction is usually not stellar. Starboard, port, spinward, antispinward, up, down, the inside and the outside are stellar.

Directions were explained is a truth state that varies. Directions were explained is false.

Before going a planetbound direction:
	say	"You have heard of compass directions like [noun], but they don't make any sense here. Instead, you can go spinward, antispinward, port, and starboard. When you look spinward, port is left and starboard is right.[paragraph break]";
	unless directions were explained is true:
		say "[start note]You can use the abbreviations 'sw', 'asw', 'p', and 's'. You can also go 'up', 'down', 'in', and 'out' where appropriate. Type 'exits' if you get confused about geography.[no line break][stop note][paragraph break]";
		now directions were explained is true;
	stop the action.

Index map with spinward mapped as north. Index map with antispinward mapped as south. Index map with port mapped as west. Index map with starboard mapped as east.

Chapter 8 - Kinds of doors

To say floor-hatch-desc (d - a floor hatch):
	if d is open:
		say "You have been trained to keep hatches closed as a precaution against decompression, but the hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if] is open.[no line break]";
	otherwise:
		say "You have been well-trained, because the hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if] is secured shut.[no line break]";

To say floor-hatch-short:
	let d be a random floor hatch in the location;
	say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if].[no line break]";

A floor hatch is a kind of door. "[floor-hatch-short]". It is usually privately-named. It usually has description "[floor-hatch-desc noun]". It is usually closed. It usually has printed name "the [if the player is in Underneath]ceiling hatch[otherwise]floor hatch[end if]".

After going up through a floor hatch:
	let d be a random open floor hatch in the location;
	say "You pull yourself up through the hatch and close it behind yourself.";
	try silently closing d;
	continue the action.
	
After going down through a floor hatch:
	let d be a random open floor hatch in the location;
	say "You scramble down through the hatch and close it behind yourself.";
	try silently closing d;
	continue the action.

Understand "hatch" as a floor hatch.
Understand "ceiling" as floor hatch when the location is in Underneath.
Understand "floor" as floor hatch when the location is not in Underneath.

Understand "secure [a door]" as closing.

A building is a kind of door. It is usually open. It is usually not openable. It is usually privately-named.

[ To represent the outside of buildings you go out/in from in the ring. ]

Chapter 9 - Kinds of Other Things

A pylon is a kind of thing. It is usually scenery. It is usually privately-named. It usually has printed name "pylon". Understand "pylon" as pylon. A pylon usually has indefinite article "the". A pylon usually has description "Made of smooth metal, it connects the ground to the hub of the station many meters above."

Instead of climbing a pylon (called p):
	say "The pylon is slick metal with no obvious handholds."

Before going nowhere when a pylon (called p) is visible:
	if the noun is up, try climbing p instead.

A circuit breaker is a kind of device. Circuit breakers are usually fixed in place.

Instead of switching off a circuit breaker (called b) when b is switched on:
	say "[The b] seems to be locked on."

The green circuit breaker is a circuit breaker. It is switched off.

A forest is a kind of thing. It is usually scenery and privately-named and plural-named. It usually has printed name "trees". Understand "tree" and "trees" and "forest" and "grove" as a forest. A forest usually has description "The community grew trees for tradition, and they help with air processing."

Instead of climbing a forest:
	if the player is wearing the gravity boots:
		say "Trees aren't magnetized, so the boots won't help.";
	otherwise:
		say "You can't get a good grip."

Chapter 10 - About

Requesting the credits is an action out of world and applying to nothing.

Understand "about" or "credits" as requesting the credits.
	
After printing the banner text rule:
	say "Type 'about' for credits or 'hint' for assistance.";
	
Carry out requesting the credits:
	say	"[bold type]About Founder's Mercy[roman type][line break]"
		,
		"[italic type]Founder's Mercy[roman type] is my second released Inform project, conceived and implemented in November of 2018.[paragraph break]"
		,
		"Thanks to Graham Nelson, Andrew Plotkin, Emily Short, and everyone else who contributed to the Inform and Glulx ecosystem. Thanks also to Eric Eve for the Exit Lister extension, Juhana Leinonen for the Object Response Tests extension, and Sean Turner for the Plugs and Sockets extension. The cover art is adapted from Figure 1.1 from NASA SP-413, [italic type]Space Settlements: A Design Study[roman type], edited by Richard D. Johnson and Charles Holbrow, and available from The Internet Archive at [fixed letter spacing]https://archive.org/details/SpaceSettlementsADesignStudy1977[roman type] .[paragraph break]"
		,
		"Please send your feedback, bug reports, and requests for help to [fixed letter spacing]tinsel@tinsel.org[roman type]. You can always find the current version of this game at [fixed letter spacing]http://tinsel.org/IF/[roman type] .[paragraph break]"
		,
		"This work is Copyright © [the story creation year] Thomas Insel but may be freely shared according to the terms of the Creative Commons Attribution 4.0 International license ([fixed letter spacing]https://creativecommons.org/licenses/by/4.0/[roman type]).".

Chapter 11 - The Player

The player is female. The carrying capacity of the player is 3.

Instead of examining the player, say "As virtuous as ever."

The player is wearing a green jumpsuit. The jumpsuit has description "You have worn modest jumpsuits like this since you were small. Originally, the colors had meanings: green for farmers, blue for technicians, and so on, but that distinction died even before the population." Understand "suit" and "jump suit" as jumpsuit.

The pocket is part of the jumpsuit. It is a container.

Before an actor taking: [* a player's holdall must be directly carried, so let's try this instead ]
	if the number of things carried by the actor is at least the carrying capacity of the actor:
		if the actor is wearing the green jumpsuit:
			let the transferred item be nothing;
			repeat with the possible item running through things carried by the actor:
				if the possible item is not lit and the possible item is not the jumpsuit, let the transferred item be the possible item;
			if the transferred item is not nothing:
				if the actor is the player:
					say "(putting [the transferred item] into your pocket to make room)[command clarification break]";
				silently try the actor trying inserting the transferred item into the pocket;
				if the transferred item is not in the pocket:
					stop the action.

After examining the jumpsuit:
	if the pocket contains something:
		say "The pocket contains [a list of things in the pocket].";
	otherwise:
		say "It features a single large pocket, currently empty.";

Before inserting something into the jumpsuit, try inserting the noun into the pocket instead.

After taking off the jumpsuit, say "Your nudity is pure and innocent, but still a little uncomfortable ... and cold."

Instead of taking inventory:
	if the first thing held by the player is nothing, say "[We] [are] carrying nothing." instead;
	say "[We] [are] carrying:[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation;
	if the pocket contains something and the player is wearing the jumpsuit:
		say "[line break][Our] jumpsuit pocket contains:[line break]";
		list the contents of the pocket, with newlines, indented, including contents, giving inventory information, with extra indentation.

Chapter 12 - Actions

Section 1 - Remove Some Actions

Understand the command "wake" as something new. [ too self-referential ]
Understand the command "buy" as something new. [ no money in this game ]
Understand the command "lock" as something new.
Understand the command "unlock" as something new.
Understand the command "sorry" as something new.

[ this is a lot of trouble just to get rid of consulting it about ]

Understand the command "look" as something new.
Understand "look" as looking.
Understand "look at [something]" as examining.
Understand "look [something]" as examining.
Understand "look inside/in/into/through [something]" as searching.
Understand "look under [something]" as looking under.

Understand the command "read" as something new.
Understand "read [something]" as examining.

Understand the command "consult" as something new.

Section 2 - Modify Some Default Responses

Instead of attacking or cutting something, say "The Founder said that violence is never the answer.";

Instead of cutting or attacking yourself, say "Imperfect vessel that you are, that is not the answer."

Instead of burning something, say "There is no open flame on the station."
	
Instead of listening to a room, say "You hear only the familiar hum of the station."

Instead of smelling a room, say "Only familiar odors."

Section 3 - And Add Some Actions

[ for the pond ]

Understand "swim" as swimming.
Understand "swim in [something]" as swimming in.

Swimming is an action applying to nothing.
Swimming in is an action applying to one thing.

Instead of swimming, say "There's nothing to swim in."
Instead of swimming in, say "You can't swim in [the noun]."

[ for the black board ]

Understand "rub [something] with [something]" as rubbing it with.
Understand the command "erase" as "rub".

Rubbing it with is an action applying to one thing and one carried thing.

Carry out an actor rubbing something with: try rubbing the noun instead.

[ because they will check ]

Understand "xyzzy" or "say xyzzy" as xyzzying.

xyzzying is an action applying to nothing.

Instead of xyzzying for the first time, say "You say that word out loud. Your mother would never have approved. Even with no one to listen, it feels a little wrong."

Carry out xyzzying: say "Once was enough."

[ for atmosphere ]

Understand "sing" as singing.
Understand "pray" as singing.

Singing is an action applying to nothing.

Check singing:
	if the actor is wearing the emergency mask:
		say "You can't sing with the mask on.";
		stop the action.

Carry out singing: say "You sing a hymn [one of]about hard work[or]about virtue[or]about penitence[or]praising the Founder[or]about Old Earth[at random].";
	
[ for the organ ]
	
Understand "play [something]" as Playing.

Playing is an action applying to one thing.

Carry out playing: say "[regarding the noun]You don't know how to play [those]."

Chapter 13 - Testing - Not for release

Include Object Response Tests by Juhana Leinonen.
Include Testing Commands by Thomas Insel.

Book 2 - Machines & Modules, Scanner and Scanning

Chapter 1 - Modules

[ known as modules in text ]

Status is a kind of value. The statuses are functional and faulty.

A module is a kind of thing.
A module has a status. The status of a module is usually functional. 
A module can be scanned.

Understand "module" as a module.
Understand the status property as describing a module when the item described is scanned.
Understand "unscanned" as a module when the item described is not scanned.
Understand "scanned" as a module when the item described is scanned.

To say the qualifier of (c - a module):
	if c is scanned:
		say "[status of c] ";
	else if any module has been scanned:
		say "unscanned ";
	otherwise:
		do nothing.

Before printing the plural name of a module (called c), say the qualifier of c.
Before printing the name of a module (called c) while not examining, say the qualifier of c.
Before printing the name of a module (called c) while examining, unless the noun is a module, say the qualifier of c.

Instead of examining a module (called c):
	if c is scanned:
		say "The scanner reported that this [c] is [status of c].";
	otherwise:
		say "It is a standardized [c]."

Instead of scanning a module (called c):
	computerize "Module is [status of c].";
	now c is scanned.

Instead of the scanner opening a module:
	computerize "Module is unitary.";
	rule succeeds.

Chapter 2 - Machines

A machine is a kind of container. A machine is usually closed and unopenable and fixed in place. A machine can be scanned.

To decide if (m - a machine) is functional: decide yes.

A machine can be quiet. [* quiet is from example 357, like scenery but will still print info if opened ]

Rule for writing a paragraph about a quiet machine (called m):
	if m is open:
		if a thing is in m:
			say "[The m] is open and contains [a list of things which are in m].";
		otherwise:
			say "[The m] is open and empty.";
	now the m is mentioned.

Before inserting something (called s) into a machine (called m) when m is open:
	if s is not a module:
		say "Only modules fit into [the m].";
		stop the action.

Instead of examining a machine (called m):
	say the description of m;
	let open space be the carrying capacity of m minus the number of things contained in m;
	;
	if m is open:
		say paragraph break;
		if a thing is in m:
			say "[regarding the m][They] [are] open, revealing [a list of things which are in m]";
			if open space is positive:
				say " and space for [open space in words] more module[s]."; [todo test]
			otherwise:
				say ".";
		otherwise if the carrying capacity of m is zero:
			say "[regarding the m][They] [are] open.";
		otherwise:
			say "[regarding the m][They] [are] open, revealing space for [open space in words] module[s]."; [ todo ]
	otherwise:
		say "[line break]";
	;
	follow the list attached things when examining receiver or inserter rule. [* from Plugs and Sockets ]

Instead of scanning a machine (called m):
	now m is scanned;
	computerize "Machine is [if m is functional]functional[else]failed[end if]."

Instead of the scanner opening a machine (called m):
	if m is not openable:
		computerize "Machine is unitary.";
	otherwise if m is open:
		computerize "Machine is already open.";
	otherwise:
		computerize "Opening.";
		;
		if a thing is in m:
			say "[The m] swing[s] open, revealing [a list of things which are in m]";
			let open space be the carrying capacity of m minus the number of things contained in m;
			if open space is positive:
				say " and space for [open space in words] more module[s]."; [todo test s]
			otherwise:
				say ".";
		otherwise if the carrying capacity of m is zero:
			say "[The m] swing[s] open.";
		otherwise:
			say "[The m] swing[s] open, revealing space for [the carrying capacity of m in words] module[s]."; [todo]
		;
		now the m is open;
	rule succeeds.

Instead of opening a machine, say "You will need to use the scanner to do that.";

After closing a machine (called m), say "You close [the m] and it seals without any trace of a seam.";

After printing the name of a machine (called m), if m is closed, omit contents in listing.

Chapter 3 - Machinelike

[ An adjective to apply to other things so that they get a default response from the scanner. ]

A thing can be machinelike. Things are usually not machinelike. Things can be scanned.

Instead of scanning something that is machinelike, computerize "Machine is functional.";

Instead of the scanner opening something that is machinelike:
	computerize "Machine is unitary.";
	rule succeeds.

Chapter 4 - The Scanner and Scanning

Include Inanimate Listeners by Emily Short.

Section 1 - New Grammar

[ Note that we implement scanning as the player scanning something, but pretend this is a shortcut for "scanner, scan ___" but we implement help and opening only as the second form, because the commands are already in use. One downside is that means the scanning action needs a Check rule to make sure the scanner is available, while this lives elsew]
			
Scanning is an action applying to one thing.
Scanning it with is an action applying to two things.
Bare scanning is an action applying to nothing.

Understand "scan [something]" as scanning.
Understand "scan [something] with [the scanner]" as scanning it with.
Understand "scan" as bare scanning.

Check scanning: unless the scanner is at hand, stop the action.
Check bare scanning: unless the scanner is at hand, stop the action.

Carry out scanning: computerize "No modular technology detected."
Carry out scanning it with: try scanning the noun instead.

Carry out bare scanning:
	computerize "Syntax error: no target.";
	explain the scanner

Section 2 - The Scanner

The scanner is a machinelike addressable thing. The scanner can be explained. It is not explained. It has description "The handheld voice-activated scanner you use when working on the station's machines."

The scanner fail count is a number that varies. Scanner fail count is 0.

To explain the scanner:
	if the scanner is not explained:
		now the scanner fail count is 0;
		now the scanner is explained;
		lnote "You can ask the scanner for a list of commands by typing 'scanner, help' and give it voice commands by typing phrases such as 'scanner, scan SOMETHING' or 'scanner, open SOMETHING' where SOMETHING is a visible object.";
	otherwise:
		increase the scanner fail count by 1;
		if the scanner fail count is 3:
			now the scanner is not explained;

To decide if the scanner is at hand:
	if the player encloses the scanner and the scanner is visible, decide yes;
	if the scanner is visible:
		say "You must be carrying the scanner to use it.";
	otherwise:
		say "That makes no sense without a scanner.";
	decide no.

To scanner syntax error:
	computerize "Syntax error: command not in vocabulary.";
	explain the scanner;

Persuasion rule for asking the scanner to try scanning or opening or closing something:
	if the scanner is at hand, persuasion succeeds;
	persuasion fails.

Persuasion rule for asking the scanner to try getting help:
	if the scanner is at hand, persuasion succeeds.

Persuasion rule for asking the scanner to try bare scanning:
	if the scanner is at hand, persuasion succeeds.

Persuasion rule for asking the scanner to try doing something: [ any other interaction fails ]
	if the scanner is at hand:
		say "[start computer]Syntax error: command not in vocabulary.[stop computer]";
		if the scanner fail count is 3, now the scanner is not explained;
		if the scanner is not explained:
			say "[line break]";
			explain the scanner;
		otherwise:
			increase the scanner fail count by 1;
		[ gymnastics & lnote rather than note above to avoid Inform deciding to fall through to the "has better things to do" message, this is the don't end with paragraph break issue, see Writing with Inform §12.4 ]
	persuasion fails.

Instead of switching on or switching off the scanner:
	say "The scanner is always on and listening.[paragraph break]";
	explain the scanner.

Instead of the scanner closing something:
	computerize "Command error: closing is a manual process.";
	rule succeeds.

Instead of the scanner scanning something:
	try the player scanning the noun;
	rule succeeds.

Instead of scanning the scanner, computerize "Self test completed. Scanner is functional."

Instead of the scanner getting help:
	computerize "Recognized commands are 'help', 'open', and 'scan'.";
	now the scanner is not explained;
	explain the scanner;
	rule succeeds.

Instead of the scanner opening something (called m):
	computerize "No electronic technology detected.";
	rule succeeds.

Instead of an actor bare scanning when the actor is not the player:
	unless the scanner is at hand, rule succeeds;
	try bare scanning;
	rule succeeds.

Instead of answering the scanner that something:
	unless the scanner is at hand, stop the action;
	if the topic understood matches the regular expression "^help\s":
		try the scanner getting help instead;
	else if the topic understood matches the regular expression "^(scan|open|close)\s+(.*)":
		computerize "Search error: cannot find [text matching subexpression 2].";
		explain the scanner;
	otherwise:
		scanner syntax error;
		explain the scanner;

Instead of asking or telling the scanner about something, if the scanner is at hand, scanner syntax error;

After examining the scanner, explain the scanner.

Section 1 - Tweaks for Standard Rules

[ 
	Zarf's fix from	https://intfiction.org/forum/viewtopic.php?f=7&t=26951 for:

	>scanner, go
	You'll have to say which compass direction to go in.
	I didn't understand that instruction.
]

The action processing internal rule response (K) is "[internal rule exception]"

To say internal rule exception:
	if the action name part of the current action is the going action and the person asked is not yourself:
		say "[run paragraph on]";
	else:
		say "I didn't understand that instruction."

[
	Let's also change the message for vaguely going, because we don't have compass directions.
	
	It is possible to put logic here like "if the person asked is the scanner and the player is holding the scanner", but then we would probably need to deal with other incomplete commands like "scanner, open" and let's just not open that door.
]

The block vaguely going rule response (A) is "You'll have to say which direction to go in."

Chapter 5 - Kinds of Modules

A power module is a kind of module.
An instruction module is a kind of module.
A pressure regulation module is a kind of module. Understand "regulator" as a pressure regulation module.



Book 3 - Scenes

Section 1 - Beginning

Beginning is a scene.
Beginning begins when play begins.
Beginning ends when Ready to Repair begins.
Beginning ends when Repairing Pod Bay begins.

Section 2 - Ready to Repair
[ this scene may not happen ]

Ready to Repair is a scene. "You have walked the entire ring. Everything is as expected, much is not working. Now, it's time to leave. The pods are below Sector 1."
Ready to Repair begins when every room in The Sectors is visited for the first time and Beginning has not ended.
Ready to Repair ends when Repairing Pod Bay begins.

Section 3 - Repairing Pod Bay

Repairing Pod Bay is a scene.
Repairing Pod Bay begins when Pod Control is visited.
Repairing Pod Bay ends when Repairing Red Breaker has ended and Repairing Green Breaker has ended and Repairing Atmosphere Pump has ended.

[ these subscenes could begin/end at the same time if repairs have already happened, so shouldn't print anything ]

Repairing Red Breaker is a scene.
Repairing Red Breaker begins when Repairing Pod Bay begins.
Repairing Red Breaker ends when the red circuit breaker is switched on.

Repairing Green Breaker is a scene.
Repairing Green Breaker begins when Repairing Pod Bay begins.
Repairing Green Breaker ends when the green circuit breaker is switched on.

Repairing Atmosphere Pump is a scene.
Repairing Atmosphere Pump begins when Repairing Pod Bay begins.
Repairing Atmosphere Pump ends when the atmosphere pump is scored. [* because "atmosphere pump is functional" here seems to check the (non-existent) status adjective instead of the phrase ]

Section 4 - Between Repairs

Between Repairs is a scene. "It is time to say goodbye to the station. You are ready to leave in a pod."
[ Between Repairs begins when the pod bay is ready for the first time. ]
Between Repairs begins when Repairing Pod Bay ends.
Between Repairs ends when Repairing Comms begins.

Every turn during Between Repairs:
	let t be the minutes part of time since Between Repairs began;
	if t is greater than 0 and the remainder after dividing t by 15 is 0:
		say "There is nothing left for you here. It's time to take a pod and leave."

Section 5 - Repairing Comms

Repairing Comms is a scene. "This is troubling. You counted. You were sure there would be one pod left. There are none."
Repairing Comms begins when the player is in Pod Bay for the first time.
Repairing Comms ends when The End begins.

When Repairing Comms begins: increase the score by 10. [* for entering the pod bay ]

Every turn during Repairing Comms:
	let t be the total minutes of time since Repairing Comms began;
	if t is 3:
		say "No pods left ... you consider despair.";
	if t is 5:
		say "So what if you can't escape in a pod. You will just need to bring a pod here. Time to get the communications module working."
	[ todo -- more messages ?]

Section 6 - The End

The End is a scene. "The audio unit beeps and a synthesized voice says 'Comms ready.'[paragraph break]After a moment, it says 'Launching automatic routines.'"
The End begins when the communications unit is usable for the first time.

When The End begins: increase the score by 10. [* for calling for help ]

Every turn during The End:
	if the total minutes of time since The End began is greater than zero and the communications unit is usable and the communications unit is visible:
		let ov be a random number between 2100 and 9998; [* I have no idea why I want to randomize this ]
		say
			"You hear a human speaking from the audio unit: 'RWSS [italic type]Founder's Mercy[roman type], this is OV-[ov], over...[paragraph break]"
			,
			"'There's really somebody there? We thought your station had been abandoned for kilodays...[paragraph break]"
			,
			"'Standby...[paragraph break]"
			,
			"'We can have a pod there in about a thousand minutes.'[no line break]";
		end the story finally saying "You are not alone.".

Book 4 - Hints

Section 0 - Setup

Help disabled is a truth state that varies. Help disabled is false.

Understand "help" or "hint" or "hints" as getting help.
Getting help is an action applying to nothing.

Understand "help off" or "hint off" or "hints off" or "disable help/hint/hints" as disabling help.
Disabling help is an action out of world applying to nothing.

Instead of getting help when help disabled is true:
	say "You have disabled hints, but don't despair. It is still impossible to put this game into an unwinnable state, so feel free to explore and experiment."

Before the player getting help for the first time:
	if help disabled is false:
		say "Your objective is simply to leave the station and find other people."

After the player getting help for the first time:
	say
		"By the way, it should be impossible to put this game into an unwinnable state, so feel free to explore and experiment.[paragraph break]"
		,
		"If you are having trouble getting started, I suggest reading [italic type]A Beginner's Guide to Interactive Fiction[roman type] by Stephen Granade and Emily Short, available at:[paragraph break]"
		,
		"[fixed letter spacing]  https://brasslantern.org/players/howto/beginnersguide.html[roman type][paragraph break]";
		note "You can type 'hint' any time for contextual assistance. If you prefer not to be tempted, you can type 'hints off' to disable hints."

Carry out disabling help:
	if help disabled is true, say "Hints are already disabled." instead;
	say "Disabling hints is irreversible.[paragraph break]Are you sure? >";
	if the player consents:
		say "Ok. Hints are now disabled.";
		now help disabled is true;
	otherwise:
		say "Ok. Hints remain available.";

Section 1 - Beginning

Carry out getting help when Beginning is happening:
	say "You can start by looking around and leaving your initial location."

Section 2 - Ready to Repair

Carry out getting help when Ready to Repair is happening:
	say "It's time to leave the station, but you need to explore a little more.";

To decide what number is the open pod repair count:
	let n be 0;
	if Repairing Red Breaker is happening, increment n;
	if Repairing Green Breaker is happening, increment n;
	if Repairing Atmosphere pump is happening, increment n;
	decide on n.

Carry out getting help when Repairing Pod Bay is happening:
	if the status display is not examined:
		say "You need to repair some things. Check out the status display in Pod Control.";
	otherwise:
		let c be the open pod repair count;
		if c is greater than one, say "You need to make [c in words] repairs, so you get [c in words] hints:[paragraph break]";
		if Repairing Red Breaker is happening, say "[if c > 1]  • [end if][red breaker help]";
		if Repairing Green Breaker is happening, say "[if c > 1]  • [end if][green breaker help]";
		if Repairing Atmosphere Pump is happening, say "[if c > 1]  • [end if][pump help]";

To say pump help:
	if the atmosphere pump is functional:
		if the atmosphere pump is open:
			say "The status display has some clear directions.";
		else:
			say "Now this is strange."; [* this should not happen because the scene will have ended ]
	else:
		unless any machine has been scanned:
			say "Now might be a good time to try out the scanner.";
		else unless a machine has been open:
			say "Scanning isn't the only thing that the scanner can do.";
		else unless any module has been scanned:
			say "You can also scan modules.";
		else unless there is a functional handled power module and there is a functional handled pressure regulation module:
			say "You still need to find some modules.";
		else unless the player encloses a functional scanned power module and the player encloses a functional scanned pressure regulation module:
			say "You still need to scan some modules.";
		else:
			say "Put appropriate functional modules into the pump."

To say green breaker help:
	say "Reset a circuit breaker somewhere in Sector 2.";

To say red breaker help:
	if Center Platform is visited:
		say "Just turn the red breaker on.";
	else if the gravity boots are scored:
		say "You have found what you need to reach the circuit breaker, so go figure out where to use it.";
	else if the laser is alarmed: [ i.e., you have tried but not yet succeeded to remove to boots ]
		say eraser help;
	else if the supply vault is visited:
		say "You have seen what you need to reach the circuit breaker.";
	else:
		say "Explore a bit more.";

To say eraser help:
	if  the eraser is attacked:
		say "You seem to have figured out the trick to avoiding the alarm.";
	else if the eraser is dusty:
		say "You have completed the necessary preparation to avoid the alarm.";
	else if School is visited:
		say "You have found what you need to evade the alarm, but it still needs some preparation.";
	else:
		say "You need to evade the alarm, but first explore a bit more.";

Section 3 - Between Repairs

Carry out getting help when 	Between Repairs is happening:
	if S1H1 is open: 	[ todo - check if door has been tried since this scene began? ]
		say "Pod Control acts as an airlock.";
	else if atmosphere pump is open:
		say "The status display has some clear directions.";
	otherwise:
		say "There's no point in waiting. You just need to enter the pod bay."

Section 4 - Repairing Comms

Carry out getting help when Repairing Comms is happening: [todo]
	unless communications unit is handled:
		say "Find the emergency communications unit.";
	else unless audio and communications are connected:
		say "Connect the communications unit to an audio source.";
	else unless audio unit is functional:
		say "Repair the audio unit.";
	else if audio unit is open:
		say "Close the audio unit.";
	else:
		say "Just wait." [* this shouldn't happen either ]

Section 5 - The End

Carry out getting help when The End is happening:
	say "Just wait."

Book 5 - Regions

Underneath is a region.

The Sectors is a region.

Before going spinward in the The Sectors:
	say "You walk a little ways to the next sector."

Before going antispinward in the The Sectors:
	say "You walk a little ways to the next sector."
	
The hub is a backdrop in The Sectors and in Center Platform. It has description "The station rotates around the hub, which extends out to hold solar panels on the port and mirrors on the starboard side.[if the player is not in the center platform] On the inside, there is a mesh maintenance platform."

The solar panels are a backdrop in The Sectors and in Center Platform. They have description "The primary source of station power." Understand "panel" as solar panels..

The mirrors are a backdrop in The Sectors and in Center Platform. They have description "The mirrors reflect sunlight into the station." Understand "mirror" and "sun" and "light" and "sunlight" as mirrors.

The maintenance platform is a backdrop in The Sectors. It has description "Since the main power and sensor feeds pass through the hub, there is a platform where you can perform various maintenance tasks."

Instead of doing anything other than examining or scanning to the hub when the player is not in the center platform:
	say "You are too far away to do that."
	
Instead of doing anything other than examining or scanning to the solar panels:
	say "You are too far away to do that."

Instead of scanning the solar panels:
	computerize "Machine is functional. Operating at [one of]73[or]72[or]71[then purely at random]% efficiency."

Instead of the scanner opening the solar panels:
	computerize "Machine is unitary.";
	rule succeeds.
	
Instead of doing anything other than examining or entering or scanning to the maintenance platform:
	say "You are too far away to do that."

Instead of entering the maintenance platform:
	say "You will need to climb a pylon to get there."

Book 6 - The Ring

Chapter 1 - Sector 1

Sector 1 is a room in The Sectors. "You still maintain the crops here. There is a small graveyard and the barn remains from when this was the livestock sector. A pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 1: Crops". It has destination name "sector 1".

There is a pylon in Sector 1.

Some crops are scenery in Sector 1. They have description "You are proud of the grain and legumes." Understand "grain" and "legumes" as some crops.

The graveyard is scenery in Sector 1. It has description "Fenced off but unmarked graves. You buried your parents here." Understand "graves" and "grave" and "fence" as the graveyard.

Instead of eating some crops, say "You're not hungry."

Section 1 - Barn

A S1B1 is a building. It is inside of Sector 1. Through it is Barn. S1B1 is scenery. It has description "A single story barn." It has printed name "barn". Understand "barn" as S1B1.

Barn is a room. "Not fancy: livestock on one side and feed on the other, but nothing remains of either. There is a plow near the entrance." Sector 1 is outside of barn.

A plow is scenery in the barn. It is pushable between rooms. It has description "A steel walking plow."

Before pushing or pulling or turning or taking the plow, say "This plow is too heavy to move around without purpose." instead.

Before going with the plow, try pushing the plow instead.

Section 2 - Pod Control

There is a room called Pod Control. "This room serves as an airlock for the pod bay, and holds an old space suit and various machinery such as the atmosphere pump. There is a brass plate on the wall."

Pod Control is in Underneath.

S1H1 is a floor hatch. S1H1 is down from Sector 1 and up from Pod Control.

A space suit is here. It is machinelike scenery. It has description "For EVA or extra protection in a pod. Unfortunately, it failed its last periodic inspection: the seals are leaking and there are no spares left." Understand "old" as the space suit.

Before doing anything other than examining or scanning to the space suit, say "All of the seals are shot, so the suit won't be useful." instead

Instead of scanning the space suit, computerize "Machine is failed."

A brass plate is here. It is scenery. It has description "The plate reads:[paragraph break]    RWSS [italic type]Founder's Mercy[roman type][line break]    Laid down 2238, Launched 2241.[line break]    'May His mercy shine upon us.'" Understand "plaque" as plate.

A status display is here. It is scenery and a machine. The status display can be examined.

Understand "message" and "error" as the status display when the pod bay is not ready.

Instead of examining the status display: [todo - shorten lines?]
	now the status display is examined;
	if the pod bay is ready:
		say "The status display glows green.";
	otherwise:
		display "Pod bay locked down";
		let i be 1;
		if red circuit breaker is switched off,
			display " [i]. Telemetry sensor array offline - reset breaker FM36-87/A @ hub platform";
			increment i;
		if green circuit breaker is switched off,
			display " [i]. Launch system cooling loop offline - reset breaker FM29-63/A @ Sector 2";
			increment i;
		if the atmosphere pump is functional:
			if S1H1 is not locked:
				display " [i]. Pod control atmosphere pump offline - close pump";
		else: [the atmosphere pump is not functional]
			display " [i]. Pod control atmosphere pump offline - scan and repair";

The atmosphere pump is here. It is a quiet openable machine. It has carrying capacity 2. It has description "[If the atmosphere pump is functional and the atmosphere pump is not open]The featureless atmosphere pump is softly humming.[otherwise]The atmosphere pump is a smooth featureless machine." Understand "machine" and "machinery" as the atmosphere pump.

There is a faulty power module and a faulty pressure regulation module in the atmosphere pump.

To decide if (m - the atmosphere pump) is functional:
	unless there is a functional power module in the atmosphere pump, decide no;
	unless there is a functional pressure regulation module in the atmosphere pump, decide no;
	decide yes.	

Instead of scanning the atmosphere pump when the atmosphere pump is functional and the atmosphere pump is closed:
	now the atmosphere pump is scanned;
	computerize "Machine is functional and operating."

After closing the atmosphere pump when the atmosphere pump is functional:
	say "You close the atmosphere pump and it begins to hum.";
	if the atmosphere pump is not scored:
		increase the score by 5;
		now the atmosphere pump is scored.

Definition: the pod bay is ready if every circuit breaker is switched on and the atmosphere pump is functional and the atmosphere pump is closed and S1H1 is closed.

Every turn when the player is in Pod Control:
	if the pod bay is ready:
		now the wall hatch is unlocked;
	otherwise:
		now the wall hatch is locked.

After going through the wall hatch:
	say "You close the hatch behind yourself.";
	try silently closing the wall hatch;
	continue the action.

A door called the wall hatch is port from Pod Control and starboard from Pod Bay. It is closed and locked. "[if the player is in Pod Control][pod-bay-hatch-pc][otherwise][pod-bay-hatch-pb][end if]."

Understand "port" as the wall hatch when the player is in Pod Control.
Understand "starboard" as the wall hatch when the player is in Pod Bay.

To say pod-bay-hatch-pc:
	say "Beside the [if wall hatch is open]open[otherwise]secured[end if] port hatch, a status display [if pod bay is ready]glows green[otherwise]shows an error message[end if]"
	
To say pod-bay-hatch-pb:
	say "A [if wall hatch is open]open[otherwise]secured[end if] hatch leads starboard"

Section 3 - Pod Bay

There is a room called Pod Bay. "There are four berths for transit pods. [one of]Unexpectedly,[or]Sadly,[purely at random] all are empty." Pod Bay is in Underneath.

Instead of going nowhere from Pod Bay when the noun is outside, try going starboard.
Instead of exiting in Pod Bay, try going starboard.

Some berths are here. They are machinelike scenery. Understand "four berths" or "berth" and "door" and "doors" and "rail" and "rails" and "iris" and "closed" and "iris" and "pod bay" as some berths. Some berths have description "Each berth would hold a transit pod, but now there are only support rails and closed iris doors."

Instead of the scanner opening some berths:
	computerize "Opening failed. Safety violation.";
	rule succeeds.

Instead of opening or closing the berths, say "The doors open and close automatically as pods dock and launchc."
Instead of unlocking the berths with something, try opening the berths.
Instead of locking the berths with something, try closing the berths.

An emergency communications unit is here. "Someone left an emergency communications unit on the floor." It is a not fixed in place machine. It has description "A portable emergency communications unit with a single socket to connect it to a transit pod or other audio source." It has indefinite article "the". Understand "comms" as communications. Incorporated by the communications unit is a usb socket called the almond socket.

Instead of scanning the communications unit:
	now the communications unit is scanned;
	if audio and communications are connected:
		computerize "Machine functional. Input and output connected.";
	else if organ and communications are connected:
		computerize "Machine functional. Connection mismatch.";
	else:
		computerize "Machine functional. No output available.";

Chapter 2 - Sector 2

Sector 2 is spinward from Sector 1. It is in The Sectors. "A deep pond is used as part of the water filtration system and for raising fish. You can walk spinward or antispinward." It has printed name "Sector 2: Aquaculture". It has destination name "sector 2".

The pond is scenery in sector 2. It has description "Something to do with water filtration, and there are still some fish." Understand "water" and "deep" and "pool" as the pond.

Before looking under the pond, try searching the pond instead.
Before swimming when the player is in Sector 2, try entering the pond instead.
Before swimming in the pond, try entering the pond instead.

Instead of drinking or tasting the pond, say "It's a bit fishy."
Instead of searching the pond, say "[The pond] is pretty murky, but you can see a few fish from here."

Instead of entering the pond:
	if the player is wearing the mask:
		if the green circuit breaker is switched on:
			say "You have already turned the green breaker on.";
		otherwise:		
			say "With the air from the emergency mask, you breathe comfortably as you step into the pond. At the bottom, you find a green circuit breaker and flip it on.";
			now the green breaker is switched on;
			increase the score by 10;
	otherwise:
		say "You can't hold your breath long enough to make that worthwhile."

Some fish are scenery in sector 2. They have description "There are still a few fish swimming in the pond, but they taste horrible."

Instead of doing anything other than examining or scanning to the fish, say "The fish aren't easy to catch."

Chapter 3 - Sector 3

Sector 3 is spinward from Sector 2. It is in The Sectors. "Trees, a house, and a church. A red pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 3: Forest". It has destination name "sector 3".

Nothing is inside from Sector 3.

Instead of going nowhere from sector 3 when the noun is inside, say "You can enter the church or the house."

A pylon called S3P1 is here. It is improper-named. It has description "Made of smooth metal, anodized red, it connects the ground to the hub of the station many meters above." Understand "red" as S3P1.

Before going up in Sector 3, try climbing S3P1 instead.

Instead of climbing S3P1:	
	 if the player is wearing the gravity boots:
		say "It isn't easy, but with the boots, you are able to climb towards the hub.";
		now the player is in center platform;
	otherwise:
		say "The red pylon is designated for climbing, but you can't get a grip."

There is a forest in Sector 3.

Instead of looking under a forest in Sector 3, say "Only the house and church."

A S3B1 is a building. It is scenery. It is port of Sector 3. It is privately-named. It has description "A small white building with a steeple." It has printed name "church". Understand "church" and "steeple" and "small" and "white" and "building" as S3B1. Through it is Church.

A S3B2 is a building. It is scenery. It is starboard of Sector 3. It is privately-named. It has description "What looks like whitewashed siding is really a lightweight plastic." It has printed name "the house". Understand "whitewashed" and "siding" and "lightweight" and "plastic" and "house" and "building" as S3B2. Through it is House.

Section 1 - Church

Church is a room. "Before everyone left or died, you celebrated every sabbath here. The altar stands against one wall, and an organ and an audio unit stand against the other."

An altar is a fixed in place scenery supporter in church. It has description "Really just a table."

The Founder's Testament is on the altar. It has description "The Founder's Testament tells how your people left Old Earth and first settled the station. You know the story by heart, and have already derived whatever comfort you can from this book." It has indefinite article "The". Understand "book" and "bible" as testament.

Sector 3 is outside of church.

Instead of going nowhere in church when the noun is starboard, try going outside.

[ organ ]

The organ is scenery in Church. It is a machine. It has description "It's really just a keyboard in a fancy box with a socket to connect it to an audio unit." It has indefinite article "the". Understand "keyboard" as the organ. The organ can be played. Incorporated by the organ is a usb socket called the tan socket.

Instead of scanning the organ: [ organ is always functional ]
	now the organ is scanned;
	if audio and organ are connected and the audio unit is functional:
		computerize "Machine functional. Output connected.";
	else if organ and communications are connected:
		computerize "Machine functional. Connection mismatch.";
	else:
		computerize "Machine functional. No output available.";

Instead of playing the organ:
	unless the organ is usable, say "Nothing happens." instead;
	if the organ is played, say "You play a few notes." instead;
	say "You never really learned how to play, but you pick out a few notes on the keyboard and the sound reverberates from the audio unit.";
	now the organ is played;

Instead of taking the organ, say "It is too heavy to move."

[ audio unit ]

An audio unit is scenery in Church. It is a openable machine. The description is "The audio unit incorporates a speaker, a microphone, and a socket you would use to connect it to another device." It has carrying capacity 1. Understand "portable" as the audio unit. Incorporated by the audio unit is a usb socket called the beige socket.

There is a faulty power module in the audio unit.

To decide if (m - the audio unit) is functional:
	unless there is a functional power module in m, decide no;
	decide yes.

Instead of scanning the audio unit:
	now the audio unit is scanned;
	unless the audio unit is functional:
		computerize "Machine failed.";
	else if audio and organ are connected:
		computerize "Machine functional. Input connected.";
	else if audio and communications are connected:
		computerize "Machine functional. Input and output connected.";
	else:
		computerize "Machine functional. No input or output available.";

Instead of taking the audio unit, say "That is attached to the wall."

Every turn when the audio unit is visible:
	if the organ was not usable and the organ is usable:
		say "The audio unit beeps and a synthesized voice says 'Organ ready.'";
	if the organ was usable and the organ is not usable and the audio unit is functional and the audio unit is closed:
		say "The audio unit beeps and a synthesized voice says 'No input.'";

[ cable and connectivity ]

A gray cable is in Church. "A gray cable connects the organ and the audio unit." Incorporated by it are two usb plugs. It has description "A one meter USB 7.2 cable with a Type-F plug at each end." Understand "grey" and "usb" and "plug" and "plugs" and "connector" and "connector" as the gray cable. It is machinelike.

Instead of scanning the cable, computerize "Cable is functional."

Instead of the scanner opening the cable:
	computerize "Cable is unitary.";
	rule succeeds.

Understand "pull [the gray cable]" as unplugging.

[ Instead of tying the cable to something, say "Tying the cable would damage it." ]

When play begins: [* this can't be the right way to do this ]
	let first plug be nothing;
	repeat with p running through the usb plugs which are part of the gray cable:
		if the attachment of p is nothing:
			let first plug be p;
			break;
	;
	let first socket be a random usb socket which is part of the organ;
	;
	now the attachment of first plug is the first socket;
	now the attachment of first socket is the first plug;
	;
	let second plug be nothing;
	repeat with p running through the usb plugs which are part of the gray cable:
		if the attachment of p is nothing:
			let second plug be p;
			break;
	;
	let second socket be a random usb socket which is part of the audio unit;
	;
	now the attachment of second plug is the second socket;
	now the attachment of second socket is the second plug;

[ connection checking ]

To decide if (s - a machine) and (t - a machine) are connected:
	decide on whether or not the gray cable is inserted into the s and the gray cable is inserted into the t.

Definition: the communications unit is usable if the communications unit is functional and the audio unit is functional and the audio unit is closed and audio and communications are connected. [* usable means ready for its special purpose, functional just means that modules are all correct and functional ]

Definition: the organ is usable if audio unit and organ are connected and the audio unit is functional and audio unit is closed.

Section 2 - House

House is a room. "Two families lived here, but not recently."

Sector 3 is outside of house.

Instead of going nowhere in house when the noun is port, try going outside.

A doll is in house. "Someone has left a doll on the well swept floor." It has description "Wearing a brown jumpsuit and faceless, because we are all alike in the Founder's eyes." Understand "faceless" and "brown" and "jumpsuit" as the doll.

Section 3 - Center Platform

Sector 3 is down from Center Platform. Nothing is up from Sector 3. Center Platform has description "It's a mesh platform a little below the hub. You feel much lighter here, and you are very aware of how the station rotates, but everything is okay as long as you don't look down."

Before going down from Center Platform:
	change the up exit of Sector 3 to Center Platform;
	if the player is wearing the gravity boots:
		say "You climb down the pylon.";
	otherwise:
		say "You slide down the pylon."

Instead of jumping in Center Platform, say "Yes, pseudogravity is definitely weaker up here."

After dropping something (called s) in Center Platform:
	say "You drop [the s] and it spirals off to the ground below.";
	let r be a random room in the The Sectors;
	now s is in r.

A red circuit breaker is a circuit breaker in center platform. "You can just reach a red circuit breaker on the hub." The red circuit breaker is machinelike.

Instead of scanning the red circuit breaker, computerize "Machine is functional. Breaker is [if the red circuit breaker is switched on]closed[otherwise]open[end if]."

Instead of touching the red circuit breaker, say "It is at arm's reach but accessible."

After switching on the red circuit breaker:
	increase the score by 5;
	continue the action.

Chapter 4 - Sector 4

Sector 4 is spinward from Sector 3. It is in The Sectors. "Your home is here among the crops. You can walk spinward or antispinward." It has printed name "Sector 4: Crops". It has destination name "sector 4".

The S4B1 is a building. It is inside of Sector 4. It is scenery. It has description "You were told it was built to look like a log cabin on Old Earth." It has printed name "home". Through it is Home. Understand "home" or "house" as S4B1.

Some vegetables are scenery in Sector 4. They have description "Greens, carrots, and potatoes." Understand "crops" and "greens" and "carrots" and "potatoes" as some vegetables.

Instead of eating some vegetables, say "You're not hungry."

Section 1 - Home

Home is a room. "The room where you've slept your entire life. You can go out towards the crops."

Sector 4 is outside of home.

The player is in Home. The player is carrying the scanner.

Section 2 - Cellar

S4H1 is a floor hatch. It is down from Home and up from Cellar.

Cellar is in Underneath. "A decompression shelter and space for storage."

An emergency mask is in cellar. "There is an emergency mask hanging on the wall." It has description "You wore this mask when there were decompression drills every ten days." It is wearable and machinelike.

Chapter 5 - Sector 5

Sector 5 is spinward from Sector 4. It is in The Sectors. "The school house is nestled among the trees. A pylon stretches up from the same grove to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 5: Forest". It has destination name "sector 5".

A S5B1 is a building. It is scenery. It is inside of sector 5. It has description "Little and red, the traditional markings of a school building." It has printed name "school building". Through it is School. Understand "school" and "house" as S5B1.

There is a pylon in Sector 5.

There is a forest in Sector 5.

Instead of looking under a forest in Sector 5, say "Only the school house."

Section 1 - School

School is a room. "A broken learning machine remains in a corner, but mostly the older farmers took turns leading the class. There is a desk, and a chalkboard hangs on one wall."

Sector 5 is outside of school.

The learning machine is an openable quiet machine in the school. It has carrying capacity 2. It has description "This last learning machine broke when you were maybe three thousand days old."

Every turn when the learning machine is open and the learning machine is not scored:
	now the learning machine is scored;
	increase the score by 5.

There are a functional power module and a faulty instruction module in the learning machine.

To decide if (m - the learning machine) is functional: decide no. [* since there are no functional instruction modules in the game world ]

After choosing notable locale objects when the player is in the School: 
	set the locale priority of the learning machine to 2;
	continue the activity.

A desk is a fixed in place scenery supporter in the school. It has description "You wrote your lessons at this desk. Your people were practical, plain folk, so you learned practical things in school: reading, writing, arithmetic. More importantly, practical mechanics and farming."

A chalkboard is fixed in place scenery in the school. Understand "chalk board" and "blackboard" and "black board" and "board" as chalkboard. The chalkboard can be cleaned or smudged or written. It is written. It has description "[if the chalkboard is cleaned]The board is perfectly blank.[else if the chalkboard is written]The board is covered in your old arithmetic work.[else]The board is covered in smudges.[end if]". Understand "smudges" as chalkboard when the chalkboard is smudged. Understand "arithmetic" and "work" as the chalkboard when the chalkboard is written. Understand "wall" as the chalkboard.

An eraser is on the desk. The eraser can be clean or dusty. It is clean. The eraser can be attacked. Understand the clean property as describing the eraser. It has description "A [if the eraser is dusty]dusty[otherwise]clean[end if] eraser." It has printed name "[if the eraser is dusty]dusty[otherwise]clean[end if] eraser"

Instead of rubbing the chalkboard:
	if the chalkboard is cleaned:
		say "The chalkboard is already clean.";
	otherwise if the chalkboard is smudged:
		say "You smudge the smudges around with your hand.";
	otherwise:
		now the chalkboard is smudged;
		say "You smudge the writing around with your hand."

Instead of rubbing the chalkboard when the player encloses the eraser and the eraser is visible and the chalkboard is not cleaned:
	say "(with the eraser)[command clarification break]";
	try rubbing the chalkboard with the eraser;

Instead of rubbing the chalkboard with something (called the rubber):
	if the chalkboard is cleaned:
		say "The chalkboard is already clean." instead;
	if the actor is not carrying the rubber, carry out the implicitly taking activity with the rubber;
	if the rubber is:
		-- the eraser:
			say "You carefully erase the chalkboard.";
			now the chalkboard is cleaned;
			now the eraser is dusty;
		-- otherwise:
			say "You smudge the gibberish around with [the rubber].";

Instead of attacking the eraser:
	if the actor is not carrying the eraser, carry out the implicitly taking activity with the eraser;
	if the eraser is clean:
		say "Nothing happens.";
	otherwise:
		now eraser is attacked;
		say "You fill the area with a cloud of dust, which quickly clears."		

Chapter 6 - Sector 6

Sector 6 is spinward from Sector 5 and antispinward from Sector 1. It is in The Sectors. "Your people preferred to grow things the old fashioned way, but in truth the majority of your fruit and vegetables came from this sector when the machines still worked. You can walk spinward or antispinward." It has printed name "Sector 6: Hydroponics". It has destination name "sector 6".

Some hydroponics machines are scenery in Sector 6. It is machinelike. It has description "You were thoroughly trained in hydroponics maintenance, but fixing these machines is beyond you." Understand "machine" and "machinery" as hydroponics machines.

Instead of doing anything other than examining or scanning to the hydroponics machines, say "The hydroponics machines are just so much junk."

Instead of scanning the hydroponics machines, computerize "Machine failed."

Instead of the scanner opening the hydroponics machines:
	computerize "Opening failed.";
	rule succeeds.

Every turn when the player is in Sector 6:
	if the player encloses the gravity boots and the gravity boots are not scored:
		now the gravity boots are scored;
		increase the score by 5.

Vault hatch is a floor hatch. Vault hatch is down from Sector 6 and up from Supply Vault.

Section 1 - The Supply Vault

The Supply Vault is a room. "This room is dim, quiet, and stuffy. There is still a crate of machine parts left.[if laser is dusty][paragraph break]You see a laser beam scan across the exit.[end if]". Supply Vault is in underneath.

[ crate ]

A crate of machine parts is scenery in the supply vault. It has description "These remaining parts never seem to fit anywhere useful, but Founder only knows what's in there."

One faulty instruction module and one functional pressure regulation module are in the junk repository.

To grab some junk:
	let q be a random thing in the junk repository;
	say "You find [a q].";
	find and take q.

Instead of searching the crate of machine parts when something is in the junk repository, grab some junk.
Instead of searching the crate of machine parts, say "Miscellaneous parts, none useful."
Instead of looking under the crate of machine parts, say "The crate rests firmly on the ground."

Instead of inserting something (called s) into the crate of machine parts:
	now s is in the junk repository;
	say "You put [the s] into the crate of machine parts.";

[ boots ]

A pair of gravity boots is in the supply vault. The gravity boots are wearable. They are plural-named. They have description "Black work boots with red stripes. They don't really make gravity, but they do stick to some maintenance walkways to help workers get around in low gravity or on the outside of a rotating station."

[ laser ]

A laser beam is scenery. It has description "The cloud of dust scatters the laser beam just enough that you can see it scan across the north passageway at seemingly random angles." Understand "dust" and "cloud" and "cloud of dust" as the laser beam. The laser can be dusty. The laser beam is not dusty. The laser can be alarmed. The laser is not alarmed.

To trip the laser alarm:
	say "An alarm sounds, [if the vault hatch is open]the hatch slams shut, [end if]and a synthesized voice says 'Laser scan detects unauthorized materiel removal.'";
	if going or opening, say "[line break]The hatch seems to be locked.";
	now the vault hatch is closed;
	now the laser is alarmed;
	stop the action.

Before doing something other than examining when the current action involves the laser beam, say "The laser beam is intangible." instead.

Before going up from the supply vault when the laser is dusty and the vault hatch is open, say "You maneuver around the laser beam."

Before opening vault hatch when the player is in the supply vault and the laser is dusty, say "You maneuver around the laser beam."

Before going up from the supply vault when the player encloses the gravity boots and the laser is not dusty, trip the laser alarm instead.

Before opening vault hatch when
	the player is in the supply vault and
	the vault hatch is closed and
	the player encloses the gravity boots and
	the laser is not dusty, trip the laser alarm instead.

Before touching the laser beam when the player encloses the gravity boots, trip the laser alarm instead.

Instead of attacking the dusty eraser in the supply vault:
	if the actor is not carrying the eraser, carry out the implicitly taking activity with the eraser;
	if the laser is dusty:
		say "You add to the cloud of dust.";
	otherwise:
		say "You fill the vault with a cloud of dust and you can now see a laser beam scanning across the hatch.";
	the laser dust settles in four turns from now;
	now the laser is dusty;
	now eraser is attacked;

After deciding the scope of the player when the location is the supply vault and the laser beam is dusty, place the laser beam in scope.

At the time when the laser dust settles:
	now the laser is not dusty;
	if the player is in the Supply Vault, say "The cloud of dust finally dissipates.";

[ --- ]