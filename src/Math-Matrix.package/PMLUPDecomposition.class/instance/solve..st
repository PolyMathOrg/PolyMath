private
solve: anArrayOrVector
	permutation isNil
		ifTrue: [ self protectedDecomposition ].
	^ permutation = 0
		ifTrue: [ nil ]
		ifFalse:[ 
			[self backwardSubstitution: ( self forwardSubstitution: anArrayOrVector)] on: ZeroDivide do: [:e|  nil] ]