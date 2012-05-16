operation
inverse2By2
		"Private - Answer the inverse of the receiver when it is a 2x2 matrix (no check is made).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/5/99 "
	| line1 line2 |
	line1 := DhbVector with: ((rows at: 2) at: 2) with: ((rows at: 1) at: 2) negated.
	line2 := DhbVector with: ((rows at: 1) at: 2) negated with: ((rows at: 1) at: 1).
	^self class rows: ( DhbVector with: line1 with: line2) * (1 / (((rows at: 1) at: 1) * ((rows at: 2) at: 2) - ((rows at: 1) at: 2) squared))