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
	- consistent approach to scenery ... just junk, etc.
	- are there so few objects that the pocket isn't necessary (then remove carrying capacity too)
	- I am not satisfied with the name Green
]

Book 1 - Setup

Chapter 1 - The story

Use American dialect and the serial comma.

Index map with EPS file.

The story headline is "A Space Story".

The release number is 1.

The story description is "You awake. You are lonely, so lonely. It was a thousand days ago today. All alone these thousand days. Your parents were the last. No, your father was the last. He held on for nearly a hundred days longer than your mother. No, you are the last. Alone. Adrift.

But maybe it isn’t hopeless. There must still be some people in other worlds, and you think you know how to get there.

Today is the day."

When play begins:
	say "[the story description][paragraph break]";
	now exit listing is enabled.

Release along with cover art, an interpreter, the introductory booklet, the library card, and a "Local" website.

Chapter 2 - Extensions

Include Exit Lister by Eric Eve.

The explain exit listing rule does nothing.

Report ExitListing when listing explained is false:
	now listing explained is true;
	say "[italic type]Type 'exits off' to disable the status line exit list and 'exits on' to turn it back on.[roman type][paragraph break]"

Include Unicode Character Names by Graham Nelson.

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
	
Index map with spinward mapped as north. Index map with antispinward mapped as south. Index map with port mapped as west. Index map with starboard mapped as east.

Chapter 4 - Regions

Underneath is a region. [todo -- can we avoid underneath?]

Main Level is a region.

Before going spinward in the Main Level:
	say "You walk a little ways to the next sector."

Before going antispinward in the Main Level:
	say "You walk a little ways to the next sector."
	
The hub is a backdrop in Main Level and in Center Platform. It has description "The station rotates around the hub, which extends out to hold solar panels on the port and mirrors on the starboard side.[if the player is not in the center platform] On the inside, there is a mesh maintenance platform."

Solar panels are a backdrop in Main Level and in Center Platform. They have description "The primary source of station power." Understand "panel" as solar panels.

Mirrors are a backdrop in Main Level and in Center Platform. They have description "The mirrors reflect sun light into the station." Understand "mirror" and "sun" and "light" and "sunlight" as mirrors.

Maintenance platform is a backdrop in Main Level. It has description "Since the main power and sensor feeds pass through the hub, there is a platform where you can perform various maintenance tasks."

Instead of doing anything other than examining to the hub when the player is not in the center platform:
	say "You are too far away to do that."
	
Instead of doing anything other than examining to the solar panels:
	say "You are too far away to do that."

Instead of doing anything other than examining or entering to the maintenance platform:
	say "You are too far away to do that."

Instead of entering the maintenance platform:
	say "You will need to climb a pylon to get there."

Chapter 5 - Kinds of doors

To say floor-hatch-desc (d - a floor hatch):
	say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if][no line break]";

To say floor-hatch-short:
	let d be a random floor hatch in the location;
	say "There is [if d is open]an open[otherwise]a secured[end if] hatch in the [if the direction of d from the location is up]ceiling[otherwise if the location is Home]floor[otherwise]ground[end if][no line break]";

A floor hatch is a kind of door. "[floor-hatch-short].". It is usually privately-named. It usually has description "[floor-hatch-desc noun]." It is usually closed. It usually has printed name "the [if the player is in Underneath]ceiling hatch[otherwise]floor hatch[end if]".

After going up through a floor hatch: [ todo is there away to avoid the random... ]
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

Chapter 6 - Kinds of Other Things

A pylon is a kind of thing. It is usually scenery. It is usually privately-named. It usually has printed name "the pylon". Understand "pylon" as pylon. A pylon usually has indefinite article "the". A pylon usually has description "Made of smooth metal, it connects the ground to the hub of the station about 25 meters above."

Instead of climbing a pylon (called p):
	say "The pylon is slick metal with no obvious handholds."

Before going nowhere when a pylon (called p) is visible:
	if the noun is up, try climbing p instead.

