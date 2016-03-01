operation
productWithVector: aVector
	"Answers the scalar product of aVector with the receiver."
	| n |
	n := 0.
	^self inject: 0
			into: [ :sum :each | n := n + 1. (aVector at: n) * each + sum]