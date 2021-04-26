"Lift Challenge" by Leopold Tal

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "In this challenge, reproduce the elevator in Hero Inc Part One by Nate Cull. Code up the lift car and the four locations that it can connect to. You'll also need to code up a keypad and a display inside the lift car, and a plaque in the lobby. But otherwise, let's keep this simple: don't worry about doors or call buttons; assume the elevator is always open at whichever floor it's on."
The story creation year is 2021.

Debugging is always false.

To debug (T - text):
	if debugging is true:
		say "DEBUG: [T][line break]".

Section 1 - Main rooms

A thing can be omitted. An omitted thing is usually scenery.
An omission is a kind of thing. An omission is always omitted.
Instead of doing something when the noun is omitted:
	say lazy excuse for the noun.
Instead of doing something when the second noun is omitted:
	say lazy excuse for the second noun.
To say lazy excuse for (plot hole - a thing):
	say "Look, I'm just doing a technical challenge and I didn't feel like implementing [a plot hole]."

Post Office Tower is a region.
Before printing the name of a room in Post Office Tower:
	say "Post Office Tower, ".

The Lobby is a room. "You are in the shining new ground-floor lobby of the Post Office Tower. The sheer size and architectural elegance of this room takes your breath away. A [plaque] is mounted on the [north wall], next to the lift doors (which are open). The [grand entrance doors] to the south lead back out to the street." The Lobby is in Post Office Tower.

Instead of going south in the Lobby:
	say "Ok, I didn't actually implement that part."
The north wall is an omission in the Lobby. The grand entrance doors are a plural-named omission in the Lobby.

The plaque is scenery in the Lobby. The description of the plaque is "[plaque-description]".

Floor 3 is a room. "This large, bustling room must be the new Post Office. A steady flow of [customers] make their way up to the [counter], where a [lone mail clerk] stands ready to serve them. The sleek, ultra-modern lift opens to the north." Floor 3 is in Post Office Tower.

The lone mail clerk is an omitted man in Floor 3. The customers are some omitted people in Floor 3. The counter is an omission in Floor 3.

Floor 8 is a room. "The Fairhaven Savings & Investment Bank has a much more sober and reserved atmosphere than the rest of the Post Office Tower. Expensively-dressed [Assistant Branch Managers] stride around making important decisions, and ignoring you. A [cash-card machine] on one wall offers instant withdrawals, and the sleek, ultra-modern lift opens to the north." Floor 8 is in Post Office Tower.

Some Assistant Branch Managers are omitted men in Floor 8. The cash-card machine is an omission in Floor 8.

Observation Deck is a room. "You are standing on the roof of the fifteen-storey Post Office Tower, with a [breathtaking view of the entire town of Fairhaven]. A [guardrail] on the edge is all that stands between you and the [Post Office Park] far below. High-altitude [winds] buffet you as you peer over. The lift doors (open) to the north are the only way down." Observation Deck is in Post Office Tower.

The breathtaking view of the entire town of Fairhaven, the guardrail, the Post Office Park, and some winds are omissions in Observation Deck.

Section 2 - The lift

Table of Lift Destinations
floor	description	room
1	"Lobby"	Lobby
3	"Post Office"	Floor 3
8	"Fairhaven Bank"	Floor 8
15	"Observation Deck"	Observation Deck

To say plaque-description:
	say "WELCOME TO THE POST OFFICE TOWER";
	say paragraph break;
	repeat with N running from 1 to the number of rows in the Table of Lift Destinations:
		choose row N in the Table of Lift Destinations;
		say "Floor [padded floor entry] ........... [description entry]";
		say line break;
	say line break;
	say "All other floors are off-limits to the public.[no line break]"

To say padded (N - number):
	if N < 10:
		say " ";
	say N.

The current floor is a number that varies.

The Lift Car is a room. "You are in the Post Office Tower's sleek, ultra-modern lift car. Beside the doors to the south (currently open) is a sleek, futuristic [keypad] and [display]."

The keypad is in the Lift Car. It is fixed in place. The description of the keypad is "It's such a very new and modern calculator-style keypad that you're not entirely sure how to use it. (You suspect, though, that you can TYPE ON THE KEYPAD to make the lift go to a floor.)".

The display is in the Lift Car. It is fixed in place. The description of the display is "It shows the number [current floor]."

The inside lift doors are scenery in the Lift Car. Understand "door" as the inside lift doors.
The description of the inside lift doors is "The doors out of the lift are open."
Instead of entering inside lift doors:
	try going outside.

The outside lift doors are a backdrop in Post Office Tower. Understand "door" as the outside lift doors.
The description of the outside lift doors is "The doors to the lift are open."
Instead of entering outside lift doors:
	try going inside.

Floor-selecting it on is an action applying to one number and one thing. Understand "type [number] on the/-- [something]" and "push [number] on the/-- [something]" as floor-selecting it on.

Understand "type on the/-- [something]" and "push on the/-- [something]" as a mistake ("You should probably type a specific number rather than mash buttons at random.").

Does the player mean floor-selecting:
	if the second noun is the keypad:
		it is very likely;
	otherwise:
		it is very unlikely.

The floor-selecting it on action has a number called the initial floor.
Setting action variables for floor-selecting:
	now the initial floor is the current floor.

Check floor-selecting it on when the second noun is not the keypad:
	say "You poke ineffectually at [the second noun].";
	stop the action.

Check floor-selecting it on:
	if there is no room corresponding to a floor of the number understood in the Table of Lift Destinations:
		announce "That floor is off-limits to the public.";
		stop the action.

Carry out floor-selecting it on:
	lift-travel to the number understood.

Report floor-selecting it on:
	let final floor be number understood;
	debug "Initial floor: [initial floor] / Target floor: [final floor]";
	if initial floor is final floor:
		announce "You are already at that floor.";
	otherwise:
		announce "Floor [final floor] selected.";
		say "The lift accelerates briefly [if final floor is greater than initial floor]up[otherwise]down[end if]ward, then stops. With a soft bleep, the doors slide open."

To lift-travel to (target floor - a number):
	if there is a room corresponding to a floor of target floor in the Table of Lift Destinations:
		let target room be the room corresponding to a floor of target floor in the Table of Lift Destinations;
		let initial room be a random room adjacent to the Lift Car;
		debug "Initial: [current floor] ([initial room]) / Final: [target floor] ([target room])";
		now current floor is target floor;
		if initial room is not nothing:
			change north exit of initial room to nowhere;
			change inside exit of initial room to nowhere;
		change north exit of target room to Lift Car;
		change inside exit of target room to Lift Car;
		change south exit of Lift Car to target room; 
		change outside exit of Lift Car to target room;
	otherwise:
		say "BUG: Tried to travel to [target floor] but no such floor exists."

To announce (T - text):
	say "A pleasant female voice";
	if a random chance of 1 in 5 succeeds:
		say " (why is it never [one of]a pleasant male voice[or]an unpleasant female voice[or]a gruff male voice[or]a grating robotic voice[or]a high-pitched whine[or]an insolent drawl[then at random]?)[run paragraph on]";
	say " announces: '[T]'[paragraph break]"

When play begins:
	debug "Current floor: [current floor]";
	lift-travel to 1.

Test me with "x plaque / press 42 on plaque / in / press 42 / x display / press 15 / x display / s / n / press 8 / out / in / press 8 / press 3 / s".
