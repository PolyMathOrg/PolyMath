tests
testMahalanobisCenter
	"Code example 12.5"
	| center distance|
	center := PMMahalanobisCenter new: 3.
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
		do: [ :x | center accumulate: x asPMVector].
	center computeParameters.
	distance := center distanceTo: #(1 2 3) asPMVector.
	self assert:  (distance equalsTo: 2.26602282704126)