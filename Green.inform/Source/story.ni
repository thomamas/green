"Founder's Mercy" by Thomas Insel

[
	Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
	http://tinsel.org/IF/
	
	This work is licensed under a Creative Commons Attribution 4.0 International License.
	https://creativecommons.org/licenses/by/4.0/	
]

[
	The station is named RWSS Founder's Mercy, as well as the game.

	Usage:
		never use an article
		italicize name but not prefix
		RWSS=rotating wheel space station
		RWSS _Founder's Mery_ is a _Founder's Glory_-class rotating wheel space station laid down in ...
]

[
	TODO:

	- add a couple of references to the station name/initials.

	- consistent approach to scenery responses ... just junk, etc.
	
	Machine bits:
		- at least one more machine w/ components
		- put the functional pressure regulator module somewhere
		- spare parts...

	- another way to practice boots?	
	
	THESE ROOMS ARE STILL UNUSED:
		
		Barn
		Church
		House
		
		& some sectors are only connected to places

	TODO: radio/win

	Every turn when the player is in Pod Bay: [todo]
		say "SInce the game isn't finished, here's some text: You notice that there are no pods left. You despair. But then you find the communications system and call for help. Someone comes.";
		end the story finally saying "...you have won".
]

Book 1 - Setup

Chapter 1 - The story

Use American dialect and the serial comma.

The story headline is "A Space Story". The story genre is "Science Fiction". The release number is 1. The story creation year is 2018.

The story description is "You awake. You are lonely, so lonely. It was a thousand days ago today. All alone these thousand days. Your parents were the last. No, your father was the last. He held on for nearly a hundred days longer. No, you are the last. Alone. Adrift.

But maybe it isn’t hopeless. There must still be other people in other worlds, and you think you know how to get there.

Today is the day."

When play begins:
	say "[the story description][paragraph break]";
	now exit listing is enabled.

Release along with cover art ("A space station."), an interpreter, the introductory booklet, the library card, and a "Local" website.

Chapter 2 - Scoring

Use scoring. The maximum score is 50. An object can be scored. An object is usually not scored.

[
	5 - getting the boots out of the vault
	5 - red breaker

	10 - green breaker (in the pond)

	5 - opening the learning machine
	5 - fixing and closing the atmosphere pump

	10 - visiting pod bay for the first time

	10 - calling for help (todo)

	consider decreasing each section to 8 points, and then have 10 points to reward misc. positive action.
]

Chapter 3 - Notes

To say start note: say "[note style][bracket]".
To say stop note: say "[close bracket][roman type]".

To say start computer: say "[fixed letter spacing]".
To say stop computer: say "[roman type]".

To computerize (x - some text):
	say "[start computer][x][stop computer][paragraph break]";
	
To note (x - some text):
	say "[start note][x][stop note][paragraph break]";

Chapter 4 - Misc Phrases

To find and take (s - an object):	
	now s is in the holder of the player;
	try silently taking s;
	set pronouns from s;

Chapter 5 - Extensions

Include Glulx Text Effects by Emily Short

Include Unicode Character Names by Graham Nelson.

Include Exit Lister by Eric Eve.

The explain exit listing rule does nothing.

Report ExitListing when listing explained is false:
	now listing explained is true;
	say "[start note]Type 'exits off' to disable the status line exit list and 'exits on' to turn it back on.[no line break][stop note][line break]"

Chapter 6 - Directions

The starboard is a direction. The starboard has opposite port. Understand "s" as starboard when the location is stellar.

The port is a direction. The port has opposite starboard. Understand "p" as port when the location is stellar.

The spinward is a direction. The spinward has opposite antispinward. Understand "sw" as spinward when the location is stellar.

The antispinward is a direction. The antispinward has opposite spinward. Understand "asw" as antispinward when the location is stellar.

Does the player mean going a stellar direction when the location is stellar: it is very likely.

A room can be stellar or planetbound. A room is usually stellar.

A direction can be stellar or planetbound. A direction is usually not stellar. Starboard, port, spinward, antispinward, up, down, the inside and the outside are stellar.

Before going a stellar direction when the location is not stellar, say "Stellar directions can only be used on board ship." [* This can never happen in this game.]

Directions were explained is a truth state that varies. Directions were explained is false.

Before going an planetbound direction when the location is stellar:
	say	"You have heard of compass directions like [noun], but they don't make any sense here. Instead, you can go spinward, antispinward, port, and starboard. When you look spinward, port is left and starboard is right.[paragraph break]";
	unless directions were explained is true:
		say "[start note]You can use the abbreviations 'sw', 'asw', 'p', and 's'. You can also go 'up', 'down', 'in', and 'out' where appropriate. Type 'exits' if you get confused about geography.[no line break][stop note][paragraph break]";
		now directions were explained is true;
	stop the action.
	
