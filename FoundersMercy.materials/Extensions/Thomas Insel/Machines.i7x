Version 1 of Machines by Thomas Insel begins here.

"Implement the components & machine model that I use in Founder's Mercy, along with related verbs."

Use authorial modesty.

Chapter 0 - Saying

To scanner-note (x - some text): say "[italic type][x][roman type][line break]";
To scanner-say (x - some text): say "[fixed letter spacing][x][stop computer][roman type]";

Chapter 1 - New Grammar

Scanning is an action applying to one thing.
Scanning it with is an action applying to two things.
Barescanning is an action applying to nothing.

Understand "scan [something]" as scanning.
Understand "scan [something] with [something preferably held]" as scanning it with.
Understand "scan" as barescanning.

Check scanning something with:
	say "[regarding the second noun][Those] [aren't] a scanner.";
	stop the action.

Before unlocking something (called m) with the scanner, try the scanner opening m instead.
Before scanning something (called m) with the scanner, try the scanner scanning m instead.

Carry out scanning: try the scanner scanning the noun instead.
Carry out scanning it with: try the scanner scanning the noun instead.
Carry out barescanning: try the scanner barescanning instead.

Chapter 2 - Modules

[ modules go in some machines to provide functionality ]

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

Instead of the scanner scanning a module (called c):
	scanner-say "Module is [status of c].";
	now c is scanned;
	rule succeeds.

Instead of the scanner opening a module:
	scanner-say "Module is unitary.";
	rule succeeds.

Chapter 3 - Machines

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
				say " and space for [open space in words] more module[s].";
			otherwise:
				say ".";
		otherwise if the carrying capacity of m is zero:
			say "[regarding the m][They] [are] open.";
		otherwise:
			say "[regarding the m][They] [are] open, revealing space for [open space in words] module[s].";
	otherwise:
		say "[line break]";
	;
	follow the list attached things when examining receiver or inserter rule. [* from Plugs and Sockets ]

Instead of the scanner scanning a machine (called m):
	now m is scanned;
	scanner-say "Machine is [if m is functional]functional[else]failed[end if].";
	rule succeeds.

Instead of the scanner opening a machine (called m):
	if m is not openable:
		scanner-say "Machine is unitary.";
	otherwise if m is open:
		scanner-say "Machine is already open.";
	otherwise:
		scanner-say "Opening.[line break]";
		;
		if a thing is in m:
			say "[The m] swing[s] open, revealing [a list of things which are in m]";
			let open space be the carrying capacity of m minus the number of things contained in m;
			if open space is positive:
				say " and space for [open space in words] more module[s].";
			otherwise:
				say ".";
		otherwise if the carrying capacity of m is zero:
			say "[The m] swing[s] open.";
		otherwise:
			say "[The m] swing[s] open, revealing space for [the carrying capacity of m in words] module[s].";
		;
		now the m is open;
	rule succeeds.

Instead of opening a machine, say "You will need to use the scanner to do that.";

After closing a machine (called m), say "You close [the m] and it seals without any trace of a seam.";

After printing the name of a machine (called m), if m is closed, omit contents in listing.

Chapter 4 - Machinelike

[ An adjective to apply to other things so that they get a default response from the scanner. ]

A thing can be machinelike. Things are usually not machinelike. Things can be scanned.

Instead of the scanner scanning something that is machinelike:
	scanner-say "Machine is functional.";
	rule succeeds.

Instead of the scanner opening something that is machinelike:
	scanner-say "Machine is unitary.";
	rule succeeds.

Chapter 5 - The Scanner and Scanning

Include Inanimate Listeners by Emily Short.

The scanner is a machinelike addressable thing. It has description "The handheld voice-activated scanner you use when working on the station's machines."

[ normal actions ]

Instead of switching on or switching off the scanner:
	say "The scanner is automatically on and listening whenever you are carrying it.";
	explain the scanner.

Instead of answering the scanner that something:
	unless the scanner is at hand, stop the action;
	if the topic understood matches the regular expression "^help\s":
		try the scanner getting help instead;
	else if the topic understood matches the regular expression "^(scan|open|close)\s+(.*)":
		scanner-say "Search error: cannot find [text matching subexpression 2].";
		explain the scanner;
	otherwise:
		scanner syntax error;
		explain the scanner;

Instead of asking or telling the scanner about something:
	if the scanner is at hand, scanner syntax error.

After examining the scanner, explain the scanner.

[ actions the scanner does ]

The scanner fail count is a number that varies. Scanner fail count is 0. The scanner can be explained.

To explain the scanner:
	if the scanner is not explained:
		now the scanner fail count is 0;
		now the scanner is explained;
		unless examining, say "[line break]";
		scanner-note "You can ask the scanner for a list of commands by typing 'scanner, help' and give it voice commands by typing phrases such as 'scanner, scan SOMETHING' or 'scanner, open SOMETHING' where SOMETHING is a visible object.";
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
	scanner-say "Syntax error: command not in vocabulary.";
	explain the scanner;

Before the scanner doing something: [* catch the try the scanner... bits ]
	unless the scanner is at hand, stop the action.

Persuasion rule for asking the scanner to try scanning or opening or closing something:
	unless the scanner is at hand, stop the action;
	persuasion succeeds.

Persuasion rule for asking the scanner to try getting help or barescanning:
	unless the scanner is at hand, stop the action;
	persuasion succeeds.

Persuasion rule for asking the scanner to try doing something: [ any other interaction fails ]
	if the scanner is at hand:
		scanner-say "Syntax error: command not in vocabulary.";
		explain the scanner;
	persuasion fails.

Instead of the scanner closing something:
	scanner-say "Command error: closing is a manual process.";
	rule succeeds.

Carry out the scanner scanning something:
	scanner-say "No modular technology detected.";
	rule succeeds.

Carry out the scanner scanning the scanner:
	scanner-say "Self test completed. Scanner is functional.";
	rule succeeds.

Carry out the scanner getting help:
	scanner-say "Recognized commands are 'help', 'open', and 'scan'.";
	now the scanner is not explained;
	explain the scanner;
	rule succeeds.

Instead of the scanner opening something (called m):
	scanner-say "No electronic technology detected.";
	rule succeeds.

Carry out the scanner barescanning:
	scanner-say "Syntax error: no target.";
	explain the scanner;
	rule succeeds.

Chapter 6 - Tweaks for Standard Rules

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

Machines ends here.

---- Documentation ----

        Example: * Machine

        Include Machines by Thomas Insel.

        A lithium battery is a kind of module.

        A futuristic radio is here. It is an openable machine. It has carrying capacity 1. It contains a failed lithium battery. It has description "[if the futuristic radio is functional]The radio is playing music like you've never heard before.[else]It's a radio.[end if]"

        To decide if (m - the futuristic radio) is functional:
          unless there is a functional lithium battery in the futuristic radio, decide no;
          decide yes.  

        One functional lithium battery is here.

        Test radio with "x radio / get battery / scanner, open radio / get battery from radio / scan battery / scan unscanned battery / put functional battery in radio / close radio / x radio"



Consider a generalized version of this if necessary:

        After choosing notable locale objects when the player is in the School: 
          set the locale priority of the learning machine to 2;
          continue the activity.