A circuit breaker is a kind of device. Circuit breakers are usually fixed in place.

Instead of switching off a circuit breaker (called b) when b is switched on:
	say "[The b] seems to be locked on."

The green circuit breaker is a circuit breaker. It is switched off. [todo]
The blue circuit breaker is a circuit breaker. It is switched on. [todo]

To decide if the pod bay is ready:
	if every circuit breaker is switched on and S1H1 is closed, decide yes;
	decide no.
	
To decide if the pod bay is not ready:
	if the pod bay is ready, decide no;
	decide yes.

A forest is a kind of  thing. It is usually scenery and privately-named and plural-named. It usually has printed name "some trees". Understand "tree" and "trees" and "forest" as a forest. A forest usually has description "The community grew trees for tradition, or maybe they help with air processing. You don't remember."

Instead of climbing a forest:
	if the player is wearing the gravity boots:
		say "Trees aren't magnetized, so the boots won't help.";
	otherwise:
		say "You can't get a good grip."

Chapter 7 - About

Requesting the credits is an action out of world and applying to nothing.

Understand "about" or "help" or "credits" as requesting the credits.
	
After printing the banner text rule:
	say "Type 'about' for credits and more information.";
	
Carry out requesting the credits:
	say	"[bold type]About Green[roman type][line break]",
		"[italic type]Green[roman type] is my second released Inform project, conceived and implemented in November of 2018. It should be impossible to put this game into an unwinnable state.[paragraph break]",
		"The cover art is adapted from Figure 1.1 from NASA SP-413, [italic type]Space Settlements: A Design Study[roman type], edited by Richard D. Johnson and Charles Holbrow, and available from The Internet Archive at [fixed letter spacing]https://archive.org/details/SpaceSettlementsADesignStudy1977[roman type] .[paragraph break]",
		"Please send your feedback, bug reports, and requests for help to [fixed letter spacing]tinsel@tinsel.org[roman type]. You can always find the current version of this game at [fixed letter spacing]http://tinsel.org/IF/[roman type] .[paragraph break]",
		"This work is Copyright © 2018 Thomas Insel but may be freely shared according to the terms of the Creative Commons Attribution 4.0 International license ([fixed letter spacing]https://creativecommons.org/licenses/by/4.0/[roman type]).".

[
Exit Lister version 11 by Eric Eve
Unicode Character Names by Graham Nelson
]

Chapter 8 - The Player

The player is female. The carrying capacity of the player is 3.

Instead of examining the player, say "As cute as ever."

The player is wearing a green jumpsuit. The jumpsuit has description "You have worn jumpsuits like this since you were small. Originally, 
the colors had meanings: green for farmers, blue for technicians, and so on, but that distinction died even before the population."

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

Instead of taking inventory:
	if the first thing held by the player is nothing, say "[We] [are] carrying nothing." instead;
	say "[We] [are] carrying:[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation;
	if the pocket contains something and the player is wearing the jumpsuit:
		say "[line break][Our] jumpsuit pocket contains:[line break]";
		list the contents of the pocket, with newlines, indented, including contents, giving inventory information, with extra indentation.

Chapter 9 - Actions

Section 1 - Remove Some Actions

Understand the command "wake" as something new.
Understand the command "buy" as something new.

Section 2 - And Add Some

Understand "swim" as swimming.
Understand "swim in [something]" as swimming in.

Swimming is an action applying to nothing.
Swimming in is an action applying to one thing.

Instead of swimming, say "There's nothing to swim in."
Instead of swimming in, say "You can't swim in [the noun]."

Understand "rub [something] with [something]" as rubbing it with.
Understand the command "erase" as "rub".

Rubbing it with is an action applying to one thing and one carried thing.

Carry out an actor rubbing something with:
	Try rubbing the noun instead;	

Chapter 10 - Testing - Not for release

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

Book 3 - The Ring

Chapter 1 - Sector 1