Index map with spinward mapped as north. Index map with antispinward mapped as south. Index map with port mapped as west. Index map with starboard mapped as east.

Chapter 7 - Regions

Underneath is a region.

Main Level is a region.

Before going spinward in the Main Level:
	say "You walk a little ways to the next sector."

Before going antispinward in the Main Level:
	say "You walk a little ways to the next sector."
	
The hub is a backdrop in Main Level and in Center Platform. It has description "The station rotates around the hub, which extends out to hold solar panels on the port and mirrors on the starboard side.[if the player is not in the center platform] On the inside, there is a mesh maintenance platform."

The solar panels are a backdrop in Main Level and in Center Platform. They have description "The primary source of station power." Understand "panel" as solar panels..

The mirrors are a backdrop in Main Level and in Center Platform. They have description "The mirrors reflect sun light into the station." Understand "mirror" and "sun" and "light" and "sunlight" as mirrors.

The maintenance platform is a backdrop in Main Level. It has description "Since the main power and sensor feeds pass through the hub, there is a platform where you can perform various maintenance tasks."

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

A building is a kind of door. It is usually open. It is usually not openable. It is usually privately-named. It is usually improper-named.

[ To represent the outside of buildings you go out/in from in the ring. ]

Chapter 9 - Kinds of Other Things

A pylon is a kind of thing. It is usually scenery. It is usually privately-named. It usually has printed name "the pylon". Understand "pylon" as pylon. A pylon usually has indefinite article "the". A pylon usually has description "Made of smooth metal, it connects the ground to the hub of the station many meters above."

Instead of climbing a pylon (called p):
	say "The pylon is slick metal with no obvious handholds."

Before going nowhere when a pylon (called p) is visible:
	if the noun is up, try climbing p instead.

A circuit breaker is a kind of device. Circuit breakers are usually fixed in place.

Instead of switching off a circuit breaker (called b) when b is switched on:
	say "[The b] seems to be locked on."

The green circuit breaker is a circuit breaker. It is switched off.

A forest is a kind of thing. It is usually scenery and privately-named and plural-named. It usually has printed name "some trees". Understand "tree" and "trees" and "forest" and "grove" as a forest. A forest usually has description "The community grew trees for tradition, or maybe they help with air processing."

Instead of climbing a forest:
	if the player is wearing the gravity boots:
		say "Trees aren't magnetized, so the boots won't help.";
	otherwise:
		say "You can't get a good grip."

Chapter 10 - About

Requesting the credits is an action out of world and applying to nothing.

Understand "about" or "credits" as requesting the credits.
	
After printing the banner text rule:
	say "Type 'about' for credits and more information.";
	
Carry out requesting the credits:
	say	"[bold type]About Founder's Mercy[roman type][line break]",
		"[italic type]Founder's Mercy[roman type] is my second released Inform project, conceived and implemented in November of 2018. It should be impossible to put this game into an unwinnable state.[paragraph break]",
		"The cover art is adapted from Figure 1.1 from NASA SP-413, [italic type]Space Settlements: A Design Study[roman type], edited by Richard D. Johnson and Charles Holbrow, and available from The Internet Archive at [fixed letter spacing]https://archive.org/details/SpaceSettlementsADesignStudy1977[roman type] .[paragraph break]",
		"Please send your feedback, bug reports, and requests for help to [fixed letter spacing]tinsel@tinsel.org[roman type]. You can always find the current version of this game at [fixed letter spacing]http://tinsel.org/IF/[roman type] .[paragraph break]",
		"This work is Copyright © 2018 Thomas Insel but may be freely shared according to the terms of the Creative Commons Attribution 4.0 International license ([fixed letter spacing]https://creativecommons.org/licenses/by/4.0/[roman type]).".

[
	Includes
		Exit Lister version 11 by Eric Eve
		Unicode Character Names by Graham Nelson
		Glulx Text Effects by Emily Short *
		Inanimate Listeners by Emily Short *
		
	Tested with
		Object Response Tests version 7 by Juhana Leinonen
]

Chapter 11 - Machines, Components, Scanning, etc

Section 1 - Components

Status is a kind of value. The statuses are functional and faulty.

A component is a kind of thing. A component has a status. The status of a component is usually functional. Understand "module" as a component. A component usually has description "It is a standardized machine module."

After examining a component (called c):
	if c is scanned, say "The scanner reported this [c] as [status of c]."

A component can be scanned.

To decide if any component is scanned:
	repeat with x running through components:
		if x is scanned, decide yes;
	decide no.

To say the qualifier of (c - a component):
	if c is scanned:
		say "[status of c] ";
	else if any component is scanned:
		say "unscanned ";
	otherwise:
		do nothing.

