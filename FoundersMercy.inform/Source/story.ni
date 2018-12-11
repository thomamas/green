 "Founder's Mercy" by Thomas Insel

[
	Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
	http://tinsel.org/IF/
	
	This work is licensed under a Creative Commons Attribution 4.0 International License.
	https://creativecommons.org/licenses/by/4.0/	
]

Book 1 - Setup

Chapter 1 - About the Story

[ This story was written for use with Inform 7 build 6M62. ]

Use American dialect and the serial comma.

The story headline is "A Space Story". The story genre is "Science Fiction". The release number is 1. The story creation year is 2018.

The story description is "You awake. You are lonely, so lonely. It was a thousand days ago today. All alone these thousand days. Your parents were the last. No, your father was the last. He held on for nearly a hundred days longer. Now you are the last. Alone. Adrift.

But maybe it isn’t hopeless. There must still be other people in other worlds, and you think you know how to get there.

Today is the day."

When play begins:
	say "[the story description][paragraph break]"

Release along with cover art ("A space station."),
	an interpreter,
	the introductory booklet,
	the library card,
	a file of "Map & Feelies" called "Map.pdf",
	and a "Local" website.
	
Requesting the credits is an action out of world and applying to nothing.

Understand "about" or "credits" as requesting the credits.
	
After printing the banner text rule:
	say "Type 'about' for credits or 'hint' for assistance.";
	
Carry out requesting the credits:
	say	"[bold type]About Founder's Mercy[roman type][line break]"
		,
		"[italic type]Founder's Mercy[roman type] is my second released Inform project, conceived and implemented in November of 2018.[paragraph break]" [todo]
		,
		"Thanks to Graham Nelson, Andrew Plotkin, Emily Short, and everyone else who contributed to the Inform and Glulx ecosystem. Thanks also Juhana Leinonen for the Object Response Tests extension, and Sean Turner for the Plugs and Sockets extension. Exit listing code is inspired by Eric Eve's Exit Lister. The cover art is adapted from Figure 1.1 from NASA SP-413, [italic type]Space Settlements: A Design Study[roman type], edited by Richard D. Johnson and Charles Holbrow, and available from The Internet Archive at [fixed letter spacing]https://archive.org/details/SpaceSettlementsADesignStudy1977[roman type] .[paragraph break]"
		,
		"Please send your feedback, bug reports, and requests for help to [fixed letter spacing]tinsel@tinsel.org[roman type]. You can always find the current version of this story at [fixed letter spacing]http://tinsel.org/IF/[roman type] .[paragraph break]"
		,
		"This work is Copyright © [the story creation year] Thomas Insel but may be freely shared according to the terms of the Creative Commons Attribution 4.0 International license ([fixed letter spacing]https://creativecommons.org/licenses/by/4.0/[roman type])."

Chapter 2 - Scoring

Use scoring. The maximum score is 8. An object can be scored. An object is usually not scored.

[
	1 - getting the boots out of the vault
	1 - red breaker

	1 - green valve in the pond

	1 - fixing and closing the atmosphere pump

	2 - visiting pod bay for the first time

	2 - getting the communications unit working (and calling for help)
]

Chapter 3 - Notes

To say start note: say "[note style][bracket]".
To say stop note: say "[close bracket][roman type]".

To say start computer: say "[fixed letter spacing]".
To say stop computer: say "[roman type]".

To computerize (x - some text): say "[start computer][x][stop computer][line break]".
To note (x - some text): say "[start note][x][stop note][line break]".

Chapter 4 - Misc Phrases

To find and take (s - an object):
	now s is in the holder of the player;
	try silently taking s;
	set pronouns from s.

To decide what number is the total minutes of (t - a time): decide on the minutes part of t plus 60 times the hours part of t.

To decide what object is a random object in (L - a list of objects):
	let r be a random number between 1 and the number of entries in L;
	decide on entry r of L.

Chapter 5 - Extensions

Section 1 - Text

Include Unicode Character Names by Graham Nelson.

Include Glulx Text Effects by Emily Short. [ for the note style ]

Section 2 - Exit Lister

Include version 1 of Simple Exit Lister by Thomas Insel.
A room is usually familiar. [* since the player has already visited most of the station ]

Section 3 - Plugs and Sockets

[
	Fix or adapt a few things about Plugs and Sockets, but it is still a bit complicated and has some issues. Also consider:

	Special language for picking up a cable that is connected to something not carried.
	Blocking putting the cable in the pocket if it is connected to something not carried.
	What to do if there were a portable closable container which could hold a cable.
	Can we support unplug cable from all or unplug cable from socket?
]

Include version 4/170924 of Plugs and Sockets by Sean Turner

[
	B. Suppress the list of attachments for sockets because this is too ugly:
		
		You can see an organ (into which is plugged an USB cable), an audio unit (into which is plugged an USB cable), and an USB cable (plugged into an organ and an audio unit) here.

	but this is better:

		You can see an organ, an audio unit, and an USB cable (plugged into an organ and an audio unit) here.

	Still not without issues: if you are holding the cable then it doesn't show up in the room at all, complicated connections wouldn't be clear, etc.
]

The list attached things when listing receiver or inserter rule response (A) is "".

[ C. Make style fit for command explanation ]

The ensure-item-only-plugged-into-1-thing rule response (B) is "[The noun] [are] plugged into more than one thing.[paragraph break][start note]Try 'unplug [noun] from SOMETHING'.[stop note][line break]";

[
	D. There is a bug in the existing leavings whilst attached to fixed things rule: it doesn't apply if thing is in a container. We fix this by changing "if the holder of the connectee is not carried by the player" to "if the holder of the connectee is not carried by the player".

	Another bug: the rule applies even if the travel is stopped, for example if the player goes in an invalid direction. We try to fix this by moving to an Instead rule instead of a Before rule. Note this is mostly only tested for the case where PS-leaving is PS-allowed.

	Additionally, we substitute our preferred language, and adjust so that we don't end up with "The organ pulls out from the cable." instead of "The cable pulls out from the organ."

	Finally, there is an outstanding issue with the world modeling here. If the player takes two heavy things connected by a cable, but not the cable, they will still pull out and leave the cable behind. Maybe we could fix this by forcing the player to take the cable when they take the other items?
]
	
When play begins, now PS-leaving is PS-allowed.

The leaving room whilst attached to fixed things rule is not listed in the Before rulebook.

Instead of an actor going to somewhere (this is the new leaving room whilst attached to fixed things rule):
	repeat with item running through the attached things enclosed by the player:
		repeat with loop-item running through the PS-connectors which are part of the item:
			let the connectee be the attachment of the loop-item;
			if the connectee is not nothing:				
				if the holder of the connectee is not enclosed by the player:
					if PS-leaving is PS-denied:
						say "It is impractical to leave with [the item] attached to [the holder of the connectee].";
						stop the action;
					now the attachment of the loop-item is nothing;
					now the attachment of the connectee is nothing;
					if the loop-item is a PS-socket:
						say "[The holder of the connectee] [pull] out of [the item].";
					otherwise:
						say "[The item] [pull] out of [the holder of connectee].";
	continue the action.

[todo -- when taking a an item with a socket, if you already have another item with a socket, and the two are attached, take the cable[s] between them -- that is the holder of the connectees connecting them. ]

[ E. Some action synonyms ]

Understand the command "disconnect" as "unplug".
Understand "connect [something] to [something]" as plugging it into.

[ F. Establish a few kinds for future use ]

