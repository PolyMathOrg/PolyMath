mathematical functions
sqrt
	"Answer the square root of the receiver."

	| decimalPlaces n norm guess previousGuess one stopIteration |
	self negative 
		ifTrue: 
			[^ DomainError signal: 'sqrt undefined for number less than zero.'].
	self isZero ifTrue: [^self].

	"use additional bits"
	decimalPlaces := nBits + 16.
	n := self asArbitraryPrecisionFloatNumBits: decimalPlaces.
	
	"constants"
	one := n one.

	"normalize n"
	norm := n exponent quo: 2.
	n := n timesTwoPower: norm * -2.

	"Initial guess for sqrt(1/n)"
	previousGuess := self class 
				mantissa: 3
				exponent: -2 - (n exponent quo: 2)
				nBits: decimalPlaces.
	guess := previousGuess copy.

	"use iterations x(k+1) := x*( 1 +  (1-x*x*n)/2) to guess sqrt(1/n)"
	
	[guess inPlaceMultiplyNoRoundBy: guess.
	guess inPlaceMultiplyBy: n.
	guess inPlaceNegated.
	guess inPlaceAddNoRound: one.

	"stop when no evolution of numBits + 12 first bits"
	stopIteration := guess isZero or: [guess exponent < (decimalPlaces - 4) negated].
	guess inPlaceTimesTwoPower: -1.
	guess inPlaceAddNoRound: one.
	guess inPlaceMultiplyNoRoundBy: previousGuess.
	guess negative ifTrue: [guess inPlaceNegated].

	guess isZero or: [stopIteration]] 
			whileFalse: 
				[guess round.
				previousGuess inPlaceCopy: guess].

	"multiply by n and un-normalize"
	guess inPlaceMultiplyBy: n.
	guess inPlaceTimesTwoPower: norm.
	^guess asArbitraryPrecisionFloatNumBits: nBits