Before printing the plural name of a component (called c), say the qualifier of c.

Before printing the name of a component (called c) while not examining, say the qualifier of c.

Understand the status property as describing a component when the item described is scanned.
Understand "unscanned" as a component when the item described is not scanned.
Understand "scanned" as a component when the item described is scanned.

Instead of scanning a component (called c):
	computerize "Component is [status of c].";
	now c is scanned.

Section 2 - Machines

[ Machinelike things get a default response to scanner actions. ]

Something can be machinelike. Things are usually not machinelike.

Instead of the scanner opening something that is machinelike:
	computerize "Machine is unitary.";
	rule succeeds.

Instead of scanning something that is machinelike:
	computerize "Machine is functional.";

[ Real machines ]

A machine is a kind of container. A machine is usually closed and unopenable and fixed in place.

Before inserting something (called s) into a machine (called m):
	if s is not a component:
		say "Only modules fit into [the m].";
		stop the action.

After examining a machine (called m):
	let contents be the number of things contained in m;
	let capacity be the carrying capacity of m;
	if capacity is greater than contents:
		say "There is space for [capacity - contents in words] more module[s].";

To decide if (m - a machine) is functional:
	decide yes;

To say the machine status of (m - a machine):
	if m is functional:
		say "functional";
	otherwise:
		say "failed";

Instead of scanning a machine (called m):
	computerize "Machine is [the machine status of m].";

[ quiet is from example 357, like scenery but will still print info if opened ]

A machine can be quiet. [example 357]

Rule for writing a paragraph about a quiet machine (called m):
	if m is open:
		if a thing is in m:
			say "[The m] is open and contains [a list of things which are in m].";
		otherwise:
			say "[The m] is open and empty.";
	now the m is mentioned.

Section 3 - Scanner and Scanning

Include Inanimate Listeners by Emily Short.

Scanning is an action applying to one thing.

Understand "scan [something]" as scanning.

Before scanning:
	unless the scanner is at hand, stop the action.

Carry out scanning:
	computerize "No modular technology detected.";

Bare scanning is an action applying to nothing.

Understand "scan" as bare scanning.

Before bare scanning:
	unless the scanner is at hand, stop the action.

Carry out bare scanning:
	computerize "Syntax error: no target.";
	explain the scanner

[]

The scanner is an addressable thing. The scanner can be explained. It is not explained. It is machinelike.
The scanner fail count is a number that varies. Scanner fail count is 0.
The scanner has description "The handheld voice-activated scanner you use when working on the station's machines."

Instead of scanning the scanner, computerize "Self test completed. Scanner is functional."

To decide if the scanner is at hand:
	if the player encloses the scanner and the scanner is visible, decide yes;
	if the scanner is visible:
		say "You must be carrying the scanner to use it.";
	otherwise:
		say "That makes no sense without a scanner.";
	decide no.	

After examining the scanner, explain the scanner.

Instead of switching on the scanner:
	say "The scanner is always on and listening.[paragraph break]";
	explain the scanner.
	
Instead of switching off the scanner, try switching on the scanner.

To explain the scanner:
	if the scanner is not explained:
		now the scanner fail count is 0;
		now the scanner is explained;
		note "You can ask the scanner for a list of commands by typing 'scanner, help' and give it voice commands by typing phrases such as 'scanner, scan SOMETHING' or 'scanner, open SOMETHING' where SOMETHING is a visible object.";
	otherwise:
		increase the scanner fail count by 1;
		if the scanner fail count is 3:
			now the scanner is not explained;

To scanner syntax error:
	computerize "Syntax error: command not in vocabulary.";
	explain the scanner;

[ scanner, scan <something that is visible> ]

Persuasion rule for asking the scanner to try scanning or examining or opening something:
	persuasion succeeds.

Instead of the scanner scanning or examining something:
	try the player scanning the noun;
	rule succeeds.

Instead of the scanner opening something (called m):
	if m is a component:
		computerize "Component is unitary.";
	otherwise if m is a machine:
		if m is not openable:
			computerize "Machine is unitary.";
		otherwise if m is open:
			computerize "Machine is already open.";
		otherwise:
			computerize "Opening.";
			say "[The m] swings open.";
			now the m is open;
	otherwise:
		computerize "No electronic technology detected.";
	rule succeeds.

After printing the name of a machine (called m):
	if m is closed, omit contents in listing.

Instead of opening a machine:
	say "You will need to use the scanner to do that.";
	
After closing a machine (called m):
	say "You close [the m] and it seals without any trace of a seam.";

[ scanner, scan ]

Persuasion rule for asking the scanner to try bare scanning:
	persuasion succeeds.
 
Instead of an actor bare scanning when the actor is not the player:
	unless the scanner is at hand, rule succeeds;
	try bare scanning;
	rule succeeds.

