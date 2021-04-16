"Graphics Challenge" by Leopold Tal

Include Glulx Image Centering by Emily Short.

The story headline is "An IF Challenge".
The story genre is "Other".
The release number is 1.
The story description is "This challenge is simple: just find a picture of something, and display it as part of the response to examining something."
The story creation year is 2021.

Section 1 - The challenge

Illustrating relates a figure name (called the illustration) to a thing. The verb to illustrate means the illustrating relation.

Pretty-displaying something is an activity on figure names.

For pretty-displaying a figure name (called the picture):
	if the Glulx resource ID of the picture is not 0:
		display the picture centered;
		say line break.

Displaying the illustration of something is an activity on things.

For displaying the illustration of something (called the exhibit):
	let the picture be the illustration of the exhibit;
	carry out the pretty-displaying activity with the picture.

Report examining something:
	carry out the displaying the illustration activity with the noun.

Section 2 - An example

There is a room called the Frankly Rather Tedious Implementation of a Room.

The table is in the Tedious Implementation.
The description of the table is "A rectangular chipboard table, with brown veneer. It's slightly wobbly."
Figure of Table is the file "table.png" ("The brown table stands in the corner"). Figure of Table illustrates the table.

The window is in the Tedious Implementation. The window can be openable. The window can be open. The window is openable and closed.
The description of the window is "This window offers a view of nothing in particular."
Figure of Closed Window is the file "window_closed.png" ("The window is closed"). Figure of Closed Window illustrates the window.
Figure of Open Window is the file "window_open.png" ("The window is open").
For displaying the illustration of the open window:
	carry out the pretty-displaying activity with the Figure of Open Window.

The description of yourself is "You probably look like this:".
Figure of Me is the file "me.png" ("A stick figure"). Figure of Me illustrates yourself.

The nondescript unillustrated doodad is in the Tedious Implementation. The description of the doodad is "Very nondescript and thoroughly unillustrated."

Test me with "x me / x table / x doodad / x window / open it / x it".
