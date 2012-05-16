information
hasBracketingPoints
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	| x1 |
	x1 := ( bestPoints at: 1) position.
	^( ( bestPoints at: 2) position - x1) * (( bestPoints at: 3) position - x1) < 0