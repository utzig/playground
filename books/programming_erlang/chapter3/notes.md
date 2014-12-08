# Tuples

	Person = {person, {name, joe}, {height, 1.82}, {footsize, 42}, {eyecolour, brown}}.
	F = {firstName, joe}.
	L = {lastName, armstrong}.
	P = {person, F, L}.

# Extracting

	Point = {point, 10, 45}.
	{point, X, Y} = Point.

	Person = {person, {name, joe, armstrong}, {footsize, 42}}.
	{_, {_, Who, _}, _} = Person.
	Who.
	> joe

# Lists

	# If T is a list than [H|T] is also a list with head H and tail T.

	# [] is empty list.

	ThingsToBuy = [{apples, 10}, {pears, 6}, {milk, 3}].
	ThingsToBuy1 = [{oranges, 4}, {newspaper, 1} | ThingsToBuy].

# Extracting

	[Buy1 | ThingsToBuy2] = ThingsToBuy1.

	# Buy1 is H, ThingsToBuy2 is T.

# Strings

	Name = "Hello".

	# A string is a list.

	[83, 117, 114, 112, 114, 105, 115, 101].
	# "Surprise"

	# $a is the integer that represents the character 'a'.
