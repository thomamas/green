"Green" by Thomas Insel

[
	Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
	http://tinsel.org/IF/
	
	This work is licensed under a Creative Commons Attribution 4.0 International License.
	https://creativecommons.org/licenses/by/4.0/	
]

[
	TODO:

	- "jump" adjusted for centripetal force and low gravity.
	
]

Book 1 - Setup

Use American dialect and the serial comma.

Index map with EPS file.

The story headline is "An Interactive Space Story".

The release number is 1.

The story description is "You awake. You are lonely, so lonely. It was a thousand days ago today. All alone these thousand days. Your parents were the last. No, your father was the last. He held on for nearly a hundred days longer than your mother. No, you are the last. Alone. Adrift.

But maybe it isn’t hopeless. There must still be some people in other worlds, and you think you know how to get there.

Today is the day."

When play begins:
	say "[the story description][paragraph break]";
	now exit listing is disabled.

Release along with [cover art,] an interpreter, the introductory booklet, the library card, and a "Local" website.

Chapter 1 - Extensions

Include Exit Lister by Eric Eve.

The explain exit listing rule does nothing.

Report ExitListing when listing explained is false:
	now listing explained is true;
	say "[italic type]Type 'exits on' to enable the status line exit lister and 'exits off' to turn it off.[roman type][paragraph break]"

Include Unicode Character Names by Graham Nelson. 

Chapter 2 - Footnotes

[ see Example 300 Ibid ]

To say radius-math:
	say "The circumference of the main wheel is composed of eight sectors of 20 meters each, so 2[unicode greek small letter pi]r = 160, and r [unicode approximately equal to] 25"
	
To say rotation-math:
	say "Local artificial gravity is 6 m/s[unicode superscript two] and the radius of the main wheel is roughly 25 m. Thus a = v[unicode superscript two] / r, v = sqrt(a[unicode dot operator]r) = sqrt(6[unicode dot operator]25) = sqrt(150) [unicode approximately equal to] 12. Further, (12 m / s) [unicode dot operator] (1 circumference / 160 m) = 0.075 circ / s, about 13 seconds / rotation, or about 4 rpm/"

Table of Footnotes
assignment	note
a number	"[radius-math]"
--	"[rotation-math]"

Footnotes mentioned is a number that varies.

Footnotes were explained is a truth state that varies. Footnotes were explained is false.

Need to explain footnotes is a truth state that varies. Need to explain footnotes is false.

To say (footnote - a number) as a footnote:
	if footnote > number of filled rows in the Table of Footnotes:
		say "[italic type]Programming error: footnote assignment out of range.[roman type]";
	otherwise:
		now need to explain footnotes is true;
		choose row footnote in the Table of Footnotes;
		if there is an assignment entry:
			say "[bracket][assignment entry][close bracket]";
		otherwise:
			increment footnotes mentioned;
			choose row footnote in the Table of Footnotes;
			now assignment entry is footnotes mentioned;
			say "[bracket][assignment entry][close bracket]".
			
The check footnote instructions rule is listed last in the every turn rulebook.

This is the check footnote instructions rule:
	if need to explain footnotes is true and footnotes were explained is false:
		say "[italic type]'[bracket]1[close bracket]' is a footnote. You can type 'note 1' to see the first footnote, or 'notes' to see all footnotes so far.[roman type][paragraph break]";
		now footnotes were explained is true;
	now need to explain footnotes is false;

Understand "footnote [number]" or "note [number]" as looking up a footnote.
Understand "notes" or "footnotes" as looking up all footnotes.

Looking up a footnote is an action out of world applying to one number.

Check looking up a footnote:
	if the number understood > footnotes mentioned, say "You haven't seen any such footnote." instead;
	if the number understood < 1, say "Footnotes are numbered from 1."

Carry out looking up a footnote:
	choose row with assignment of number understood in the Table of Footnotes;
	say "[bracket][assignment entry][close bracket] [note entry]."

Looking up all footnotes is an action out of world applying to nothing.

Carry out looking up all footnotes:
	let p be zero;
	repeat through the Table of Footnotes in assignment order:
		if there is an assignment entry:
			say "[bracket][assignment entry][close bracket] [note entry].[paragraph break]";
			increase p by 1;
	if p is zero:
		say "You haven't seen any footnotes so far."

Chapter 3 - Directions

The starboard is a direction. The starboard has opposite port. Understand "s" as starboard when the location is stellar.

