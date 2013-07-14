## The commandments

### The First Commandment

When recurring on a list of atoms, _lat_, ask two questions about it:
_(null? lat)_ and else.

When recurring on a number, _n_, ask two questions about it:
_(zero? n)_ and else.

When recurring on a list of S-expressions, _l_, ask three questions
about it: _(null? l)_, _(atom? (car l))_, and else.

### The Second Commandment

Use _cons_ to build lists.

### The Third Commandment

When building a list, describe the first typical element, and
then _cons_ it onto the natural recursion.

### The Fourth Commandment

Always change at least one argument while recurring. When
recurring on a list of atoms, _lat_, use _(cdr lat)_. When
recurring on a number, _n_, use _(sub1 n)_. And when
recurring on a list of S-expressions, _l_, use _(car l)_ and
_(cdr l)_ if neither _(null? l)_ nor _(atom? (car l))_ are true.

It must be changed to be closer to termination. The changing
argument must be tested in the termination condition:

when using _cdr_, test termination with _null?_ and

when using _sub1_, test termination with _zero?_.

### The Fifth Commandment

When building a value with _+_, always use _0_ for the value of
the terminating line, for adding _0_ does not change the value of
an addition.

When building a value with _x_, always use _1_ for the value of
the termination line, for multiplying by _1_ does not change the
value of multiplication.

When building a value with _cons_, always consider () for the value
of the terminating line.

### The Sixth Commandment

Simplify only after the function is correct.
