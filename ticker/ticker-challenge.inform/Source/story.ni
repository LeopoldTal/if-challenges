"News Ticker Challenge" by Leopold Tal

Include Basic Screen Effects by Emily Short.
Include Flexible Windows by Jon Ingold.
Include Glulx Real Time by Erik Temple.

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "This challenge is partly inspired by Earl Grey by Rob Dubbin and Allison Parrish which reserved some space at the bottom of the screen for displaying what the player-character was thinking, moving the > prompt up a bit. I want you to do something even more ambitious, and use that below-the-prompt space for a chyron of text moving slowly leftwards in real time. The text can be silly news headlines, song lyrics, or whatever you want. Have fun with it."
The story creation year is 2021.

Release along with an interpreter. [I want to test how Quixe handles this]

Section 1 - Setting the scene

Watching the Tube is a room. "It's the 24h news channel. The [anchor] is reading out today's news."

The anchor is a woman in Watching the Tube. Understand "presenter" or "newsreader" or "newscaster" or "anchorwoman" as the anchor. The description of the anchor is "She's probably famous, but you don't actually know her name. She wears her hair up in a bun. Her purple suit clashes horribly with the blue background."

The screen is scenery in Watching the Tube. Understand "blue" or "set" or "background" as the screen. The description of the screen is "The news channel shows nothing but a blue set, with the anchor in the middle."

The hair is part of the anchor. Understand "bun" or "brown" or "severe" as the hair. The description of the hair is "A severe brown bun, just as professional-looking as her suit."

The anchor wears a suit. Understand "purple" or "crips" as the suit. The description of the suit is "A crisp purple suit, just as professional-looking as her hair."

The television is scenery in Watching the Tube. "Good ol['] boob tube. It's tuned to the news." Understand "channel" or "tv" or "telly" or "boob" or "tube" as the television.

Understand "change [text]" or "tune [text]" as a mistake ("But the news is really interesting!").

Instead of switching off the television:
	say "Just five more minutes of news."

Instead of exiting:
	say "You can't tear your eyes off the news."

Instead of going nowhere:
	say "What, and leave the telly on?"

Section 2 - The news

The news is scenery in Watching the Tube. The description of the news is "[breaking-news]".

Instead of switching off the news:
	try switching off the television.

Instead of listening to the news:
	try examining the news.
Instead of listening to Watching the Tube:
	try examining the news.

To say breaking-news:
	say "[one of][or]BREAKING: [or]NEWS FLASH: [or]ALERT: [or]URGENT: [or]BULLETIN: [as decreasingly likely outcomes]";
	say "[one of]Prime Minister[or]President[or]King[or]Queen[or]Senator[or]Movie star[or]Nobel laureate[or]Curling champion[or]Schoolchild[or]Escaped llama[at random] ";
	say "[one of]resigns[or]declares war[or]receives Nobel prize[or]elopes[or]caught in sex scandal[or]dislikes broccoli[or]elected President[or]will run for president[or]on the run[or]voted most likely to succeed[at random] ";
	say "[one of]amid[or]after[or]following[at random] ";
	say "[one of]accusations of cheating at Go Fish[or]naughty pictures[or]new movie[or]by-elections[or]historic polling lows[or]Hollywood triumph[or]online petitions[or]hostilities[or]cheese adverts[at random].[no line break]".

Section 3 - The ticker

The ticker is a text buffer g-window. The main window spawns the ticker. The position of the ticker is g-placebelow. The scale method of the ticker is g-fixed-size. The measurement of the ticker is 2. [Should fit on one line, but avoid descenders causing "More" message] The background color of the ticker is "#FFAAFF".

The ticker-buffer is some text that varies. The ticker-buffer is initially "tching news 'waste of time', say experts."
The ticker-contents is some text that varies. The ticker-contents is initially "".

[Hilariously hackish guess at the best length for the ticker]
To decide what number is the ticker-length:
	let N be the screen width;
	if N is greater than 500: [assume the size is reported in pixels if it's too big]
		now N is N divided by 7;
	decide on N times 8 divided by 10. [leave a little leeway depending on interpreter quirks]

To add news to the ticker-buffer:
	let padded be the ticker-buffer;
	while the number of characters in padded is less than the ticker-length:
		now padded is "[padded] | [breaking-news]";
	now the ticker-buffer is padded.

To decide what text is the truncation of (S - text) to (N - number) characters:
	if S matches the regular expression "^.{0,[N]}":
		decide on text matching regular expression;
	otherwise:
		say "BUG: [S] did not match an expression that should match anything."

[Compute the ticker text in advance to avoid flicker between clearing and printing]
To set ticker-contents:
	let N be the ticker-length;
	now ticker-contents is the truncation of the ticker-buffer to N characters.

To rotate the ticker-buffer:
	let snipped be the ticker-buffer;
	replace character number 1 in snipped with "";
	now the ticker-buffer is snipped;
	add news to the ticker-buffer.

When play begins:
	say "The screen width is [screen width]. Targeting length [ticker-length].";
	add news to the ticker-buffer;
	open the ticker;
	every 300 milliseconds follow the ticker scrolling rule.

This is the ticker scrolling rule:
	set ticker-contents;
	refresh the ticker;
	rotate the ticker-buffer.

Rule for refreshing the ticker:
	say "[fixed letter spacing][ticker-contents]";
	focus the main window.
