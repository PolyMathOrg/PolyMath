Extension { #name : #Float }

{ #category : #'*Math-CompatibilityUpToPharo11' }
Float class >> machineEpsilon [
	"Answer the machine epsilon or macheps, defined by wikipedia asCalypsoItemContext
	https://en.wikipedia.org/wiki/Machine_epsilon

	*an upper bound on the relative approximation error due to rounding in floating point arithmetic*

	Compute it as the difference between 1.0 and previous representable value"

	^1.0 timesTwoPower: 1 - self precision
]