Sector 1 is a room in Main Level. "This sector is fallow for a cycle. A pylon stretches up from the ground to the hub of the station." It has printed name "Sector 1: Crops". It has destination name "sector 1".

There is a pylon in Sector 1.

Section 1 - Pod Control

There is a room called Pod Control. "This room serves as an airlock for the pod bay."

Pod Control is in Underneath.

S1H1 is a floor hatch. S1H1 is down from Sector 1 and up from Pod Control.

A space suit is scenery in Pod Control. It has description "For EVA or extra protection in a pod. Unfortunately, it failed its last periodic inspection: the seals are leaking and there are no spares left."

Before doing anything other than examining to the space suit:
	say "All of the seals are shot, so the suit won't be useful."
	
A status display is scenery in Pod Control.
Understand "message" and "error" as the status display when the pod bay is not ready.

Instead of examining the status display:
	if the red circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: telemetry sensor array offline[line break]",
			"Remediation: reset breaker 36-87/A @ hub platform[roman type][paragraph break]";
	else if the blue circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: launch system cooling loop offline[line break]",
			"Remediation: reset circuit breaker 29-63/A @ Sector 2[roman type][paragraph break]";
	else if the green circuit breaker is switched off:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Diagnosis: Something[line break]",
			"Remediation: something[roman type][paragraph break]"; [ todo]
	else if S1H1 is not closed:
		say "[fixed letter spacing]Pod bay locked down[line break]",
			"Secure ceiling hatch[roman type][paragraph break]";
	else:
		say "The status display glows green."

Section 2 - Pod Bay

There is a room called Pod Bay. Pod Bay is in Underneath.

A door called the pod bay hatch is port from Pod Control and starboard from Pod Bay. It is closed and locked. "[if the player is in Pod Control][pod-bay-hatch-pc][otherwise][pod-bay-hatch-pb][end if]."

To say pod-bay-hatch-pc:
	say "Beside the [if pod bay hatch is open]open[otherwise]secured[end if] port hatch, a status display [if pod bay is ready]glows green[otherwise]shows an error message[end if]"
	
To say pod-bay-hatch-pb:
	say "A [if pod bay hatch is open]open[otherwise]secured[end if] hatch leads starboard"

Every turn when the player is in Pod Bay: [todo]
	say "SInce the game isn't finished, here's some text: You notice that there are no pods left. You despair. But then you find the communications system and call for help. Someone comes."; [todo]
	end the story saying "...you have won".
		
Every turn when the player is in Pod Control:
	if the pod bay is ready:
		now the pod bay hatch is unlocked;
	otherwise:
		now the pod bay hatch is locked.

Chapter 2 - Sector 2

Sector 2 is spinward from Sector 1. It is in Main Level. "A deep pond serves as part of the water filtration system and for raising fish." It has printed name "Sector 2: Aquaculture". It has destination name "sector 2".

The pond is scenery in sector 2. It has description "Something to do with water filtration, and there are still some fish." Understand "water" and "deep" as the pond.

Some fish are scenery in sector 2. They have description "There are still a few fish swimming in the pond, but they taste horrible."

Instead of doing anything other than examining to the fish:
	say "The fish aren't easy to catch."

Instead of drinking the pond, say "It's a bit fishy for that."

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
	otherwise:
		say "You can't hold your breath long enough to make that worthwhile."

Chapter 3 - Sector 3

Sector 3 is spinward from Sector 2. It is in Main Level. "Trees, a house, and a church. A red pylon stretches up from the ground to the hub of the station." It has printed name "Sector 3: Forest". It has destination name "sector 3".

A pylon called S3P1 is here. It has description "Made of smooth metal, anodized red, it connects the ground to the hub of the station about 25 meters above." Understand "red" as S3P1.

Instead of climbing S3P1:	
	 if the player is wearing the gravity boots:
		say "It isn't easy, but with the boots, you are able to climb towards the hub.";
		now the player is in center platform;
	otherwise:
		say "The red pylon is designated for climbing, but you still can't get a grip.";
		stop the action.

