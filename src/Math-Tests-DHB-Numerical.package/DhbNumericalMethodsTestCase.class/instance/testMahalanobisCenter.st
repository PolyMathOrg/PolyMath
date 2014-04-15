data mining
testMahalanobisCenter
	"Code example 12.5"
	| center distance|
	center := DhbMahalanobisCenter new: 3.
	#( 
			(1 2 3)
			( 2 3 4)
			( 1 3 2)
			( 4 3 1)
			( 1 3 1)
			( 1 4 2)
			( 3 1 2)
			( 3 4 2)
		)
	do: [ :x | center accumulate: x asDhbVector].
	center computeParameters.
	distance := center distanceTo: #(1 2 3) asDhbVector.
	self should: [ distance equalsTo: 2.26602282704126].