A USB plug is a kind of PS-plug. It has PS-type "USB".
A USB socket is a kind of PS-socket. It has PS-type "USB".

An RF plug is a kind of PS-plug. It has PS-type "RF".
An RF socket is a kind of PS-socket. It has PS-type "RF".

[ G. Cables ]

A cable is a kind of thing.

Instead of examining a cable, say "[the description of the noun] [exam inserter status of the noun]."  [* assume cables have only plugs, no sockets ]

Instead of the scanner scanning a cable:
	computerize "Cable is functional.";
	rule succeeds;

Understand "pull [a cable]" as unplugging.
[ Instead of tying a cable to something, say "Tying the cable would damage it." ]

To decide if (s - a machine) and (t - a machine) are connected:
	repeat with c running through cables:
		if c is inserted into the s and c is inserted into the t, decide yes;
	decide no.

Section 4 - Machines

Include Machines by Thomas Insel.

To scanner-note (x - some text): note x.
To scanner-say (x - some text): computerize x.

A power module is a kind of module.
An instruction module is a kind of module.
A pressure regulation module is a kind of module. Understand "regulator" as a pressure regulation module.

Section 5 - Testing - Not for Release

Include Object Response Tests by Juhana Leinonen.
Include Testing Commands by Thomas Insel.

Chapter 6 - Directions

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

Before climbing up, try going up instead.
Before climbing down, try going down instead.

Chapter 7 - The Player

The player is female. The carrying capacity of the player is 3.

Instead of examining the player, say "As virtuous as ever."

	The player is carrying the scanner. Understand "hey scanner" and "ok scanner" as the scanner.

The player is wearing a green jumpsuit. The jumpsuit has description "You have worn modest jumpsuits like this since you were small. Originally, the colors had meanings: forest green for farmers, navy blue for technicians, and so on, but that distinction died even before the population." Understand "suit" and "jump suit" and "forest green" and "forest jumpsuit" and "forest suit" and "forest jump" as jumpsuit. Understand "forest" as the green jumpsuit when the location is not Sector 5 and the location is not Sector 3. [* otherwise "forest" alone will have priority over the scenery trees, which is unlikely to be what the player intends ]

The pocket is part of the jumpsuit. It is a container.

A thing can be bulky. A thing is usually not bulky.

