"Candelabra Challenge" by Leopold Tal

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "A non-portable candelabra with five candles attached to it. The description of the candelabra itself is a succinct summary of candles' lit/unlit status, with an emphasis on what's lit."
The story creation year is 2021.

The Chamber is a room. "The sole feature of this dim chamber is an immense brass [candelabra] welded to the floor."

A candle is a kind of thing. A candle can be lit or unlit. The description of a candle is usually "[The item described] is [if lit]lit[otherwise]unlit[end if]."

The first candle, the second candle, the third candle, the fourth candle, and the fifth candle are candles.
Understand "1" and "one" as the first candle. Understand "2" and "two" as the second. Understand "3" and "three" as the third. Understand "4" and "four" as the fourth. Understand "5" and "five" as the fifth. [FIXME: numbers are misinterpreted in multi-object commands]

The candelabra is in the Chamber. It is fixed in place. Understand "brass" and "immense" and "chandelier" as the candelabra. All candles are part of the candelabra.

[FIXME: Understand "all/-- of/-- the/-- candles" as the candelabra.]

The description of the candelabra is "The candelabra has [number of candles which are part of the candelabra in words] slim white candles. [lit-status of the candelabra]."

To say lit-status of (base - a thing):
	let nb-lit be the number of lit candles which are part of base;
	let nb-unlit be the number of unlit candles which are part of base;
	if nb-unlit is less than nb-lit:
		if nb-unlit is 0:
			say "All of them are lit";
		otherwise:
			let unlit-cierges be the list of unlit candles which are part of base;
			say "Most of them are lit except [candle-list of unlit-cierges]";
	otherwise:
		if nb-lit is 0:
			say "None of them are lit";
		otherwise:
			let lit-cierges be the list of lit candles which are part of base;
			say "Only [candle-list of lit-cierges] [are] lit".

To say candle-list of (cierges - a list of candles):
	let n be the number of entries in cierges;
	let listed be "[cierges]";
	replace the text " candle" in listed with "";
	say "the [listed] candle[if n is not 1]s[end if]".

Understand "burn [things]" as burning.

The block burning rule does nothing when the noun is a candle.

To light is a verb.
Carry out burning when the noun is a candle:
	if the noun is lit:
		say "[The noun] [are] already lit.";
	otherwise:
		say "[We] [light] [the noun].";
	now the noun is lit.

Instead of burning the candelabra:
	if an unlit candle is part of the candelabra:
		say "[We] [light] all the candles.";
	otherwise:
		say "All the candles are already lit.";
	now every candle which is part of the candelabra is lit.

Extinguishing is an action applying to one thing. Understand "extinguish [things]" as extinguishing. Understand the command "blow" as "extinguish". Understand "put out [things]" as extinguishing.

Check extinguishing when the noun is not a candle:
	say "[The noun] [are], fortunately, not on fire."

To extinguish is a verb.
Carry out extinguishing when the noun is a candle:
	if the noun is unlit:
		say "[The noun] [are] already unlit.";
	otherwise:
		say "[We] [extinguish] [the noun].";
	now the noun is unlit.

Instead of extinguishing the candelabra:
	if a lit candle is part of the candelabra:
		say "[We] [extinguish] all the candles.";
	otherwise:
		say "All the candles are already unlit.";
	now every candle which is part of the candelabra is unlit.

Test me with "x / light 1 / x / light 3 / x / light 5 / x / light 4 / x / light / x / blow first and fifth / x".
