transformation
backSubstitutionAt: anInteger
		"Private - Perform the back-substitution step corresponding to the anInteger-th constant array.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| size answer accumulator |
	size := rows size.
	answer := Array new: size.
	size to: 1 by: -1 do:
		[ :n |
		  accumulator := (rows at: n) at: (anInteger + size).
		  ( n + 1) to: size
			do: [ :m | accumulator := accumulator - ( ( answer at: m) * ( ( rows at: n) at: m))].
		  answer at: n put: ( accumulator / ( ( rows at: n) at: n)).
		].
	solutions at: anInteger put: answer.