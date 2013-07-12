## The commandments

### The First Commandment

When recurring on a list of atoms, _lat_, ask two questions about it:
(_null? lat_) and else.

When recurring on a number, _n_, ask two questions about it:
(_zero? n_) and else.

### The Second Commandment

Use _cons_ to build lists.

### The Third Commandment

When building a list, describe the first typical element, and
then _cons_ it onto the natural recursion.

### The Fourth Commandment (preliminary)

Always change at least one argument while recurring. It must be
changed to be closer to termination. The changing argument must
be tested in the termination condition:

when using _cdr_, test termination with _null?_.
