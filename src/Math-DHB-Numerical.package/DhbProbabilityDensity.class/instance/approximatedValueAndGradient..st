information
approximatedValueAndGradient: aNumber
		"Private - gradients an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber.
		 The gradient is computed by approximation.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| delta parameters dp gradient n |
	parameters := self parameters.
	n := parameters size.
	dp := self value: aNumber.
	delta := Array new: n.
	delta atAllPut: 0.
	gradient := DhbVector new: n.
	1 to: n do:
		[ :k |
		  delta at: k put: ( parameters at: k) * 0.0001.
		  self changeParametersBy: delta.
		  gradient at: k put: ( ( ( self value: aNumber) - dp) / ( delta at: k)).
		  delta at: k put: ( delta at: k ) negated.
		  k > 1
			ifTrue: [ delta at: ( k - 1) put: 0].
		].
	self changeParametersBy: delta.
	^Array with: dp with: gradient