S3B1 is scenery in Sector 3. It is privately-named. It has description "A small white building with a steeple." It has printed name "the church". Understand "church" and "steeple" and "small" and "white" and "building" as S3B1. [todo]

Instead of entering S3B1, move the player to Church.

S3B2 is scenery in Sector 3. It is privately-named. It has description "What looks like whitewashed siding is really a lightweight plastic." It has printed name "the house". Understand "whitewashed" and "siding" and "lightweight" and "plastic" and "house" as S3B2.

Instead of entering S3B2, move the player to House.

Inside of Sector 3 is nowhere.

Instead of going nowhere from sector 3 when the noun is inside:
	say "You can enter the church or the house."
	

There is a forest in Sector 3.
	
Section 1 - Church

Church is a room. "Before everyone left or died, you celebrated every sabbath here."

Sector 3 is outside of Church.

An altar is a fixed in place supporter in church. "The altar stands against the far wall." It has description "Really just a table now."

The Founder's Testament is on the altar. It has description "The Founder's Testament tells the story of how your people left Old Earth and first settled the station. You know the story by heart, and have already derived whatever comfort you can from this book." It has indefinite article "The". Understand "book" and "bible" as testament.

Section 2 - House

House is a room. "Two families lived here, but not recently." [todo]

Sector 3 is outside of house.

Section 3 - Center Platform

Sector 3 is down from Center Platform. Nothing is up from Sector 3. Center Platform has description "It's a mesh platform a little below the hub. From here, you are very aware of how the station rotates, but everything is okay as long as you don't look down."

Before going down from Center Platform:
	if the player is wearing the gravity boots:
		say "You climb down the pylon.";
	otherwise:
		say "You slide down the pylon."

A red circuit breaker is a circuit breaker in center platform. "You can just reach a red circuit breaker on the hub."

After dropping something (called s) in Center Platform:
	say "You drop [the s] and it spirals off the the ground below.";
	let r be a random room in the Main Level;
	now s is in r.

Chapter 4 - Sector 4

Sector 4 is spinward from Sector 3. It is in Main Level. "Your home is here among the crops." It has printed name "Sector 4: Crops". It has destination name "sector 4".

S4B1 is a building. It is inside of Sector 4. It is scenery. It has description "You were told it was built to look like a log cabin on Old Earth." It has printed name "your home". Through it is Home. Understand "home" or "house" as S4B1.

Some vegetables are scenery in Sector 4. They have description "Greens, carrots, and potatoes." Understand "crops" and "greens" and "carrots" and "potatoes" as some vegetables.

Instead of eating some vegetables, say "You're not hungry."

Section 1 - Home

Home is a room. "The room where you've slept your entire life. You can go out towards the crops."

Sector 4 is outside of home.

The player is in Home.

Section 2 - Cellar

S4H1 is a floor hatch. It is down from Home and up from Cellar.

Cellar is in Underneath. "This space is used for storage and as a decompression shelter."

An emergency mask is in cellar. "There is an emergency mask hanging on the wall." It has description "You wore a mask like this when there were decompression drills every ten days." It is wearable.

Chapter 5 - Sector 5

Sector 5 is spinward from Sector 4. It is in Main Level. "A pylon stretches up from among a group of trees to the hub of the station." It has printed name "Sector 5: Forest". It has destination name "sector 5".

S5B1 is a building. "The school house is nestled among the trees." It is inside of sector 5. It has description "Little and red, the traditional markings of a school building." It has printed name "the school building". Through it is School. Understand "school" and "house" as S5B1.

There is a pylon in Sector 5.
There is a forest in Sector 5.

Section 1 - School

School is a room. "You had learning machines once. After they broke, some of the older farmers took turns leading the class, eventually just you, in lessons."

Sector 5 is outside of school.

A desk is a fixed in place supporter in the school. It has description "You wrote your lessons at this desk. Your people were practical, plain folk, so you learned practical things in school: reading, writing, arithmetic. More importantly, practical mechanics and farming."

