information
termsAt: anInteger 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/3/99 "

	| n n2 |
	n := anInteger // 2.
	n2 := 2 * n.
	^Array with: ( n2 < anInteger 
		ifTrue: 
			[x negated * (alpha1 + n) * (alpha1 + alpha2 + n) 
				/ ((alpha1 + n2) * (alpha1 + 1 + n2))]
		ifFalse: [x * n * (alpha2 - n) / ((alpha1 + n2) * (alpha1 - 1 + n2))])
			with: 1