information
computeDifference: aNumber at: anInteger1 order: anInteger2
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 28/5/99 "
	| leftDist rightDist ratio |
	leftDist := ( self xPointAt: anInteger1) - aNumber.
	rightDist := (  self xPointAt: ( anInteger1 + anInteger2)) - aNumber.
	ratio := ( ( leftErrors at: ( anInteger1 + 1)) - ( rightErrors at: anInteger1)) / ( leftDist - rightDist).
	leftErrors at: anInteger1 put: ratio * leftDist.
	rightErrors at: anInteger1 put: ratio * rightDist.