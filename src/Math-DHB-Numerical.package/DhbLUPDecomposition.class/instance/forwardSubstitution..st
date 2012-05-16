transformation
forwardSubstitution: anArray
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	| n sum answer|
	answer := permutation collect: [ :each | anArray at: each].
	n := rows size.
	2 to: n do:
		[ :i |
		  sum := answer at: i.
		  1 to: ( i - 1) do: [ :j | sum := sum - ( ( ( rows at: i) at: j) * ( answer at: j))].
		  answer at: i put: sum.
		].
	^answer