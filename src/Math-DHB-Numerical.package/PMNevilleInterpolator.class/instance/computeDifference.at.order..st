private
computeDifference: aNumber at: anInteger1 order: anInteger2
	
	| leftDist rightDist ratio |
	leftDist := ( self xPointAt: anInteger1) - aNumber.
	rightDist := (  self xPointAt: ( anInteger1 + anInteger2)) - aNumber.
	ratio := ( ( leftErrors at: ( anInteger1 + 1)) - ( rightErrors at: anInteger1)) / ( leftDist - rightDist).
	leftErrors at: anInteger1 put: ratio * leftDist.
	rightErrors at: anInteger1 put: ratio * rightDist.