The port is a direction. The port has opposite starboard. Understand "p" as port when the location is stellar.

The spinward is a direction. The spinward has opposite antispinward. Understand "sw" as spinward when the location is stellar.

The antispinward is a direction. The antispinward has opposite spinward. Understand "asw" as antispinward when the location is stellar.

Does the player mean going a stellar direction when the location is stellar: it is very likely.

A room can be stellar or planetbound. A room is usually stellar.

A direction can be stellar or planetbound. A direction is usually not stellar. Starboard, port, spinward, antispinward, up, down, the inside and the outside are stellar.

Before going a stellar direction when the location is not stellar, say "stellar directions can only be used on board ship."

Directions were explained is a truth state that varies. Directions were explained is false.

Before going an planetbound direction when the location is stellar:
	say	"You have heard of compass directions like [noun], but they don't make any sense here. Instead, you can go spinward, antispinward, port, and starboard.[paragraph break]";
	unless directions were explained is true:
		say "[italic type]When you look spinward, port is left and starboard is right. You can also use up, down, in, and out, and you can use abbreviations 'sw', 'asw', 'p', and 's'. Also, you can type 'exits' if you get confused about geography.[roman type][paragraph break]";
		now directions were explained is true;
	stop the action.
	
[ todo - credit extensions ]
	
Index map with spinward mapped as north. Index map with antispinward mapped as south. Index map with port mapped as west. Index map with starboard mapped as east.

Chapter 4 - Regions

Underneath is a region.

Main Level is a region.

Before going spinward in the Main Level:
	say "You walk a little ways to the next sector."

Before going antispinward in the Main Level:
	say "You walk a little ways to the next sector."
	
The hub is a backdrop in Main Level and in Center Platform. [todo]

Chapter 5 - Kinds of doors

To say floor-hatch-desc (d - a floor hatch):
	if the location is in underneath:	
		say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the ceiling.[no line break]";
	otherwise:
		say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the floor.[no line break]".

To say floor-hatch-short:
	let d be a random floor hatch in the location;
	if the location is in underneath:
		say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the ceiling.[no line break]";
	otherwise:
		say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the floor.[no line break]"

A floor hatch is a kind of door. "[floor-hatch-short]". It is usually privately-named. It usually has description "[floor-hatch-desc noun]." It is usually closed. It usually has printed name "[if the noun is in Underneath]ceiling hatch[otherwise]floor hatch[end if]".

After going up through a floor hatch:
	let d be a random open floor hatch in the location;
	say "You scramble down through the hatch and close it behind yourself.";
	try silently closing d;
	continue the action.
	
After going down through a floor hatch:
	let d be a random open floor hatch in the location;
	say "You pull yourself up through the hatch and close it behind yourself.";
	try silently closing d;
	continue the action.

Understand "hatch" as a floor hatch.
Understand "ceiling" as floor hatch when the location is in Underneath.
Understand "floor" as floor hatch when the location is not in Underneath.

Understand "secure [a floor hatch]" as closing.

A building is a kind of door. It is usually open. It is usually not openable. It is usually privately-named.

[ To represent the outside of buildings you go out/in from in the ring. ]

Chapter 6 - Kinds of Other Things

A pylon is a kind of thing. It is usually scenery. It is usually privately-named. It usually has printed name "the pylon". Understand "pylon" as pylon. A pylon usually has indefinite article "the". A pylon usually has description "Made of smooth metal, it connects the ground to the hub of the station about 25 meters above [1 as a footnote]."

Instead of climbing a pylon (called p):
	say "The pylon is slick metal with no obvious handholds."

Before going nowhere when a pylon (called p) is visible:
	if the noun is up, try climbing p instead.

A circuit breaker is a kind of device. Circuit breakers are usually fixed in place.

Instead of switching off a circuit breaker (called b) when b is switched on:
	say "[The b] seems to be locked on."

The green circuit breaker is a circuit breaker. It is switched off. [todo]
The blue circuit breaker is a circuit breaker. It is switched on. [todo]

[ todo -- scenes driven by completing breakers ]

To decide if the pod bay is ready:
	if every circuit breaker is switched on, decide yes;
	decide no.
	
To decide if the pod bay is not ready:
	if the pod bay is ready, decide no;
	decide yes.