Before an actor taking: [* the pocket can't work as a player's holdall, which be directly carried, so let's try this instead ]
	if the number of things carried by the actor is at least the carrying capacity of the actor:
		if the actor is wearing the green jumpsuit or the actor is holding the green jumpsuit:
			let the transferred item be nothing;
			repeat with the possible item running through things carried by the actor:
				if the possible item is not lit and the possible item is not the jumpsuit and the possible item is not bulky, let the transferred item be the possible item;
			if the transferred item is not nothing:
				if the actor is the player:
					say "(putting [the transferred item] into your pocket to make room)[command clarification break]";
				silently try the actor trying inserting the transferred item into the pocket;
				if the transferred item is not in the pocket:
					stop the action.

After examining the jumpsuit:
	if the pocket contains something:
		say "The pocket contains [a list of things in the pocket including contents].";
	otherwise:
		say "It features a single large pocket, currently empty.";

Before inserting something into the jumpsuit, try inserting the noun into the pocket instead.

Before inserting something into the pocket:
	if the noun is bulky, say "It's a large pocket, but not large enough to hold [a noun]." instead.

After taking off the jumpsuit, say "Your nudity is pure and innocent, but still a little cold and uncomfortable."

Instead of taking inventory:
	if the first thing held by the player is nothing, say "[We] [are] carrying nothing." instead;
	say "[We] [are] carrying:[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation;
	if the pocket contains something and the player is wearing the jumpsuit:
		say "[line break][Our] jumpsuit pocket contains:[line break]";
		list the contents of the pocket, with newlines, indented, including contents, giving inventory information, with extra indentation.

Chapter 8 - Actions

Section 1 - Remove Some Actions

Understand the command "wake" as something new. [ too self-referential ]
Understand the command "buy" as something new. [ no money in this story ]
Understand the command "lock" as something new.
Understand the command "unlock" as something new.
Understand the command "sorry" as something new.

[ the following is a lot of trouble just to get rid of consulting it about ]

Understand the command "look" as something new.
Understand "look" as looking.
Understand "look at [something]" as examining.
Understand "look [something]" as examining.
Understand "look inside/in/into/through [something]" as searching.
Understand "look under [something]" as looking under.

Understand the command "read" as something new.
Understand "read [something]" as examining.

Understand the command "consult" as something new.

[ Simplify communication -- note this means some bits of Machines.i7x will never be used ]

Understand the commands "ask" and "tell" and "answer" and "say" as something new.

Understand "ask [text]" or "tell [text]" or "answer [text]" or "say [text]" or "talk" or "talk [text]" as a mistake ("[start note]To communicate in this story, type 'CHARACTER, MESSAGE' where CHARACTER is someone or something and MESSAGE is what you want to say.[no line break][stop note]").

[ To be nice ]

Understand "use [text]" as a mistake ("Please try specific a more specific verb.").

Section 2 - Modify Some Default Responses

Instead of attacking or cutting something, say "The Founder said that violence is never the answer.";

Instead of cutting or attacking yourself, say "Imperfect vessel that you are, that is not the answer."

Instead of burning something, say "There is no open flame on the station."
	
Instead of listening to a room, say "You hear only the familiar hum of the station."

Instead of smelling a room, say "Only familiar odors."

Section 3 - And Add Some Miscellaneous Actions

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

Understand "xyzzy" as xyzzying.

xyzzying is an action applying to nothing.

Instead of xyzzying for the first time, say "You say that word out loud. Your mother would never have approved. Even with no one to listen, it feels a little wrong."

Carry out xyzzying: say "Once was enough."

[ for atmosphere ]

Understand "sing" as singing.
Understand "pray" as singing.

Singing is an action applying to nothing.

Carry out singing: say "You sing a hymn [one of]about hard work[or]about virtue[or]about penitence[or]praising the Founder[or]about your exile from Old Earth[at random].";
	
[ for the organ ]
	
Understand "play [something]" as Playing.

Playing is an action applying to one thing.

Carry out playing: say "[regarding the noun][Those] [aren't] something you can play."

Instead of playing the player: say "I don't even know what that means."

Book 2 - Scenes

Section 1 - Beginning

Beginning is a scene.
Beginning begins when play begins.
Beginning ends when Ready to Repair begins.
Beginning ends when Repairing Pod Bay begins.

Section 2 - Ready to Repair

[ this scene will be skipped if the player visits Pod Control before all sectors, so it is more of a motivator rather than core to the story play. ]

Ready to Repair is a scene. "You have walked the entire ring. Everything is as expected, much is not working. Now, it's time to leave: the pods are below Sector 1."
Ready to Repair begins when every room in The Sectors is visited for the first time and Beginning has not ended.
Ready to Repair ends when Repairing Pod Bay begins.

Section 3 - Repairing Pod Bay

Repairing Pod Bay is a scene.
Repairing Pod Bay begins when Pod Control is visited.
Repairing Pod Bay ends when Repairing Red Breaker has ended and Repairing Green Valve has ended and Repairing Atmosphere Pump has ended.

[ these subscenes could begin/end at the same time if repairs have already happened, so shouldn't print anything ]

Repairing Red Breaker is a scene.
Repairing Red Breaker begins when Repairing Pod Bay begins.
Repairing Red Breaker ends when the red circuit breaker is switched on.

Repairing Green Valve is a scene.
Repairing Green Valve begins when Repairing Pod Bay begins.
Repairing Green Valve ends when the green valve is switched on.

Repairing Atmosphere Pump is a scene.
Repairing Atmosphere Pump begins when Repairing Pod Bay begins.
Repairing Atmosphere Pump ends when the atmosphere pump is scored. [* because "atmosphere pump is functional" here seems to check the (non-applicable) status adjective instead of the phrase ]

Section 4 - Between Repairs

Between Repairs is a scene. "It is time to say goodbye to the station. You are ready to leave in a pod."
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

When Repairing Comms begins: increase the score by 2. [* for entering the pod bay ]

Every turn during Repairing Comms:
	let t be the total minutes of time since Repairing Comms began;
	if t is 3:
		say "No pods left ... you consider despair.";
	if t is 5:
		say "So what if you can't escape in a pod. You will just need to bring a pod here. Time to get the communications module working."

Section 6 - The End

The End is a scene. "The audio unit beeps and a synthesized voice says 'Comms ready.'[paragraph break]After a moment, it says 'Launching automatic routines.'"
The End begins when the communications unit is usable for the first time.

When The End begins: increase the score by 2. [* for calling for help ]

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

Book 3 - Hints

Section 0 - Setup

Help disabled is a truth state that varies. Help disabled is false.

Understand "help" or "hint" or "hints" as getting help.
Getting help is an action applying to nothing.

[ Stolen from Damnatio Memoriae's instant actions so that help can take no time even though it can't be an action out of world lest "scanner, help" fail. ]

The help takes no time rule is listed before the every turn stage rule in the turn sequence rules.
This is the help takes no time rule: if getting help, rule succeeds.

Understand "help off" or "hint off" or "hints off" or "disable help/hint/hints" as disabling help.
Disabling help is an action out of world applying to nothing.

Instead of getting help when help disabled is true:
	say "You have disabled hints, but don't despair. It is still impossible to put this story into an unwinnable state, so feel free to explore and experiment."

Before the player getting help for the first time:
	if help disabled is false:
		say "Your objective is simply to leave the station and find other people."

After the player getting help for the first time:
	say
		"By the way, it should be impossible to put this story into an unwinnable state, so feel free to explore and experiment.[paragraph break]"
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
	if Repairing Green Valve is happening, increment n;
	if Repairing Atmosphere pump is happening, increment n;
	decide on n.

Carry out getting help when Repairing Pod Bay is happening:
	if the status display is not examined:
		say "You need to repair some things. Check out the status display in Pod Control.";
	otherwise:
		let c be the open pod repair count;
		if c is greater than one, say "You need to make [c in words] repairs, so you get [c in words] hints:[paragraph break]";
		if Repairing Red Breaker is happening, say "[if c > 1]  • [end if][red breaker help]";
		if Repairing Green Valve is happening, say "[if c > 1]  • [end if][green valve help]";
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
		else unless any module has been scanned:
			say "You can also scan modules.";
		else unless there is a functional handled power module and there is a functional handled pressure regulation module:
			say "You need to find some more modules.";
		else unless the player encloses a functional scanned power module and the player encloses a functional scanned pressure regulation module:
			say "You still need to scan some modules.";
		else:
			say "Put the right functional modules into the pump."

To say green valve help:
	say "The valve is in an awkward spot.";

To say red breaker help:
	if Platform 3 is visited:
		say "Just turn the red breaker on.";
	else if the gravity boots are scored:
		say "Figure out where to go to the hub.";
	else if the laser is alarmed: [ i.e., you have tried but not yet succeeded to remove to boots ]
		say eraser help;
	else if the supply vault is visited:
		say "You have seen what you need to reach the hub circuit breaker.";
	else:
		say "Explore a bit more.";

To say eraser help:
	if the eraser is attacked:
		say "You seem to have figured out the trick to avoiding the alarm.";
	else if the eraser is dusty:
		say "You have completed the necessary preparation to avoid the alarm.";
	else if School is visited:
		say "You have found what you need to evade the alarm, but it still needs some preparation.";
	else:
		say "You need to evade the alarm, but first explore a bit more.";

Section 3 - Between Repairs

Carry out getting help when Between Repairs is happening:
	if S1H1 is open: [ todo - check if door has been tried since this scene began? ]
		say "Pod Control acts as an airlock.";
	otherwise:
		say "There's no point in waiting. You just need to enter the pod bay."

Section 4 - Repairing Comms

Carry out getting help when Repairing Comms is happening:
	unless communications unit is handled:
		say "Find the emergency communications unit.";
	else unless audio and communications are connected:
		say "Connect the communications unit to an audio source.";
	else unless audio unit is functional:
		say "Repair the audio unit.";
	else:
		say "Just wait." [* this shouldn't happen either ]

[
	TODO:
		find comms & use it
		connect to audio
		audio needs to be functional
		connect to antenna
		antenna puzzle (tbd)
		& work in air puzzle (tbd)
]


Section 5 - The End

Carry out getting help when The End is happening:
	say "Just wait."

Book 4 - The Ring

Chapter 0 - Regions and Backdrops

Section 1 - Regions

Underneath is a region.

The Sectors is a region.
The Even Sectors is a region in The Sectors.

Before going spinward in the The Sectors, say "You walk a little ways to the next sector."

Before going antispinward in the The Sectors, say "You walk a little ways to the next sector."

The Platforms is a region.
Zero-G is a region.

Section 2 - Backdrops

[ todo -- add antenna here with solar ]

The hub is a backdrop in The Sectors and in The Platforms. It has description "[if the player is in The Platforms]The station rotates around the hub, still a good way above you, which extends out to hold solar panels to the port and mirrors on the starboard side.[otherwise]The station rotates around the hub, which extends out to hold solar panels to the port and mirrors on the starboard side. On the inside, there is a maintenance platform about two thirds of the way up the pylons."

Instead of doing anything other than examining or scanning to the hub, say "You are too far away to do that." [todo]

The solar panels are a backdrop in The Sectors and in The Platforms. They have description "The primary source of station power." Understand "panel" as solar panels.

Instead of doing anything other than examining or scanning to the solar panels, say "You are too far away to do that."

Instead of the scanner scanning the solar panels:
	computerize "Machine is functional. Operating at [one of]73[or]72[or]71[then purely at random]% efficiency.";
	rule succeeds.

The mirrors are a backdrop in The Sectors and in The Platforms. They have description "The mirrors reflect sunlight into the station." Understand "mirror" and "sun" and "light" and "sunlight" as mirrors.

Instead of doing anything other than examining or scanning to the mirrors, say "You are too far away to do that."

The maintenance platform is a backdrop in The Sectors. It has description "A circular platform connects the pylons about two thirds of the way up."

Instead of doing anything other than examining or entering or scanning to the maintenance platform, say "You are too far away to do that."

Instead of entering the maintenance platform, say "You will need to climb a pylon to get there."

The BDP are a backdrop in The Even Sectors. They are privately-named and plural-named. They have description "Spinward and antispinward from here, you can see pylons connecting the ground to the hub." They have printed name "pylons". Understand "pylons" as BDP.

Instead of doing anything other than examining to BDP, say "You will need to go to the next sector to do that."

Section 4 - Pylons

A pylon is a kind of thing. It is usually scenery. It is usually privately-named. It usually has printed name "pylon". Understand "pylon" and "pylons" as pylon. A pylon usually has indefinite article "the". A pylon usually has description "Made of smooth metal, it connects the ground to the hub of the station many meters above. You can see similar pylons spinward and antispinward."

Instead of climbing a pylon (called p), say "The pylon is slick metal with no obvious handholds."

Before going nowhere when a pylon (called p) is visible, if the noun is up, try climbing p instead.

Section 5 - Circuit Breakers

A circuit breaker is a kind of device. Circuit breakers are usually fixed in place.

Instead of switching off a circuit breaker (called b) when b is switched on, say "[The b] seems to be locked on."

Section 6 - Forests

A forest is a kind of thing. It is usually scenery and privately-named and plural-named. It usually has printed name "trees". Understand "tree" and "trees" and "forest" and "grove" as a forest. A forest usually has description "The community grew trees for tradition, and they help with air processing."

Instead of climbing a forest:
	if the player is wearing the gravity boots:
		say "You can't get a good grip, and because trees aren't magnetized, the boots don't help.";
	otherwise:
		say "You can't get a good grip."

Section 7 - Hatches

[
	There are some serious issues with this implementation, including:

	1. that it's not possible to have a hatch up and down from the same location and expect "ceiling" and "floor" to refer to the different things.

	2. if there are more than one floor hatch, the "let d be a random..." behavior means the description can be wrong.

	Since we never have more than one of these in any location, these aren't a problem for this story.
]

A floor hatch is a kind of door. "[floor-hatch-short]". It is usually privately-named. It usually has description "[The noun] [are] [if noun is open]open[else]closed[end if]." It usually has printed name "[if the player is in Underneath]ceiling hatch[otherwise]floor hatch[end if]". It usually has printed plural name "[if the player is in Underneath]ceiling hatches[otherwise]floor hatches[end if]"

To say floor-hatch-short:
	let d be a random floor hatch in the location;
	say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if].[no line break]";

Understand "hatch" as a floor hatch.
Understand "ceiling" as floor hatch when the location is in Underneath.
Understand "floor" as floor hatch when the location is not in Underneath.

Understand "secure [a door]" as closing.

Instead of searching a door:
	if the noun is closed:
		say "[The noun] is secured.";
	otherwise:
		let oside be "[destname the other side of the noun]" in sentence case;
		say "[oside] [regarding the other side of the noun][are] [direction of noun from location] through [the noun].";

Section 8 - Buildings

[ To represent the outside of buildings you go out/in from in the ring. ]

A building is a kind of door. It is usually open. It is usually not openable. It is usually privately-named.

Instead of searching a building, say "You would need to enter [the noun] to do that."

[
	I wanted to use

		Understand "[building]" as entering.

	Although it is documented in §17.10. Commands consisting only of nouns, if there is any use of this form, if causes Asking something about to throw an error (but only in the form "person, topic" not in the form "ask person about topic":

		*** Run-time problem P39: Attempt to say a snippet value which is currently invalid: words 0 to 3.

	This is documented in:

		http://inform7.com/mantis/view.php?id=2028
		http://inform7.com/mantis/view.php?id=1828
		http://inform7.com/mantis/view.php?id=1765
		https://www.intfiction.org/forum/viewtopic.php?p=124117#p124117
		
	So instead, I defined a new action with each building instance.
]

Chapter 1 - Sector 1

Sector 1 is a room in The Sectors. "You still maintain the crops here. There is a small graveyard and the barn remains from when this was the livestock sector. A pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 1: Crops". It has destination name "sector 1".

Some crops are scenery in Sector 1. They have description "You are proud of the grain and legumes." Understand "grain" and "legumes" as some crops.

Instead of eating some crops, say "You aren't hungry."

The graveyard is scenery in Sector 1. It has description "Fenced off but unmarked graves. You buried your parents here." Understand "small" and "graves" and "grave" and "fence" as the graveyard.

There is a pylon in Sector 1.

A S1H1 is a floor hatch. S1H1 is down from Sector 1 and up from Pod Control.

A S1B1 is a building. It is inside of Sector 1. Through it is Barn. S1B1 is scenery. It has description "A single story barn." It has printed name "barn". Understand "barn" as S1B1.

Understand "barn" as barn-going when the S1B1 is visible.
Barn-going is an action applying to nothing.
Before barn-going, try entering S1B1 instead. [* Because we can't use Understand "[building]" as entering... See note in Book 4 Section 8 ]

Section 1 - Barn

Barn is a room. "Not fancy: livestock on one side and feed on the other, but nothing remains of either. There is a plow near the entrance." It has destination name "the barn". Sector 1 is outside of barn.

A plow is scenery in the barn. It is pushable between rooms. It has description "A steel walking plow." Understand "plough" as plow.

Before pushing or pulling or turning or taking the plow, say "The plow is too heavy to move around without purpose." instead.

Before going with the plow, try pushing the plow instead.

Section 2 - Pod Control

Pod Control is a room in Underneath. "This room serves as an airlock for the pod bay, and holds an old space suit and various machinery such as the atmosphere pump. There is a brass plate on the wall." It has destination name "pod control".

A space suit is here. It is machinelike scenery. It has description "For EVA or extra protection in a pod. Unfortunately, it failed its last periodic inspection: the seals are leaking and there are no spares left."

Before doing anything other than examining or scanning to the space suit, say "All of the seals are shot, so the suit won't be useful." instead

Instead of the scanner scanning the space suit:
	computerize "Machine is failed.";
	rule succeeds.

A brass plate is here. It is scenery. It has description "The plate reads:[paragraph break]    RWSS [italic type]Founder's Mercy[roman type][line break]    Laid down 2138, Launched 2141.[line break]    'May His mercy shine upon us.'" Understand "plaque" as plate.

A status display is here. It is scenery and a machine. The status display can be examined.

Understand "message" and "error" as the status display when the pod bay is not ready.

Instead of examining the status display:
	now the status display is examined;
	if the pod bay is ready:
		say "The status display glows green.";
	otherwise:
		computerize "Pod bay locked down";
		let i be 1;
		if red circuit breaker is switched off:
			computerize " [i]. Telemetry sensor array offline - reset breaker FM36-87/A @ hub platform";
			increment i;
		if green valve is switched off:
			computerize " [i]. Launch system cooling loop offline - open backup valve @ Sector 2";
			increment i;
		unless the Pod Bay is pressurized:
			computerize " [i]. Pod bay depressurized - scan and repair atmosphere pump";
		else unless the atmosphere pump is functional:
			computerize " [i]. Atmosphere pump offline";
		else if S1H1 is open:
			computerize " [i]. Secure pod control hatch";

The atmosphere pump is a machine. It is in Pod Control. It is scenery. It has carrying capacity 2. It has description "[If the atmosphere pump is functional]The featureless atmosphere pump is softly humming.[otherwise]The atmosphere pump is a smooth featureless machine." Understand "machine" and "machinery" as the atmosphere pump.

The atmosphere pump contains a faulty power module and a faulty pressure regulation module.

To decide if (m - the atmosphere pump) is functional:
	unless m encloses a functional power module, decide no;
	unless m encloses a functional pressure regulation module, decide no;
	decide yes.	

Instead of the scanner scanning the atmosphere pump when the atmosphere pump is functional:
	now the atmosphere pump is scanned;
	computerize "Machine is functional and operating.";
	rule succeeds.

Definition: the atmosphere pump is usable if the atmosphere pump is functional. [* can use was with a definition but not a to decide phrase]

Every turn when the atmosphere pump is visible:
	if the atmosphere pump was not usable and the atmosphere pump is usable:
		say "The atmosphere pump begins to hum.";
		now Pod Bay is pressurized;
		if the atmosphere pump is not scored:
			increase the score by 1;
			now the atmosphere pump is scored.

Definition: the pod bay is ready if every circuit breaker is switched on and the atmosphere pump is functional and S1H1 is closed.

Every turn when the player is in Pod Control:
	if the pod bay is ready:
		now the bulkhead door is unlocked;
	otherwise:
		now the bulkhead door is locked;
	if the bulkhead door is open:
		now S1H1 is locked;
	otherwise:
		now S1H1 is unlocked.

A door called the bulkhead door is port from Pod Control and starboard from Pod Bay. It is closed and locked. "[if the player is in Pod Control][pod-bay-door-pc][otherwise][pod-bay-door-pb][end if]."

Understand "port" as the bulkhead door when the player is in Pod Control.
Understand "starboard" as the bulkhead door when the player is in Pod Bay.

To say pod-bay-door-pc:
	say "Beside the [if bulkhead door is open]open[otherwise]secured[end if] port door, a status display [if pod bay is ready]glows green[otherwise]shows an error message[end if]"
	
To say pod-bay-door-pb:
	say "[if bulkhead door is open]An open[otherwise]A secured[end if] door leads starboard"

Section 3 - Pod Bay

There is a room called Pod Bay. "There are four berths for transit pods. Unfortunately, all are empty." It has destination name "the pod bay". Pod Bay is in Underneath. Pod Bay can be pressurized. Pod Bay is not pressurized.

Instead of going nowhere from Pod Bay when the noun is outside, try going starboard.
Instead of exiting in Pod Bay, try going starboard.

Some berths are here. They are machinelike scenery. Understand "four berths" or "berth" and "door" and "doors" and "rail" and "rails" and "iris" and "closed" and "iris" and "pod bay" as some berths. Some berths have description "Each berth would hold a transit pod, but now there are only support rails and closed iris doors."

Instead of opening or closing the berths, say "The doors open and close automatically as pods dock and launch."
Instead of unlocking the berths with something, try opening the berths.
Instead of locking the berths with something, try closing the berths.

A pile of clutter is here. It is a fixed in place container. "There is a pile of clutter. It looks like equipment removed to free up space in the transit pods." Understand "equipment" as the pile of clutter.

Instead of pulling or pushing or turning or squeezing or swinging the pile:
	say "That isn't practical."

Before going with the pile, try pushing the pile instead.

Before taking the pile of clutter when the number of things in the pile of clutter is one:
	say "There is nothing useful left in the pile." instead.

Instead of taking the pile of clutter: [* Because I'm not sure there is a way to "try removing all from pile" ]
	let L be the list of things in the pile of clutter;
	remove the list of fixed in place things from L;
	repeat with item running through L:
		say "[item]: [no line break]";
		try silently taking the item;
		if the player encloses the item, say "Taken.";

An atmosphere sensor is in the pile. It has description "A small box with a large lamp that is slowly flashing amber." Understand "small" and "box" and "large" and "lamp" as the atmosphere sensor.

Instead of the scanner scanning the atmosphere sensor:
	now the atmosphere sensor is scanned;
	computerize "Machine functional. Pressure low at 80 kilopascals, O[Unicode 8322] normal, CO[Unicode 8322] high at 0.10%. No immediate danger.";
	rule succeeds;

An emergency communications unit is in the pile. It is a not fixed in place machine. It is bulky. It has description "A bulky but portable emergency communications unit from a transit pod. It can work independently if you provide audio and antenna connections." Understand "comms" as communications unit. Incorporated by the communications unit is a usb socket called the almond socket. Incorporated by the communications unit is an rf socket.

To say comms-usb-status:
	if audio and communications are connected:
		say "Audio connected";
	else if organ and communications are connected:
		say "Audio mismatch";
	else:
		say "No audio connection";

To say comms-rf-status:
	if communications unit and antenna panel are connected:
		say "RF connection";
	otherwise:
		say "No RF connection"

Instead of the scanner scanning the communications unit:
	now the communications unit is scanned;
	computerize "Machine functional. [comms-usb-status]. [comms-rf-status].";
	rule succeeds.

Some unremarkable junk is in the pile. It is fixed in place. It is not plural-named. It has indefinite article "some". Instead of doing something to the unremarkable junk, say "It really is unremarkable."

Chapter 2 - Sector 2

Sector 2 is spinward from Sector 1. It is in The Even Sectors. "A deep pond with some fish. You can walk spinward or antispinward." It has printed name "Sector 2: Aquaculture". It has destination name "sector 2".

The pond is scenery in sector 2. It has description "Something to do with water filtration, and it was used for raising fish. A few remain." Understand "water" and "deep" and "pool" as the pond.

Before looking under the pond, try searching the pond instead.
Before swimming when the pond is visible, try entering the pond instead.
Before swimming in the pond, try entering the pond instead.

Instead of drinking or tasting the pond, say "It tastes murky."
Instead of searching the pond, say "From above, you can make out a few fish in the murky water."

Instead of entering the pond:
	if the player is wearing the blanket:
		say "Not while you're wearing the blanket. It would be soaked.";
	otherwise if the player is wearing the mask:
		if the green valve is switched on:
			say "There is nothing more for you to do underwater.";
		otherwise:		
			say "You set your belongings aside. With the air from the emergency mask, you breathe comfortably as you step into the pond. At the bottom, you find a valve and open it, then swim to the surface, climb out, and recover everything you were carrying.";
			now the green valve is switched on;
			increase the score by 1;
	otherwise:
		say "You can't hold your breath long enough to make that worthwhile."

Some fish are scenery in sector 2. They have description "There are still a few fish swimming in the pond, but they taste horrible."

Instead of doing anything other than examining or scanning to the fish, say "The fish aren't easy to catch."

The green valve is a circuit breaker. It is switched off. It is nowhere.

Chapter 3 - Sector 3

Sector 3 is spinward from Sector 2. It is in The Sectors. "Trees, a house, and a church. A red pylon stretches up from the ground to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 3: Forest". It has destination name "sector 3".

Nothing is inside from Sector 3.

Instead of going nowhere from sector 3 when the noun is inside, say "You can enter the church or the house."

A pylon called S3P1 is here. It is improper-named. It has description "Made of smooth metal, anodized red, it connects the ground to the hub of the station many meters above." Understand "red" as S3P1.

Before going up in Sector 3, try climbing S3P1 instead.

Instead of climbing S3P1:	
	 if the player is wearing the gravity boots:
		say "Wearing the boots, you are able to climb up the pylon. As you get closer to the hub, gravity decreases, and the climb becomes easier.";
		now the player is in Platform 3;
		change the up exit of Sector 3 to Platform 3;
	otherwise:
		say "The red pylon is designated for climbing, but your feet slip when you try to go up."

There is a forest in Sector 3.

Instead of looking under a forest in Sector 3, say "Only the house and church."

A S3B1 is a building. It is scenery. It is port of Sector 3. It is privately-named. It has description "A small white building with a steeple." It has printed name "church". Understand "church" and "steeple" and "small" and "white" and "building" as S3B1. Through it is Church.

A S3B2 is a building. It is scenery. It is starboard of Sector 3. It is privately-named. It has description "What looks like whitewashed siding is really a lightweight plastic." It has printed name "the house". Understand "whitewashed" and "siding" and "lightweight" and "plastic" and "house" and "building" as S3B2. Through it is House.

Understand "church" as church-going when the S3B1 is visible.
Church-going is an action applying to nothing.
Before church-going, try entering S3B1 instead.

Understand "house" as house-going when the S3B2 is visible.
House-going is an action applying to nothing.
Before house-going, try entering S3B2 instead.

Section 1 - Church

The Church is a room. "Before everyone left or died, you celebrated every sabbath here. The altar stands against one wall, and an organ[if the portable audio unit is undescribed] and a portable audio unit stand[else] stands[end if] against the other." It has destination name "the church".

Sector 3 is outside of church.

Instead of going nowhere in church when the noun is starboard, try going outside.

An altar is a fixed in place scenery supporter in church. It has description "Really just a table."

The Founder's Testament is on the altar. It has description "The Founder's Testament tells how your people left Old Earth and first settled the station. You know the story by heart, and have already derived whatever comfort you can from this book." It has indefinite article "The". Understand "book" and "bible" as testament.

[ organ ]

The organ is scenery in Church. It is a machine. It has description "It's really just a keyboard in a fancy box with a socket to connect it to an audio unit." It has indefinite article "the". Understand "keyboard" as the organ. The organ can be played. Incorporated by the organ is a usb socket called the tan socket.

Instead of the scanner scanning the organ: [ organ is always functional ]
	now the organ is scanned;
	if audio and organ are connected and the audio unit is functional:
		computerize "Machine functional. Output connected.";
	else if organ and communications are connected:
		computerize "Machine functional. Connection mismatch.";
	else:
		computerize "Machine functional. No output available.";
	rule succeeds.

Instead of playing the organ:
	unless the organ is usable, say "Nothing happens." instead;
	if the organ is played, say "You play a few notes." instead;
	say "You never really learned how to play, but you pick out a few notes on the keyboard and the sound reverberates from the audio unit.";
	now the organ is played;

Instead of taking the organ, say "It is too heavy to move."

[ audio unit ]

An audio unit is an undescribed machine in Church. It is not fixed in place. It is bulky. It has carrying capacity 1. The description is "The audio unit incorporates a speaker, a microphone, and a socket you would use to connect it to another device." Understand "portable" as the audio unit. Incorporated by the audio unit is a usb socket called the beige socket.

The audio unit contains a faulty power module.

To decide if (m - the audio unit) is functional:	
	unless m encloses a functional power module, decide no;
	decide yes.

Instead of the scanner scanning the audio unit:
	now the audio unit is scanned;
	unless the audio unit is functional:
		computerize "Machine failed.";
	else if audio and organ are connected:
		computerize "Machine functional. Input connected.";
	else if audio and communications are connected:
		computerize "Machine functional. Input and output connected.";
	else:
		computerize "Machine functional. No input or output available.";
	rule succeeds.

Every turn when the audio unit is visible:
	if the organ was not usable and the organ is usable:
		say "The audio unit beeps and a synthesized voice says 'Organ ready.'";
	if the organ was usable and the organ is not usable and the audio unit is functional and the audio unit is closed:
		say "The audio unit beeps and a synthesized voice says 'No input.'";
	if the communications unit was not almost usable and the communications unit is almost usable:
		say "The audio unit beeps and a synthesized voice says 'No antenna connection.'";

After taking the audio unit:
	now the gray cable is handled;
	continue the action.

[ cable and connectivity ]

A gray cable is a cable in Church. "A gray cable connects the organ to the audio unit." Incorporated by it are two usb plugs. It has description "A one meter USB 7.2 cable with a Type-F plug at each end." Understand "grey" and "usb" as the gray cable.

A rule for reaching inside Church when the turn count is one: allow access. [* https://intfiction.org/forum/viewtopic.php?f=7&t=3636 ]

When play begins:
	silently try plugging the gray cable into the tan socket;
	silently try plugging the gray cable into the beige socket.

Definition: the communications unit is almost usable if
	the communications unit is functional and
	the audio unit is functional and
	audio and communications are connected.

Definition: the communications unit is usable if
	the communications unit is functional and
	the audio unit is functional and
	audio and communications are connected and
	communications and antenna panel are connected. [* usable means ready for its special purpose, functional just means that modules are all correct and functional ]

Definition: the organ is usable if audio unit and organ are connected and the audio unit is functional..

Section 2 - House

The House is a room. "Two families lived here, but not recently." It has destination name "the house".

Sector 3 is outside of house.

Instead of going nowhere in house when the noun is port, try going outside.

A doll is in house. "Someone has left a doll on the well swept floor." It has description "Wearing a brown jumpsuit and faceless, because we are all alike in the Founder's eyes. It was yours once, but you passed it on with other childish things when you were old enough to help in the fields." Understand "faceless" and "brown" and "jumpsuit" as the doll. [todo: play with doll]

Chapter 4 - Sector 4

Sector 4 is spinward from Sector 3. It is in The Even Sectors. "Your home is here among the crops. You can walk spinward or antispinward." It has printed name "Sector 4: Crops". It has destination name "sector 4".

The S4B1 is a building. It is inside of Sector 4. It is scenery. It has description "You father always said it was built to look like a log cabin on Old Earth." It has printed name "home". Through it is Home. Understand "home" or "house" as S4B1.

Understand "home" as home-going when the S4B1 is visible.
Home-going is an action applying to nothing.
Before home-going, try entering S4B1 instead.

Instead of searching S4B1, say "You would need to enter your home to do that."

Some vegetables are scenery in Sector 4. They have description "Greens, carrots, and potatoes." Understand "crops" and "greens" and "carrots" and "potatoes" as some vegetables.

Instead of eating some vegetables, say "You aren't hungry."

Section 1 - Home

Home is a room. "The room where you've slept your entire life. The crops are outside." It has destination name "your home".

Sector 4 is outside of home.

The blanket is in Home. "The homespun blanket which you use as your bed is arranged on the ground." The blanket is a bulky portable wearable enterable supporter. It has indefinite article "your". It has description "Homespun wool." Understand "homespun" and "wool" as the blanket.

The player is on the blanket.

Before wearing or taking the blanket: [* see Modified Exit by Emily Short ]
	if the holder of the player is the blanket:
		say "(first getting off the blanket)[command clarification break]";
		silently try exiting;
		if the holder of the player is the blanket, stop the action;
	if something is on the blanket:
		repeat with item running through the list of things on the blanket:
			say "(first taking [the item])[command clarification break]";
			silently try taking the item;
		if something is on the blanket, stop the action.

Before putting something on the blanket:
	if the player is wearing the blanket:
		say "Not while you are wearing the blanket." instead;
	if the player encloses the blanket:
		say "Not while you are carrying the blanket." instead.

After dropping the blanket when the player is not in zero-g:
	say "You arrange the blanket on the ground."

Section 2 - Cellar

A S4H1 is a floor hatch. It is down from Home and up from Cellar.

The Cellar is in Underneath. "Your decompression shelter and storage space for increasingly empty shelves of canned vegetables and one more large bag of split peas." It has destination name "the cellar".

[ scenery ]

Some shelves are scenery in cellar. "Almost a hundred jars of canned vegetables are on the makeshift shelves that line the wall.[if the emergency mask is undescribed] So is your emergency mask." They are a supporter. Understand "shelf" and "shelfs" and "wall" and "wall of shelves" and "spinward" and "makeshift" as shelves.

Instead of climbing the shelves, say "There is no chance they would support your weight."

Before searching the shelves, try examining the shelves instead.

Some canned vegetables are scenery on shelves. "Mostly tomatoes, green beans, carrots, and okra. Without a new source of salt or acid, too much of your recent harvest has been left to spoil." Understand "tomatoes" and "green" and "beans" and "carrots" and "okra" and "mason" and "jar" and "jars" and "can" and "cans" as canned vegetables.

Instead of eating or opening or taking or tasting or drinking the canned vegetables, say "You aren't hungry."

Instead of doing anything other than examining to the canned vegetables, say "That's not where your attention belongs just now."

A large bag of split peas is here. It is scenery. It has description "Legumes are your best remaining source of protein."

Instead of eating or opening or taking or tasting or drinking the bag of split peas, say "You aren't hungry."

Instead of doing anything other than examining to the bag of split peas, say "That's not where your attention belongs just now."

[ mask ]

An emergency mask is on shelves. It is undescribed, wearable, and machinelike. It has description "You wore this mask when there were regular decompression drills."

Instead of singing when the player is wearing the emergency mask, say "You can't sing while wearing the mask.";

The can't scan with your mask on rule is listed before the scanner must be enclosed rule in the scanner precheck rules.

This is the can't scan with your mask on rule:
	if the player is wearing the emergency mask:
		say "You can't talk to [the scanner] while wearing the mask.";
		rule fails.

Chapter 5 - Sector 5

Sector 5 is spinward from Sector 4. It is in The Sectors. "The school house is nestled among the trees. A pylon stretches up from the same grove to the hub of the station. You can walk spinward or antispinward." It has printed name "Sector 5: Forest". It has destination name "sector 5".

A S5B1 is a building. It is scenery. It is inside of sector 5. It has description "Little and red, the traditional markings of a school building." It has printed name "school house". Through it is School House. Understand "school" and "building" and "house" as S5B1.

Understand "school" or "school house" as school-going when the S5B1 is visible.
School-going is an action applying to nothing.
Before school-going, try entering S5B1 instead.

There is a pylon in Sector 5.

There is a forest in Sector 5.

Instead of looking under a forest in Sector 5, say "Only the school house."

Section 1 - School House

School House is a room. "A broken learning machine remains in a corner, but mostly the older farmers took turns leading the class. There is a desk, and a chalkboard hangs on one wall." It has destination name "the school house".

Sector 5 is outside of school house.

The learning machine is an machine in the school. It is scenery. It has description "This last learning machine broke when you were maybe three thousand days old." It has carrying capacity 2.

The learning machine contains a functional power module and a faulty instruction module.

To decide if (m - the learning machine) is functional: decide no. [* there are no functional instruction modules in the story world ]

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

[ todo "clean/rub eraser" ]

Chapter 6 - Sector 6

Sector 6 is spinward from Sector 5 and antispinward from Sector 1. It is in The Even Sectors. "Your people preferred to grow things the old fashioned way, but in truth the majority of your fruit and vegetables came from this sector when the machines still worked. You can walk spinward or antispinward." It has printed name "Sector 6: Hydroponics". It has destination name "sector 6".

Some hydroponics machines are scenery in Sector 6. It is machinelike. It has description "You were thoroughly trained in hydroponics maintenance, but fixing these machines is beyond you." Understand "machine" and "machinery" as hydroponics machines.

Instead of doing anything other than examining or scanning to the hydroponics machines, say "The hydroponics machines are just so much junk."

Instead of the scanner scanning the hydroponics machines:
	computerize "Machine failed.";
	rule succeeds.

Every turn when the player is in Sector 6:
	if the player encloses the gravity boots and the gravity boots are not scored:
		now the gravity boots are scored;
		increase the score by 1.

A vault hatch is a floor hatch. Vault hatch is down from Sector 6 and up from Supply Vault.

Section 1 - The Supply Vault

The Supply Vault is a room. "This room is dim, quiet, and stuffy. There is still one crate of machine parts left.[if laser is dusty][paragraph break]You see a laser beam scan across the exit.[end if]". It has destination name "the supply vault". Supply Vault is in underneath.

[ crate ]

A crate of machine parts is scenery in the supply vault. It has description "These remaining parts never seem to fit anywhere useful, but Founder only knows what's in there."

One faulty instruction module and one functional pressure regulation module are in the junk repository.

Instead of searching the crate of machine parts when something is in the junk repository:
	say "You find [list of things in the junk repository with indefinite articles].";
	repeat with item running through things in the junk repository:
		find and take item;

Instead of searching the crate of machine parts, say "Miscellaneous parts, none useful."
Instead of looking under the crate of machine parts, say "The crate rests firmly on the ground."

Instead of inserting something (called s) into the crate of machine parts:
	now s is in the junk repository;
	say "You add [the s] to the machine parts in the crate."

[ laser & boots ]

A pair of gravity boots is in the supply vault. The gravity boots are wearable. They have description "Black work boots with red stripes. They don't really make gravity, but they do stick to some maintenance walkways to help workers get around in low gravity."

A laser beam is scenery. It has description "The cloud of dust scatters the laser beam just enough that you can see it scan across the north passageway at seemingly random angles." Understand "dust" and "cloud" and "cloud of dust" as the laser beam. The laser beam can be dusty. The laser beam is not dusty. The laser can be alarmed. The laser is not alarmed.

Before doing something other than examining when the current action involves the laser beam, say "The laser beam is intangible." instead.

To trip the laser alarm:
	say "An alarm sounds, [if the vault hatch is open]the hatch slams shut, [end if]and a synthesized voice says 'Laser scan detects unauthorized materiel removal.'";
	if going or opening, say "[line break]The hatch seems to be locked.";
	now the vault hatch is closed;
	now the laser is alarmed;
	stop the action.

Before going up from the supply vault when the player encloses the gravity boots and the laser is not dusty, trip the laser alarm instead.

Before opening the vault hatch when the player is in the supply vault and the player encloses the gravity boots and the laser is not dusty and the vault hatch is closed, trip the laser alarm instead.

Before touching the laser beam when the player encloses the gravity boots, trip the laser alarm instead.

Escaping from vault is a truth state that varies. Escaping from vault is false.
Every turn: now escaping from vault is false. [* this is ugly ]
Before going up from the supply vault when the laser is dusty: now escaping from vault is true;

After opening the vault hatch when the player is in the supply vault and the laser is dusty:
	if escaping from vault is true:
		say "You maneuver around the laser beam, open [the vault hatch], and pull yourself up through it.";
	otherwise:
		say "You maneuver around the laser beam and open [the vault hatch].";

Before going up from the supply vault when the laser is dusty and the vault hatch is open, say "You maneuver around the laser beam and pull yourself up through the ceiling hatch."

Instead of attacking the dusty eraser in the supply vault:
	if the actor is not carrying the eraser, carry out the implicitly taking activity with the eraser;
	if the laser is dusty:
		say "You add to the cloud of dust.";
	otherwise:
		say "You fill the vault with a cloud of dust which scatters the laser beam that you can now see scanning across the hatch.";
	the laser dust settles in four turns from now;
	now the laser is dusty;
	now eraser is attacked.

After deciding the scope of the player when the location is the supply vault and the laser beam is dusty, place the laser beam in scope.

At the time when the laser dust settles:
	now the laser is not dusty;
	if the player is in the Supply Vault, say "The cloud of dust dissipates.";

Chapter 7 - The Platforms

Instead of jumping in The Platforms, say "Pseudogravity is definitely weaker up here."

After dropping something (called s) in The Platforms:
	say "You drop [the s] and it spirals off to the ground below.";
	let r be a random room in the The Sectors;
	now s is in r.

The TMP is a backdrop in The Platforms. It has description "You are on a circular platform suspended about two thirds of the way up the pylon to the hub." Understand "maintenance" and "platform" as TMP. TMP is privately-named. It has printed name "maintenance platform".

The TP is a backdrop in The Platforms. It has description "The pylon stretches up from the ground, to the maintenance platform, and finally the hub." Understand "pylon" as TP. TP is privately-named. It has printed name "pylon".

Before entering TP, try going down instead.

The ground is a backdrop in The Platforms. "You see the ground below you." [override in each platform]

Instead of doing anything other than examining to the ground, say "You are too far away to do that."

Before examining down in the platforms, try examining the ground instead.
Before examining up in the platforms, try examining the hub instead.
Before examining up in the sectors, try examining the hub instead.
Before entering the ground in the platforms, try going down instead.

Section 1 - Platform 1

Platform 1 is a room in The Platforms. "A mesh platform about two thirds of the way towards the hub. You can continue spinward or antispinward, or go up a ladder into the hub." [todo pylon] Sector 1 is down from Platform 1. Nothing is up from Sector 1. 

Before going down from Platform 1, say "You slide down the pylon."

Before going up from platform 1, say "Gravity fades as you climb."

Before entering the hub in platform 1, try going up instead.

The ladder is a door. It is open and not openable and scenery. It is up from Platform 1 and outside from Inside the Hub. It has description "[if the location is Platform 1]A ladder leads up into the hub.[otherwise]The ladder moves with the station, rotating around you about four times every minute."

Understand "crops" as the ground when the player is in Platform 1.

Instead of examining the ground in platform 1, say "The pylon descends to the crops below you."


Section 2 - Platform 3

Platform 3 is a room in The Platforms. "A mesh platform about two thirds of the way towards the hub. You can continue spinward or antispinward[if the player is in platform 3 for the first time].[paragraph break]You feel much lighter here, and you are very aware of how the station rotates, but everything is okay as long as you don't look down[end if]." Sector 3 is down from Platform 3. Nothing is up from Sector 3. Platform 3 is spinward from Platform 1.

Before going down from Platform 3, say "You [if the player is wearing the gravity boots]climb[else]slide[end if] down the pylon.";

A red circuit breaker is a circuit breaker in Platform 3. "There is a red circuit breaker here." The red circuit breaker is machinelike. [todo - better description]

Instead of the scanner scanning the red circuit breaker:
	computerize "Machine is functional. Breaker is [if the red circuit breaker is switched on]closed[otherwise]open[end if].";
	rule succeeds.

After switching on the red circuit breaker:
	say "You reach out and switch the circuit breaker on.";
	increase the score by 1.

Understand "trees" or "forest" as the ground when the player is in platform 3.

Instead of examining the ground in platform 3, say "The pylon descends into the forest below you."

Section 3 - Platform 5

Platform 5 is a room in The Platforms. "A mesh platform about two thirds of the way towards the hub. You can continue spinward or antispinward." Sector 5 is down from Platform 5. Nothing is up from Sector 5. Platform 5 is spinward from Platform 3 and antispinward from Platform 1.

Before going down from Platform 5, say "You slide down the pylon."

Understand "trees" or "forest" as the ground when the player is in platform 5.

Instead of examining the ground in platform 5, say "The pylon descends into the forest below you."

Chapter 8 - The Hub

After dropping something in zero-g, say "You drop [the noun] and [they] float[s] nearby."
Instead of jumping in zero-g, say "That's meaningless without gravity."
Instead of swimming in zero-g, say "You flail around in zero g."

Before printing the locale description:
	if the location is in zero-g, now the you-can-also-see rule response (F) is " floating here";
	otherwise now the you-can-also-see rule response (F) is " here";

[
	This is arbitrary, and it might be friendlier to autotake, but it's only insurance against making the game unwinnable because if the player leaves the gravity boots in the platforms or above, she won't be able to return. This depends on (1) objects dropped in the platforms falling to the sectors, and (2) all rooms above the platforms being zero-g.

	TODO: another way to accomplish this would be to keep the player from dropping the gravity boots in the platforms and to keep her from going down in the platforms without them. Think about this.
]

A thing can be floating-exceptioned. Yourself is floating-exceptioned.

Before going from a room in zero-g:
	let L be the list of things in the location;
	remove the list of things that are scenery from L;
	remove the list of things that are fixed in place from L;
	remove the list of things that are floating-exceptioned from L;
	if the number of entries in L is positive:
		let item be a random object in L;
		say "You aren't comfortable leaving behind [the item] floating in zero gravity.";
		stop the action.

Section 1 - Inside the Hub

Inside the Hub has description "You float weightless in the middle of a cylinder. It is colder up here, and the light is all artifical but without an obvious source. A ladder rotates around you, leading up or down or maybe out, and you can continue port or starboard inside the hub." It is in zero-g. It is unfamiliar. It has destination name "the center of the hub". [todo - port/sbd]

Before going down in Inside the Hub, try going outside instead.
Before going up in Inside the Hub, try going outside instead.

After going outside from Inside the Hub:
	say "You [one of]make sure you are heading legs first and follow the ladder[or]struggle a little to arrange your orientation and follow the ladder[or]fight off a moment of vertigo and climb the ladder[at random].";
	continue the action.

Before going port from Inside the Hub:
	if the player is wearing the jumpsuit and the player is wearing the blanket, continue the action;
	if the player is wearing the jumpsuit, say "The passageway to the port is colder still, too cold for you in only your jumpsuit." instead;
	if the player is wearing the blanket, say "They passageway to the port is colder still, too cold for you wearing nothing under the blanket." instead;
	say "The passageway to the port is colder still, too cold for you to bear nude." instead.

After going port from Inside the Hub:
	say "You follow a narrow passageway."; [todo]
	continue the action;

Section 2 - Port End

[ this end is near the solar panels and antennas ]

Port End is port of Inside the hub. "You float weightless at the port end of a cylinder. It is very cold and dark here." It is in zero-g. It is unfamiliar.It has destination name "the port end of the hub".

The antenna panel is scenery in Port End.  It is a machine. It has description "It's a small panel with a permanently attached yellow RF cable." Incorporated by the antenna panel is an RF socket. [ todo - description ]

[ todo: scan panel if needed for antenna puzzle

	cable name, description, ...
]

A yellow cable is a cable in Port End. "A yellow cable waves from a small panel." It is floating-exceptioned. It has description "A two meter yellow RF cable." Understand "RF" as the yellow cable. Incorporated by it are two RF plugs.

Instead of unplugging the yellow cable from the antenna panel:
	say "The yellow cable is permanently attached to the panel.";
	stop the action.

A rule for reaching inside Port End when the turn count is one: allow access. [* https://intfiction.org/forum/viewtopic.php?f=7&t=3636 ]

When play begins:
	silently try plugging the yellow cable into the antenna panel.

Instead of an actor going to somewhere when the yellow cable is enclosed by the actor:
	say "The yellow cable is permanently attached to the panel, so you must drop it before leaving."

Instead of taking off something in Port End:
	unless the noun is the jumpsuit or the noun is the blanket, continue the action;
	say "It is too cold here to even consider removing [the noun].";

After going starboard from Port End:
	say "You follow a narrow passageway."; [todo]
	continue the action.

Before going outside from Port End, try going starboard instead.
	
Section 3 - Starboard End

[ TODO: maybe drop if there isn't any reason to use this room ]

Starboard End is starboard of Inside the Hub. "You float weightless at the starboard end of a cylinder." It is in zero-g. It is unfamiliar. It has destination name "the starboard end of the hub".

[ --- ]