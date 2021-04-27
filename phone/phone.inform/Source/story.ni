"Phone Challenge" by Leopold Tal

Include Basic Screen Effects by Emily Short.
Include Glulx Real Time by Erik Temple.

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "Find an audio clip (or record it yourself) of a ringing phone, and have it play repeatedly (with suitable breaks) in real time until the player-character answers the phone."
The story creation year is 2021.

Release along with an interpreter.

To decide whether sound is supported: (- glk($0004, 21, 0) == 1 -).
Sound enabled is a truth state that varies. Sound enabled is initially false.

Sound of ringing phone is the file "Ring.ogg".

When play begins:
	if sound is supported:
		say "Your interpreter supports sound. Would you like to enable sounds?";
		if the player consents:
			now sound enabled is true;
		otherwise:
			now sound enabled is false;
	otherwise:
		say "Your interpreter does not support sound. Sounds will be disabled.";
		now sound enabled is false;
		wait for any key;
	clear the screen.

The Phone Booth is a room. "You're not quite sure how you managed to lock yourself into this cramped, stuffy phone booth. The grimy walls were meant to be transparent, but now they're far too filthy to see outside. You're not even sure which one is the door."

The walls are scenery in the Phone Booth. "You can't make out anything through the grime." Understand "grime" as the walls.

There is something in the Phone Booth called the door. "You rattle the walls experimentally, but can't tell where the door is." It is scenery.

Instead of touching something:
	say "Ew!"
Instead of tasting something:
	say "EWWW!"
Instead of listening:
	say "Silence."
Instead of listening when the pay phone is ringing:
	say "The phone is ringing loudly."

The pay phone is in the Phone Booth. "A (formerly blue, you think) pay phone is mounted into the wall." It is fixed in place.
The pay phone can be silent or ringing. The pay phone is silent.
The description of the pay phone is "It's so ancient, you're surprised it still occasionally works."

The ringer is a virtual timer.

Instead of examining the pay phone for the first time:
	say "As soon as you glance at it, the phone rings.";
	now the pay phone is ringing;
	follow the ringing rule;
	every 4 seconds on the ringer follow the ringing rule.

Instead of taking the pay phone when the pay phone is silent:
	say "No dial tone. The line's dead."

Instead of taking the pay phone when the pay phone is ringing:
	say "You pick up the phone. A cheerful voice begins to advertise car insurance to you, then the line cuts abruptly.";
	now the pay phone is silent;
	deactivate the ringer.

This is the ringing rule:
	say "[interrupt]Rrrrring![resume]";
	if sound enabled is true:
		play sound of ringing phone.