[
Breakers Ready is a scene. Breakers Ready begins when the pod bay is ready for the first time.

When Breakers Ready begins:
	say "You have switched on all three circuit breakers. Since the game isn't finished, that means...";
	end the story saying "You have won";
	[todo]
]

Chapter 7 - About

Requesting the credits is an action out of world and applying to nothing.

Understand "about" or "credits" as requesting the credits.
	
After printing the banner text rule:
	say "Type 'about' for credits and more information.";
	
Carry out requesting the credits:
	say	"[bold type]About Green[roman type][line break]",
		"[italic type]Green[roman type] is my second released Inform project, conceived and implemented over a few weeks in 2018.[paragraph break]",
		"Please send your feedback, bug reports, and requests for help to [fixed letter spacing]tinsel@tinsel.org[roman type]. You can always find the current version of this game at [fixed letter spacing]http://tinsel.org/IF/[roman type] .[paragraph break]",
		"This work is Copyright © 2017 Thomas Insel but may be freely shared according to the terms of the Creative Commons Attribution 4.0 International license ([fixed letter spacing]https://creativecommons.org/licenses/by/4.0/[roman type]).".

[
Exit Lister version 11 by Eric Eve
Unicode Character Names by Graham Nelson
]

Chapter 8 - The Player

The player is female.

Instead of examining the player, say "As cute as ever."

The player is wearing a green jumpsuit. The jumpsuit has description "You have worn jumpsuits like this since you were small. Originally, 
the colors had meanings: green for farmers, blue for technicians, and so on, but that distinction died even before the population."

The pocket is part of the jumpsuit. The pocket is a player's holdall.

After examining the jumpsuit:
	if the pocket contains something:
		say "The pocket contains [a list of things in the pocket].";
	otherwise:
		say "It features a single large pocket, currently empty.";

Before inserting something into the jumpsuit:
	try inserting the noun into the pocket instead.

Instead of taking inventory:
	if the first thing held by the player is nothing, say "[We] [are] carrying nothing." instead;
	say "[We] [are] carrying:[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation;
	if the pocket contains something and the player is wearing the jumpsuit:
		say "[line break][Our] jumpsuit pocket contains:[line break]";
		list the contents of the pocket, with newlines, indented, including contents, giving inventory information, with extra indentation.

Book 2 - The Ring

Chapter 1 - Sector 1

Sector 1 is a room in Main Level. "You are in sector 1. A pylon stretches up from the ground to the hub of the station." It has printed name "Sector 1: Crops".

A pylon called S1P1 is here.

Section 1 - Pod Control

There is a room called Pod Control. "The pod bay is antispinward. Beside the hatch a status display [if pod bay is ready]glows green[otherwise]shows an error message[end if]."

It is in Underneath. [todo]

S1H1 is a floor hatch. S1H1 is down from Sector 1 and up from Pod Control.

A status display is scenery in Pod Control. It has description "[status-display-text]". Understand "message" or "error" as the status display when the pod bay is not ready.

To say status-display-text:
	if the red circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: telemetry sensor array offline[line break]",
			"Remediation: reset circuit breaker 36-87/A, location: hub maintenance platform[roman type]";
	else if the blue circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: launch system cooling loop offline[line break]",
			"Remediation: reset circuit breaker 29-63/A, location: Sector 2[roman type]";
	else if the green circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: Something[line break]",
			"Remediation: something[roman type]"; [ todo]
	else:
		say "The status display glows green."


Section 2 - Pod Bay

There is a room called Pod Bay. 

A door called pod bay door is antispinward from Pod Control and spinward from Pod Bay. It is closed and locked.

Every turn when the player is in Pod Bay:
	say "SInce the game isn't finished...";
	end the story saying "...you have won".
		
Every turn when the player is in Pod Control:
	if the pod bay is ready:
		now the pod bay door is unlocked;
	otherwise:
		now the pod bay door is locked.


Chapter 2 - Sector 2

Sector 2 is spinward from Sector 1. It is in Main Level. "There is a large, deep pond that serves as part of the water filtration system and is used for raising fish." It has printed name "Sector 2: Aquaculture".

The pond is scenery in sector 2. It has description "Something to do with water filtration, and there are still some fish." Understand "water" as the pond.

Instead of drinking the pond, say "It's a bit fishy for that."

Instead of searching the pond, say "[The pond] is pretty murky, you can't easily do that from outside."

Instead of looking under the pond, say "[The pond] is pretty murky, you can't easily do that from outside."