A chalkboard is fixed in place in the school. "There is a chalkboard on the wall." Understand "chalk board" and "blackboard" and "black board" and "board" as chalkboard. The chalkboard can be cleaned or smudged or written. It is written. It has description "[if the chalkboard is cleaned]The board is perfectly blank.[else if the chalkboard is written]The board is covered in your old arithmetic work.[else]The board is covered in smudges.[end if]". Understand "smudges" as chalkboard when the chalkboard is smudged. Understand "arithmetic" and "work" as the chalkboard when the chalkboard is written. Understand "wall" as the chalkboard.

An eraser is on the desk. The eraser can be clean or dusty. It is clean. Understand the clean property as describing the eraser. It has description "A [if the eraser is dusty]dusty[otherwise]clean[end if] eraser." It has printed name "[if the eraser is dusty]dusty[otherwise]clean[end if] eraser"

Instead of rubbing the chalkboard:
	if the chalkboard is cleaned:
		say "The chalkboard is already clean.";
	otherwise if the chalkboard is smudged:
		say "You smudge the smudges around.";
	otherwise:
		now the chalkboard is smudged;
		say "You smudge the writing around."

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

Sector 6 is spinward from Sector 5. It is in Main Level. "Your people prefered to grow things the old fashioned way, but in truth the majority of your fruit and vegetables came from this sector when the machines still worked." It has printed name "Sector 6: Hydroponics". It has destination name "sector 6".

Hydroponics machines are scenery in Sector 6. It has description "You were thoroughly trained in hydroponics maintenance, but fixing these machines is beyond you." Understand "machine" and "machinery" as hydroponics machines.

Instead of doing anything other than examining to the hydroponics machines:
	say "The hydroponics machines are just so much junk."


Section 1 - Below Sector 6

There is a room called Below Sector 6. "There's nothing distinctive about this small room. You can go up or spinward." It is in Underneath.

S6H1 is a floor hatch. S6H1 is down from Sector 6 and up from Below Sector 6.


Section 2 - The Supply Vault

[ TODO: better cluing of the laser. ]

The Supply Vault is spinward from the room called Below Sector 6. "This room is dim, quiet, and stuffy. There is still a crate of machine parts left. The only exit is antispinward.[if laser is visible][paragraph break]You see a laser beam scan across the exit.[end if]"

A pair of gravity boots is in the supply vault. The gravity boots are wearable. They are plural-named. They have description "Black work boots with red stripes. They don't really make gravity, but they do stick to some maintenance walkways to help workers get around in low gravity or on the outside of a rotating station." [ todo -- another way to practice ]

A crate of machine parts is scenery in the supply vault. It has description "These remaining parts never seem to fit where they might be useful."

Instead of searching the crate of machine parts, say "Many miscellaneous parts, none useful."

Before doing something other than searching or examining to the crate of machine parts:
	say "That's just scenery." instead. [todo]

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

Sector 7 is spinward from Sector 6. It is in Main Level. "There are pens left from when this was the livestock sector, but no animals. A pylon stretches up from the ground to the hub of the station." It has printed name "Sector 7: Livestock". It has destination name "sector 7".

Some pens are scenery in Sector 7. They have description "There are no animals left."

Instead of doing anything other than examining to the hydroponics machines:
	say "The pens are just so much junk."

There is a pylon in Sector 7.

Chapter 8 - Sector 8 

Sector 8 is spinward from Sector 7 and antispinward from Sector 1. It is in Main Level. "You still maintain the crops here, and there is a small graveyard." It has printed name "Sector 8: Crops". It has destination name "sector 8".

Some crops are scenery in Sector 8. They have description "You are proud of the grain and legumes." Understand "grain" and "legumes" as some crops.

The graveyard is scenery in Sector 8. It has description "Fenced off but unmarked graves. You buried your parents here." Understand "graves" and "grave" and "fence" as the graveyard.

[todo ... various insteads? ]

Instead of eating some crops, say "You're not hungry."

[]