[ any other interaction fails ]

Persuasion rule for asking the scanner to try doing something:
	if the scanner is at hand:
		say "[start computer]Syntax error: command not in vocabulary.[stop computer]";
		[ skip explanation to avoid Inform deciding to fall through to the "has better things to do" message, this is the don't end with paragraph break issue, see Writing with Inform §12.4 ]
	persuasion fails.

Instead of answering the scanner that something:
	unless the scanner is at hand, stop the action;
	if the topic understood matches the regular expression "^help$":
		computerize "Recognized commands are 'help', 'open', and 'scan'.";
		now the scanner is not explained;
		explain the scanner;
	else if the topic understood matches the regular expression "^(scan|open)\s+(.*)":
		computerize "Search error: cannot find [text matching subexpression 2].";
		explain the scanner;
	otherwise:
		scanner syntax error;
		explain the scanner;

Instead of asking the scanner about something:
	if the scanner is at hand, scanner syntax error;	

Instead of telling the scanner about something:
	if the scanner is at hand, scanner syntax error;

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

Section 4 - Kinds of Components

A power module is a kind of component.
An instruction module is a kind of component.
A pressure regulator module is a kind of component.

Chapter 12 - The Player

The player is female. The carrying capacity of the player is 3.

Instead of examining the player, say "As virtuous as ever."

The player is wearing a green jumpsuit. The jumpsuit has description "You have worn modest jumpsuits like this since you were small. Originally, the colors had meanings: green for farmers, blue for technicians, and so on, but that distinction died even before the population." Understand "suit" and "jump suit" as jumpsuit.

The pocket is part of the jumpsuit. It is a container.

[ a player's holdall must be directly carried, so let's try this instead ]

Before an actor taking:
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

Before inserting something into the jumpsuit:
	try inserting the noun into the pocket instead.

After taking off the jumpsuit:
	say "Your nudity is pure and innocent, but still a little uncomfortable ... and cold."

Instead of taking inventory:
	if the first thing held by the player is nothing, say "[We] [are] carrying nothing." instead;
	say "[We] [are] carrying:[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation;
	if the pocket contains something and the player is wearing the jumpsuit:
		say "[line break][Our] jumpsuit pocket contains:[line break]";
		list the contents of the pocket, with newlines, indented, including contents, giving inventory information, with extra indentation.

Chapter 13 - Actions

Section 1 - Remove Some Actions

Understand the command "wake" as something new. [ too self-referential ]
Understand the command "buy" as something new. [ no money in this game ]

Section 2 - Modify Some Default Responses

Before attacking or cutting something when the noun is not the eraser and the noun is not the player:
	say "The Founder said that violence is never the answer.";
	stop the action.

Instead of burning something:
	say "There is no open flame on the station." instead.
	
Instead of cutting or attacking yourself:
	say "Imperfect vessel that you are, that is not the answer." instead.

Instead of listening to a room:
	say "You hear only the familiar hum of the station."

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

Carry out an actor rubbing something with:
	Try rubbing the noun instead;

[ because they will check ]

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as xyzzying.

xyzzying is an action applying to nothing.

Instead of xyzzying for the first time:
	say "Your mother would never have approved, but you say that word out loud. Even with no one to listen, it feels a little wrong."

Carry out xyzzying:
	say "Once was enough."

[ for atmosphere ]

Understand "sing" as singing.
Understand "pray" as singing.

Singing is an action applying to nothing.

Check singing:
	if the actor is wearing the emergency mask:
		say "You can't sing with the mask on.";
		stop the action.

Carry out singing:
	say "You sing a hymn [one of]about hard work[or]about virtue[or]about penitence[or]praising the Founder[or]about Old Earth[at random].";

Chapter 14 - Testing - Not for release

Include Object Response Tests by Juhana Leinonen.

Understand "checkobj" as checking objects;

Checking objects is an action out of world;

Carry out checking objects:
	repeat with item running through things: 
		if description of the item is "": 
			say "[item] has no description."

Understand "listobj" as listing objects;

Listing objects is an action out of world;

Carry out listing objects:
	let L be the list of things;
	sort L in printed name order;
	repeat with item running through L:
		say "[item][if item is fixed in place] (F)[end if][if item is scenery] (S)[end if][if item is part of something] (P)[end if][line break]"

Understand "* [text]" as commenting on the transcript.

Commenting on the transcript is an action out of world applying to a topic.

Carry out commenting on the transcript: say "(Noted.)"

Book 2 - Scenes

To decide if all sectors are visited:
	Repeat with r running through rooms in Main Level:
		if r is not visited, decide no;
	decide yes.

Ready to Repair is a scene. "You have walked the entire ring. Everything is as expected, much is not working. Now, it's time to leave. The pods are below Sector 1." Ready to Repair begins when all sectors are visited for the first time and Anxious to Leave has not happened. Ready to Repair ends when Anxious to Leave begins.

Anxious to Leave is a scene. "It is time to say goodbye to the station. You are ready to leave in a pod." Anxious to Leave begins when the pod bay is ready and the player is in pod control for the first time.

Every turn during Anxious to Leave:
	let t be the minutes part of time since Anxious to Leave began;
	if t is greater than 0 and the remainder after dividing t by 10 is 0:	
		say "There is nothing left for you here. It's time to take a pod and leave."

Anxious to Leave ends when Pod Problems begins.

Pod Problems is a scene. "This is troubling. You counted. You were sure there would be one pod left for you, but there are none." Pod Problems begins when the player is in Pod Bay for the first time.

Every turn during Pod Problems:
	let t be the minutes part of time since Pod Problems began;
	if t is 3:
		say "So you can't leave in a pod, but maybe you can bring a pod here."

Book 3 - The Ring

Chapter 1 - Sector 1

Sector 1 is a room in Main Level. "You still maintain the crops here. There is a small graveyard and the barn remains from when this was the livestock sector. A pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 1: Crops". It has destination name "sector 1".

There is a pylon in Sector 1.

Some crops are scenery in Sector 1. They have description "You are proud of the grain and legumes." Understand "grain" and "legumes" as some crops.

The graveyard is scenery in Sector 1. It has description "Fenced off but unmarked graves. You buried your parents here." Understand "graves" and "grave" and "fence" as the graveyard.

Instead of eating some crops, say "You're not hungry."

Section 1 - Barn

S1B1 is a building. It is inside of Sector 1. Through it is the Barn. S1B1 is scenery. It has description "A single story barn." Understand "barn" as S1B1.

Barn is a room. "Not fancy: livestock on one side and feed on the other, but nothing remains of either."
Sector 1 is outside of barn.

Section 2 - Pod Control

There is a room called Pod Control. "This room serves as an airlock for the pod bay, and holds an old space suit and various machinery such as the atmosphere pump."

Pod Control is in Underneath.

S1H1 is a floor hatch. S1H1 is down from Sector 1 and up from Pod Control.

A space suit is scenery in Pod Control. It is machinelike. It has description "For EVA or extra protection in a pod. Unfortunately, it failed its last periodic inspection: the seals are leaking and there are no spares left." Understand "old" as the space suit.

Before doing anything other than examining or scanning to the space suit:
	say "All of the seals are shot, so the suit won't be useful.";
	stop the action.
	
Instead of scanning the space suit, computerize "Machine is failed."

A status display is a machine in Pod Control. It is scenery. It is not openable.
Understand "message" and "error" as the status display when the pod bay is not ready.

Instead of examining the status display:
	if the red circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: telemetry sensor array offline[line break]",
			"Remediation: reset breaker FM36-87/A @ hub platform[roman type][paragraph break]";
	else unless the atmosphere pump is functional:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: pod control atmosphere pump offline[line break]",
			"Remediation: scan and repair pump[roman type][paragraph break]";
	else if the atmosphere pump is open:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: pod control atmosphere pump offline[line break]",
			"Remediation: close pump[roman type][paragraph break]";
	else if the green circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: launch system cooling loop offline[line break]",
			"Remediation: reset circuit breaker FM29-63/A @ Sector 2[roman type][paragraph break]";
	else if S1H1 is not closed:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Secure ceiling hatch[roman type][paragraph break]";
	else:
		say "The status display glows green."

The atmosphere pump is a machine in the Pod Control. It is openable. It is quiet. It has carrying capacity 2. It has description "[If the atmosphere pump is functional and the atmosphere pump is not open]The featureless atmosphere pump is softly humming.[otherwise]The atmosphere pump is a smooth featureless machine." Understand "machine" and "machinery" as the atmosphere pump.

Instead of scanning the atmosphere pump when the atmosphere pump is functional and the atmosphere pump is closed:
	computerize "Machine is functional and operating."

There is a faulty power module in the atmosphere pump.
There is a faulty pressure regulator module in the atmosphere pump.

To decide if (m - the atmosphere pump) is functional:
	unless there is a functional power module in the atmosphere pump, decide no;
	unless there is a functional pressure regulator module in the atmosphere pump, decide no;
	decide yes.	

After closing the atmosphere pump when the atmosphere pump is functional:
	say "You close the atmosphere pump and it begins to hum.";
	if the atmosphere pump is not scored:
		increase the score by 5;
		now the atmosphere pump is scored.

To decide if the pod bay is ready:
	if every circuit breaker is switched on and the atmosphere pump is functional and the atmosphere pump is closed and S1H1 is closed, decide yes;
	decide no.
	
To decide if the pod bay is not ready:
	if the pod bay is ready, decide no;
	decide yes.

Every turn when the player is in Pod Control:
	if the pod bay is ready:
		now the wall hatch is unlocked;
	otherwise:
		now the wall hatch is locked.

After going through the wall hatch:
	say "You close the hatch behind yourself.";
	try silently closing the wall hatch;
	continue the action.

Section 3 - Pod Bay

There is a room called Pod Bay. "There are four berths for transit pods. [one of]Unexpectedly,[or]Disturbingly,[purely at random] all are empty." Pod Bay is in Underneath.

Some berths are scenery in Pod Bay. Understand "four berths" or "berth" and "door" and "doors" and "rail" and "rails" and "iris" and "closed" and "iris" and "pod bay" as some berths. Some berths have description "Each berth would hold a transit pod, but now there are only support rails and closed iris doors." They are machinelike.

Instead of the scanner opening some berths:
	computerize "Opening failed. Safety violation.";
	rule succeeds.

Instead of opening or closing the berths:
	say "The doors open and close automatically as pods come and go."

Instead of unlocking the berths with something, try opening the berths.
Instead of locking the berths with something, try closing the berths.
	
A door called the wall hatch is port from Pod Control and starboard from Pod Bay. It is closed and locked. "[if the player is in Pod Control][pod-bay-hatch-pc][otherwise][pod-bay-hatch-pb][end if]."

Understand "port" as the wall hatch when the player is in Pod Control.
Understand "starboard" as the wall hatch when the player is in Pod Bay.

To say pod-bay-hatch-pc:
	say "Beside the [if wall hatch is open]open[otherwise]secured[end if] port hatch, a status display [if pod bay is ready]glows green[otherwise]shows an error message[end if]"
	
To say pod-bay-hatch-pb:
	say "A [if wall hatch is open]open[otherwise]secured[end if] hatch leads starboard"

Every turn when the player is in Pod Bay for the first time:
	if the Pod Bay is not scored:
		increase the score by 10;
		now the Pod Bay is scored.
	
Chapter 2 - Sector 2

Sector 2 is spinward from Sector 1. It is in Main Level. "A deep pond is used as part of the water filtration system and for raising fish. You can walk spinward or antispinward." It has printed name "Sector 2: Aquaculture". It has destination name "sector 2".

The pond is scenery in sector 2. It has description "Something to do with water filtration, and there are still some fish." Understand "water" and "deep" as the pond.

Some fish are scenery in sector 2. They have description "There are still a few fish swimming in the pond, but they taste horrible."

Instead of doing anything other than examining or scanning to the fish:
	say "The fish aren't easy to catch."

Instead of drinking or tasting the pond, say "It's a bit fishy."

Instead of searching the pond, say "[The pond] is pretty murky, but you can see a few fish from here."

Before looking under the pond, try searching the pond instead.

Before swimming when the player is in Sector 2, try entering the pond instead.
Before swimming in the pond, try entering the pond instead.

Instead of entering the pond:
	if the player is wearing the mask:
		if the green circuit breaker is switched on:
			say "You have already turned the green breaker on.";
		otherwise:		
			say "WIth the air from the emergency mask, you breathe comfortably as you step into the pond. At the bottom, you find a green circuit breaker and flip it on.";
			now the green breaker is switched on;
			increase the score by 10;
	otherwise:
		say "You can't hold your breath long enough to make that worthwhile."

Chapter 3 - Sector 3

Sector 3 is spinward from Sector 2. It is in Main Level. "Trees, a house, and a church. A red pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 3: Forest". It has destination name "sector 3".

A pylon called S3P1 is here. It has description "Made of smooth metal, anodized red, it connects the ground to the hub of the station many meters above." Understand "red" as S3P1.

Before going up in Sector 3, try climbing S3P1 instead.

Instead of climbing S3P1:	
	 if the player is wearing the gravity boots:
		say "It isn't easy, but with the boots, you are able to climb towards the hub.";
		now the player is in center platform;
	otherwise:
		say "The red pylon is designated for climbing, but you can't get a grip.";
		stop the action.

Nothing is inside from Sector 3.

Instead of going nowhere from sector 3 when the noun is inside:
	say "You can enter the church or the house."

S3B1 is a building. It is scenery. It is port of Sector 3. It is privately-named. It has description "A small white building with a steeple." It has printed name "church". Understand "church" and "steeple" and "small" and "white" and "building" as S3B1. It is improper-named. Through it is Church.

S3B2 is a building. It is scenery. It is starboard of Sector 3. It is privately-named. It has description "What looks like whitewashed siding is really a lightweight plastic." It has printed name "the house". Understand "whitewashed" and "siding" and "lightweight" and "plastic" and "house" and "building" as S3B2. It is improper-named. Through it is House.

There is a forest in Sector 3.

Instead of looking under a forest in Sector 3, say "Only the house and church."
	
Section 1 - Church

Church is a room. "Before everyone left or died, you celebrated every sabbath here. The altar stands against the far wall."

An altar is a fixed in place scenery supporter in church. It has description "Really just a table."

The Founder's Testament is on the altar. It has description "The Founder's Testament tells how your people left Old Earth and first settled the station. You know the story by heart, and have already derived whatever comfort you can from this book." It has indefinite article "The". Understand "book" and "bible" as testament.

Sector 3 is outside of church.

Instead of going nowhere in church when the noun is starboard, try going outside.

Section 2 - House

House is a room. "Two families lived here, but not recently."

A doll is in house. "Someone has left a doll on the well swept floor." It has description "Wearing a brown jumpsuit and faceless, because we are all alike in the Founder's eyes." Understand "faceless" and "red jumpsuit" and "jumpsuit" as the doll.

Sector 3 is outside of house.

Instead of going nowhere in house when the noun is port, try going outside.

Section 3 - Center Platform

Sector 3 is down from Center Platform. Nothing is up from Sector 3. Center Platform has description "It's a mesh platform a little below the hub. You feel much lighter here, and you are very aware of how the station rotates, but everything is okay as long as you don't look down."

Instead of jumping in Center Platform:
	say "Yes, pseudogravity is definitely weaker up here."

Before going down from Center Platform:
	change the up exit of Sector 3 to Center Platform;
	if the player is wearing the gravity boots:
		say "You climb down the pylon.";
	otherwise:
		say "You slide down the pylon."

A red circuit breaker is a circuit breaker in center platform. "You can just reach a red circuit breaker on the hub." The red circuit breaker is machinelike.

Instead of scanning the red circuit breaker:
	computerize "Machine is functional. Breaker is [if the red circuit breaker is switched on]closed[otherwise]open[end if]."

After switching on the red circuit breaker:
	increase the score by 5;
	continue the action.

After dropping something (called s) in Center Platform:
	say "You drop [the s] and it spirals off the the ground below.";
	let r be a random room in the Main Level;
	now s is in r.

Chapter 4 - Sector 4

Sector 4 is spinward from Sector 3. It is in Main Level. "Your home is here among the crops. You can walk spinward or antispinward." It has printed name "Sector 4: Crops". It has destination name "sector 4".

S4B1 is a building. It is inside of Sector 4. It is scenery. It has description "You were told it was built to look like a log cabin on Old Earth." It has printed name "home". It has indefinite article "your". [* doesn't seem to work ] It is improper-named. Through it is Home. Understand "home" or "house" as S4B1.

Some vegetables are scenery in Sector 4. They have description "Greens, carrots, and potatoes." Understand "crops" and "greens" and "carrots" and "potatoes" as some vegetables.

Instead of eating some vegetables, say "You're not hungry."

Section 1 - Home

Home is a room. "The room where you've slept your entire life. You can go out towards the crops."

Sector 4 is outside of home.

The player is in Home. The player is carrying the scanner.

Section 2 - Cellar

S4H1 is a floor hatch. It is down from Home and up from Cellar.

Cellar is in Underneath. "A decompression shelter and space for storage."

An emergency mask is in cellar. "There is an emergency mask hanging on the wall." It has description "You wore this mask when there were decompression drills every ten days." It is wearable. It is machinelike.

Chapter 5 - Sector 5

Sector 5 is spinward from Sector 4. It is in Main Level. "The school house is nestled among the trees. A pylon stretches up from the same grove to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 5: Forest". It has destination name "sector 5".

S5B1 is a building. It is scenery. It is inside of sector 5. It has description "Little and red, the traditional markings of a school building." It has printed name "the school building". Through it is School. Understand "school" and "house" as S5B1.

There is a pylon in Sector 5.

There is a forest in Sector 5.

Instead of looking under a forest in Sector 5, say "Only the school house."

Section 1 - School

School is a room. "One broken learning machine remains in a corner, but mostly the older farmers took turns leading the class. There is a desk and a chalkboard hangs on one wall."

Sector 5 is outside of school.

The learning machine is an openable quiet machine in the the school. It has carrying capacity 2. It has description "This last learning machine broke when you were maybe three thousand days old."

Every turn:
	if the learning machine is open and the learning machine is not scored:
		now the learning machine is scored;
		increase the score by 5.

There is a functional power module in the learning machine.
There is a faulty instruction module in the learning machine.

To decide if (m - the learning machine) is functional:
	unless there is a functional power module in the learning machine, decide no;
	unless there is a functional instruction module in the learning machine, decide no;
	decide yes.

After choosing notable locale objects when the player is in the School: 
	set the locale priority of the learning machine to 2;
	continue the activity.

A desk is a fixed in place scenery supporter in the school. It has description "You wrote your lessons at this desk. Your people were practical, plain folk, so you learned practical things in school: reading, writing, arithmetic. More importantly, practical mechanics and farming."

A chalkboard is fixed in place scenery in the school. Understand "chalk board" and "blackboard" and "black board" and "board" as chalkboard. The chalkboard can be cleaned or smudged or written. It is written. It has description "[if the chalkboard is cleaned]The board is perfectly blank.[else if the chalkboard is written]The board is covered in your old arithmetic work.[else]The board is covered in smudges.[end if]". Understand "smudges" as chalkboard when the chalkboard is smudged. Understand "arithmetic" and "work" as the chalkboard when the chalkboard is written. Understand "wall" as the chalkboard.

An eraser is on the desk. The eraser can be clean or dusty. It is clean. Understand the clean property as describing the eraser. It has description "A [if the eraser is dusty]dusty[otherwise]clean[end if] eraser." It has printed name "[if the eraser is dusty]dusty[otherwise]clean[end if] eraser"

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
	otherwise if the location is the supply vault:
		say "You fill the vault with a cloud of dust and you can now see a laser beam scanning across the hatch.";
		now the laser visibility counter is 4;
	otherwise:
		say "You fill the area with a cloud of dust, which quickly clears."

Chapter 6 - Sector 6

Sector 6 is spinward from Sector 5 and antispinward from Sector 1. It is in Main Level. "Your people preferred to grow things the old fashioned way, but in truth the majority of your fruit and vegetables came from this sector when the machines still worked. You can walk spinward or antispinward." It has printed name "Sector 6: Hydroponics". It has destination name "sector 6".

Hydroponics machines are scenery in Sector 6. It is machinelike. It has description "You were thoroughly trained in hydroponics maintenance, but fixing these machines is beyond you." Understand "machine" and "machinery" as hydroponics machines.

Instead of doing anything other than examining or scanning to the hydroponics machines:
	say "The hydroponics machines are just so much junk."

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

The Supply Vault is a room. "This room is dim, quiet, and stuffy. There is still a crate of machine parts left.[if laser is visible][paragraph break]You see a laser beam scan across the exit.[end if]". Supply Vault is in underneath.

[ crate ]

A crate of machine parts is scenery in the supply vault. It has description "These remaining parts never seem to fit where they might be useful."

One faulty instruction module is in the junk repository.
One functional pressure regulator module is in the junk repository.

To grab some junk:
	let q be a random thing in the junk repository;
	say "You find [a q].";
	find and take q.

Instead of searching the crate of machine parts for the first time, grab some junk.
Instead of searching the crate of machine parts for the second time, grab some junk.
Instead of searching the crate of machine parts, say "Many miscellaneous parts, none useful."

Before doing something other than searching or examining or scanning to the crate of machine parts:
	say "That's just junk." instead.

[ boots ]

A pair of gravity boots is in the supply vault. The gravity boots are wearable. They are plural-named. They have description "Black work boots with red stripes. They don't really make gravity, but they do stick to some maintenance walkways to help workers get around in low gravity or on the outside of a rotating station."

[ laser ]

The laser visibility counter is a number that varies. Laser visibility counter is 0.

Every turn when the laser visibility counter is greater than zero:
	decrease the laser visibility counter by one.

To decide if the laser is visible:
	if the laser visibility counter is greater than zero, decide yes.

Before going up from the supply vault when the laser is visible:
	say "You maneuver around the laser beam.";

Before going up from the supply vault when the player encloses the gravity boots and the laser is not visible:
	say "An alarm sounds, [if the vault hatch is open]hatch slams shut, [end if]and a synthesized voice says 'Laser scan detects unauthorized materiel removal.' The hatch seems to be locked.";
	now the vault hatch is closed;
	stop the action.

Laser beam is scenery. It has description "The cloud of dust scatters the laser beam just enough that you can see it scan across the north passageway at seemingly random angles." Understand "dust" and "cloud" and "cloud of dust" as the laser beam.

After deciding the scope of the player when the location is the supply vault:
	if the laser is visible, place the laser beam in scope.

Before doing something other than examining or touching when the current action involves the laser beam, say "The laser beam is intangible." instead.

Before touching the laser beam:
	if the player encloses the gravity boots:
		say "An alarm sounds, [if the vault hatch is open]hatch slams shut, [end if]and a synthesized voice says 'Laser scan detects unauthorized materiel removal.'";
		now the vault hatch is closed;
	otherwise:
		say "The laser beam is intangible.";
	stop the action.

[ --- ]