[todo swim]

Instead of entering the pond:
	if the player is wearing the helmet:
		say "Since you're wearing the emergency helmet, you breath comfortably as you step into the pond. At the bottom, you find a green circuit breaker and flip it on."; [todo]
		now the green breaker is switched on;
		[todo -- if breaker already on]
	otherwise:
		say "You can't hold your breath long enough to make that worthwhile."

Chapter 3 - Sector 3

Sector 3 is spinward from Sector 2. It is in Main Level. "Trees, two homes, and a church. A red pylon stretches up from the ground to the hub of the station." It has printed name "Sector 3: Forest".

A pylon called S3P1 is here. It has description "Made of smooth metal, anodized red, it connects the ground to the hub of the station about 25 meters above [1 as a footnote]."

Instead of climbing S3P1, try going up.

Before going up from Sector 3:
	 if the player is wearing the gravity boots:
		say "It isn't easy, but with the boots, you are able to climb towards the hub.";
	otherwise:
		say "The red pylon is designated for climbing, but you still can't get a grip.";
		stop the action.

[todo -- buildings]

Section 1 - Center Platform

Center Platform is up from Sector 3. "It's a mesh platform a little below the hub. From here, you are very aware of how the station rotates, but everything is okay as long as you don't look down [2 as a footnote]."

Before going down from Center Platform:
	if the player is wearing the gravity boots:
		say "You climb down the pylon.";
	otherwise:
		say "You slide down the pylon."

A red circuit breaker is a circuit breaker in center platform.

After dropping something (called s) in Center Platform:
	say "You drop [the s] and it spirals off the the ground below.";
	let r be a random room in the Main Level;
	now s is in r.

Chapter 4 - Sector 4

Sector 4 is spinward from Sector 3. It is in Main Level. "You are in sector 4." It has printed name "Sector 4: Crops"

S4B1 is a building. "Your home is here. You were told it was built to look like a log cabin on Old Earth." It is inside of Sector 4. It has description "xyz." It has printed name "your home". Through it is Home. Understand "home" as S4B1. [todo]

Section 1 - Home

Home is a room. "The room where you've slept your entire life. The only exit is out from here."

Sector 4 is outside of home.

Your bed is an enterable supporter in Home. The player is on the bed.

Section 2 - Below Home

There is a room called Below Home. "Used for storage and as a decompression shelter." It is in Underneath.

S4H1 is a floor hatch. S4H1 is down from Home and up from Below Home.

An emergency helmet is in below home. It is wearable. "There is an emergency helmet hanging on the wall." It has description "You used to wear a helmet like this when there were decompression drills every twenty days."

Chapter 5 - Sector 5

Sector 5 is spinward from Sector 4. It is in Main Level. "You are in sector 5. A pylon stretches up from the ground to the jub of the station." It has printed name "Sector 5: Forest".

S5B1 is a building. "The school house is nestled among the trees." It is inside of sector 5. It has description "It's little and red. Apparently, that is the traditional marking of a school building." It has printed name "the school building". Through it is School. Understand "school" and "house" as S5B1. [todo]

A pylon called S5P1 is here.

Section 1 - School

School is a room. "You had learning machines once. After they broke, some of the older farmers took turns leading the class, then just you, in lessons." [todo]

Sector 5 is outside of school.

A desk is a fixed in place supporter in the school. It has description "You wrote your lessons at this desk. Your people were practical, plain folk, so you learned practical things in school: reading, writing, arithmetic. More importantly, practical mechanics and farming. There wasn’t too much time for history, if they even remembered it."

A chalkboard is fixed in place in the school. "There is a chalkboard on the wall." Understand "chalk board" and "blackboard" and "black board" and "board" as chalkboard. The chalkboard can be cleaned or smudged or written. It is written. It has description "[if the chalkboard is cleaned]The board is perfectly blank.[else if the chalkboard is written]The board is covered in your old arithmetic work.[else]The board is covered in smudges.[end if]". Understand "smudges" as chalkboard when the chalkboard is smudged. Understand "arithmetic" and "work" as the chalkboard when the chalkboard is written.

An eraser is on the desk. The eraser can be clean or dusty. It is clean. Understand the clean property as describing the eraser. It has description "A [if the eraser is dusty]dusty[otherwise]clean[end if] eraser." It has printed name "[if the eraser is dusty]dusty[otherwise]clean[end if] eraser"

