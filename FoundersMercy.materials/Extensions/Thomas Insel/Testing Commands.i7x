Version 1 of Testing Commands by Thomas Insel begins here.

"A few commands I use."

Use authorial modesty.

Section 1 - Commands - Not for Release

Understand "* [text]" as commenting on the transcript.
Commenting on the transcript is an action out of world applying to a topic.
Carry out commenting on the transcript: say "(Noted.)"

Understand "listobj" as listing objects.
Listing objects is an action out of world.

Carry out listing objects:
	let L be the list of things;
	sort L in printed name order;
	repeat with item running through L:
		say "[item][if item is fixed in place] (F)[end if][if item is scenery] (S)[end if][if item is part of something] (P)[end if][line break]"

Understand "rtree" as listing the tree.
Listing the tree is an action out of world.

Carry out listing the tree:
	let room list be the list of rooms;
	sort room list in printed name order;
	repeat with r running through room list:
		say "[bold type][r][roman type][line break]";
		repeat with item running through things in r:
			if item is a door, next;
			if item is a backdrop, next;
			say "    [if item is fixed in place or item is scenery][italic type][end if][item][roman type]";
			if item encloses a thing:
				let L1 be the list of things which are enclosed by item;
				let L2 be the list of things which are part of item;
				remove L2 from L1;
				sort L1 in printed name order;
				sort L2 in printed name order;
				say " ";
				unless L1 is empty, say "+ [L1] ";
				unless L2 is empty, say "& [L2]";
			say "[line break]";
	say "[bold type](Nowhere)[roman type][line break]";
	let L be the list of things that are nowhere;
	sort L in printed name order;
	repeat with item running through L:
		say "    [item][line break]";

Testing Commands ends here.

---- Documentation ----


