information
hasBracketingPoints
		"Private"
	| x1 |
	x1 := ( bestPoints at: 1) position.
	^( ( bestPoints at: 2) position - x1) * (( bestPoints at: 3) position - x1) < 0