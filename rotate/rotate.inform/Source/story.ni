"Rotating House Challenge" by Leopold Tal

Include Easy Doors by Hanon Ondricek.

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "Code up the white house from Infocom's Zork I and the four plots of land around it. In the attic, add a turnable wheel mounted in the floor. Whenever the player-character turns the wheel, the entire house rotates 90°, changing all directional travel inside the house and where the front and back doors connect to."
The story creation year is 2021.

Section 1 - Rotations

The list of house orientations is a list of directions that varies. The list of house orientations is { west, north, east, south }.

Fore is a direction that varies.
To decide what direction is aft:
	decide on the opposite of fore.

To orient the house:
	now fore is entry 1 of the list of house orientations;
	let front be the room corresponding to a direction of fore in the Table of Outdoors;
	move the outside front door to front;
	now the inside front door leads to front;
	let back be the room corresponding to a direction of aft in the Table of Outdoors;
	move the outside back door to back;
	now the inside back door leads to back.

When play begins:
	orient the house.

To say closure of (D - an easydoor):
	if D is open:
		say "open";
	otherwise:
		say "closed".
To say a closure of (D - an easydoor):
	if D is open:
		say "an open";
	otherwise:
		say "a closed".

Section 2 - Outdoors

There is a room called West of House. "[outdoor-description of West of House]".
There is a room called North of House. "[outdoor-description of North of House]".
There is a room called East of House. "[outdoor-description of East of House]".
There is a room called South of House. "[outdoor-description of South of House]".

The room called West of House is southwest of the room called North of House. The room called North of House is northwest of the room called East of House. The room called East of House is northeast of the room called South of House. The room called South of House is southeast of the room called West of House.

Instead of going north in West of House:
	try going northeast.
Instead of going south in West of House:
	try going southeast.
Instead of going west in North of House:
	try going southwest.
Instead of going east in North of House:
	try going southeast.
Instead of going north in East of House:
	try going northwest.
Instead of going south in East of House:
	try going southwest.
Instead of going west in South of House:
	try going northwest.
Instead of going east in South of House:
	try going northeast.

Table of Outdoors
direction	room	description
west	West of House	""
north	North of House	"To the north a narrow path winds through the trees."
east	East of House	"A path leads into the forest to the east."
south	South of House	""

The outside front door is an easydoor. It portals the inside front door. It leads to the Living Room. The printed name of the outside front door is "front door".
Instead of going aft in the presence of the outside front door:
	try entering the outside front door.

The outside back door is an easydoor. It portals the inside back door. It leads to the Kitchen. The printed name of the outside back door is "back door".
Instead of going fore in the presence of the outside back door:
	try entering the outside back door.

To say outdoor-description of (R - a room):
	let dir be the direction corresponding to a room of R in the Table of Outdoors;
	let desc be the description corresponding to a room of R in the Table of Outdoors;
	if the outside front door is in R:
		say "You are standing in an open field [dir] of a white house, with [a closure of outside front door] [outside front door]. ";
	otherwise:
		if the outside back door is in R:
			say "You are behind the white house. ";
		otherwise:
			say "You are facing the [dir] side of a white house. There is no door here, and all the windows are boarded up. ";
	if desc is not "":
		say desc;
		say " ";
	if the outside back door is in R:
		say "In one corner of the house there is [an outside back door] which is [closure of outside back door]. "

Section 3 - Indoors

The Living Room is a room. "You are in the living room. There is a doorway to [the aft], [the inside front door] to [the fore], a trophy case, and a large oriental rug in the center of the room."

The Kitchen is a room. "You are in the kitchen of the white house. A table seems to have been used recently for the preparation of food. A passage leads to [the fore] and a dark staircase can be seen leading upward. A dark chimney leads down and to [the aft] is [an inside back door] which is [closure of inside back door]."

The inside front door is an easydoor in the Living Room. The printed name of the inside front door is "front door".
Instead of going fore in the Living Room:
	try entering the inside front door.

Instead of going aft in the Living Room:
	move the player to the Kitchen.

Instead of going fore in the Kitchen:
	move the player to the Living Room.

The inside back door is an easydoor in the Kitchen. The printed name of the inside back door is "back door".
Instead of going aft in the Kitchen:
	try entering the inside back door.

The Attic is a room. "This is the attic. A [huge cast-iron wheel] is set into the floor. The only exit is a stairway leading down." It is up of the Kitchen.

The huge cast-iron wheel is in the Attic. It is fixed in place. The description of the wheel is "You could try turning it."
Instead of turning the wheel:
	say "You grab the wheel and give it a turn. There's a bit of resistance at first, then the entire room, the [italic type]entire house[roman type]! lurches and pivots ninety degrees clockwise.";
	rotate list of house orientations backwards;
	orient the house.

Test me with "n / e / s / w / e / e / u / x wheel / turn wheel / d / n / n / e / s".
