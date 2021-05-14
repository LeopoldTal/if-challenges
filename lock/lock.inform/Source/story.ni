"Colour Sequence Lock Challenge" by Leopold Tal

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "Code up a locked safe or strongbox with a single dial on it. Put a diamond or something inside as a prize for opening the safe.

The dial is a 'rainbow dial'. It can be set to any color of the rainbow: red, yellow, orange, green, blue, indigo, or violet. To unlock the safe, the PC must turn the dial to these four colors in sequence: green-yellow-orange-red."
The story creation year is 2021.

Section 1 - Colours

A colour is a kind of value. The colours are red, yellow, orange, green, blue, indigo, and violet.

The secret code is always { green, yellow, orange, red }.

Section 2 - Room

Roy G Biv's Vault is a room. "Finally, you're about to uncover the secrets of the rainbow — if only you can open this [safe]!" The printed name of the Vault is "Roy G. Biv's Vault".

The safe is a container in the Vault. It is fixed in place. It is closed and locked. The description of the safe is "Roy G. Biv hides his secrets in this safe, secured by a [dial] at the front. [safe-appearance]." Understand "strong" and "box" and "strongbox" as the safe.

To say safe-appearance:
	if the safe is open:
		say "The [if the safe contains nothing]empty [end if]safe hangs open[if the safe contains something], revealing [a list of objects in the safe][end if]";
	otherwise:
		say "Its door is closed ";
		if the safe is locked:
			say "and firmly locked. The lock looks very secure indeed";
		otherwise:
			say "but unlocked".

The dial is a part of the safe. Understand "door" and "front" and "lock" and "knob" and "combination" and "rainbow" and "colour" and "color" as the dial. The description of the dial is "You've heard of this: it's a rainbow dial. You can set it to [list of colours].

Right now, the dial is set to [current colour of the dial]."

Instead of opening the dial:
	try opening the safe.

The prism is in the safe. The description of the prism is "So that's where rainbows come from!"

Instead of taking the prism:
	end the story finally saying "The world shall remember your name: Isaac Newton."

Section 3 - The dial

The dial has a colour called the current colour. The current colour of the dial is indigo.
The dial has a list of colours called the current combination.
When play begins:
	add the current colour of the dial to the current combination of the dial.

Colour-setting it to is an action applying to one thing and one colour. Understand "set [something] to [colour]" as colour-setting it to.
Understand the command "turn" as something new. Understand the command "turn" as "set".

Check colour-setting it to:
	say "[The noun] can't be set to a colour."

Instead of setting the dial to:
	say "I don't recognise that colour name."

Instead of colour-setting the safe to the colour understood:
	try colour-setting the dial to the colour understood.

Instead of colour-setting the dial to the colour understood:
	if the colour understood is the current colour of the dial:
		say "You turn the dial away from [current colour of the dial] and back again.";
	otherwise:
		say "You turn the dial from [current colour of the dial] to [the colour understood].";
	now the current colour of the dial is the colour understood;
	add the colour understood to the current combination of the dial;
	let secret length be the number of entries in the secret code;
	truncate the current combination of the dial to the last secret length entries;
	if the current combination of the dial is the secret code:
		if the safe is locked:
			say "The lock pops open with a soft click.";
		otherwise:
			say "There is a soft click from the open lock.";
		now the safe is unlocked.
