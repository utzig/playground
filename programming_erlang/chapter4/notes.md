# Modules

	%% modules header
	-module(geometry).
	-export([area, perimeter]).

	%% compile
	c(geometry).

	%% call
	geometry:xxx().

# Funs

	Double = fun(X) -> 2*X end.

# List comprehensions

	%% returns a list where each element of list L is
	%% multiplied by 2.
	[2*X || X <- L].

# Guards

	max(X, Y) when X > Y -> X;
	max(X, Y) -> Y.

# Guard predicates

	is_atom(X) is_binary(X) is_constant(X) is_float(X) is_function(X)
	is_function(X, N) is_integer(X) is_list(X) is_map(X) is_number(X)
	is_pid(X) is_pmod(X) is_port(X) is_reference(X) is_tuple(X)
	is_record(X, Tag) is_record(X, Tag, N)

# Guard built-in functions

	abs(X) byte_size(X) element(N, T) float(X) hd(L) length(L)
	node() node(X) round(X) self() size(X) trunc(X) tl(L) tuple_size(T)

# Case

	case Expression of
		Pattern1 [when Guard1] -> Expr_seq1;
		Pattern2 [when Guard2] -> Expr_seq2;
		Pattern3 [when Guard3] -> Expr_seq3
	end

# If

	if
		Guard1 -> Expr_seq1;
		Guard2 -> Expr_seq2;
		Guard3 -> Expr_seq3
	end