Instead of rubbing the chalkboard:
	if the chalkboard is cleaned:
		say "The chalkboard is already clean.";
	otherwise if the chalkboard is smudged:
		say "You smudge the smudges around.";
	otherwise:
		now the chalkboard is smudged;
		say "You smudge the writing around."

Understand "rub [something] with [something]" as rubbing it with.
Understand the command "erase" as "rub".

Rubbing it with is an action applying to one thing and one carried thing.

Carry out an actor rubbing something with:
	Try rubbing the noun instead;

Instead of rubbing the chalkboard when the player encloses the eraser and the eraser is visible:
	say "(with the eraser)[command clarification break]";
	try rubbing the chalkboard with the eraser;

Instead of rubbing the chalkboard with something (called the rubber):	if the chalkboard is cleaned:
		say "The chalkboard is already clean." instead;
	if the rubber is:
		-- the eraser:
			say "You carefully erase the chalkboard.";
			now the chalkboard is cleaned;
			now the eraser is dusty;
		-- otherwise:
			say "You smudge the gibberish around.";

Instead of attacking the eraser:
	if the actor is not carrying the eraser, carry out the implicitly taking activity with the eraser;
	if the eraser is clean:
		say "Nothing happens.";
	otherwise if the location is the supply vault:
		say "You fill the room with a cloud of dust and you can now see a laser beam scanning across the passageway.";
		now the laser visibility counter is 4;
	otherwise:
		say "You fill the room with a cloud of dust, which quickly clears."

Chapter 6 - Sector 6

Sector 6 is spinward from Sector 5. It is in Main Level. "Your people prefered to grow things the old fashioned way, but in truth the majority of your fruit and vegetables came from this sector when the machines still worked.[paragraph break]You can go down." It has printed name "Sector 6: Hydroponics"


Section 1 - Below Sector 6

There is a room called Below Sector 6. "It's room. You can go up or spinward." It is in Underneath.

S6H1 is a floor hatch. S6H1 is down from Sector 6 and up from Below Sector 6.


Section 2 - The Supply Vault

[
	TODO: description, make down from a room with a hatch.
		
	better cluing of the laser
]

The Supply Vault is spinward from the room called Below Sector 6. "This room is dim, quiet, and stuffy. The only exit is antispinward.[if laser is visible][paragraph break]You see a laser beam scan across the exit.[end if]"

A pair of gravity boots is in the supply vault. The gravity boots are wearable. They are plural-named. They have description "Black work boots with red stripes. They don't really make gravity, but they do stick to some maintenance walkways to help workers get around in low gravity or on the outside of a rotating station." [ todo -- another way to practice ]

The laser visibility counter is a number that varies. Laser visibility counter is 0.

Every turn when the laser visibility counter is greater than zero:
	decrease the laser visibility counter by one.

To decide if the laser is visible:
	if the laser visibility counter is greater than zero, decide yes.

Before going antispinward from the supply vault when the player encloses the gravity boots and the laser is visible:
	say "You maneuver around the laser beam.";

Before going antispinward from the supply vault when the player encloses the gravity boots and the laser is not visible:
	say "An alarm sounds and you jump back as a gate slams shut across the passageway. It quickly retracts." instead.

Laser beam is scenery. It has description "The cloud of dust scatters the laser beam just enough that you can see it scan across the north passageway at seemingly random angles." Understand "dust" and "cloud" and "cloud of dust" as the laser beam.

After deciding the scope of the player when the location is the supply vault:
	if the laser is visible, place the laser beam in scope.

Before doing something other than examining or touching when the current action involves the laser beam, say "The laser beam is intangible." instead.

Before touching the laser beam:
	if the player encloses the gravity boots:
		say "An alarm sounds and a gate slams across the passageway, then quickly retracts.";
	otherwise:
		say "The laser beam is intangible.";
	stop the action.

Chapter 7 - Sector 7

Sector 7 is spinward from Sector 6. It is in Main Level. "You are in sector 7. There are pens left from when this was the livestock sector, but nothing is left now. A pylon stretches up from the ground to the hub of the station." It has printed name "Sector 7: Livestock"

A pylon called S7P1 is here.

Chapter 8 - Sector 8 

Sector 8 is spinward from Sector 7 and antispinward from Sector 1. It is in Main Level. "You are in sector 8." It has printed name "Sector 8: Crops"
