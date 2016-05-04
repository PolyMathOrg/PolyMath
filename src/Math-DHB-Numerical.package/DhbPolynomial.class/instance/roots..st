information
roots: aNumber

	| pol roots x rootFinder |
	rootFinder := PMNewtonZeroFinder new.
	rootFinder desiredPrecision: aNumber.
	pol := self class coefficients: ( coefficients reverse collect: [ :each | each asFloat]).
	roots := OrderedCollection new: self degree.
	[ rootFinder setFunction: pol; setDerivative: pol derivative.
	  x := rootFinder evaluate.
	  rootFinder hasConverged
		] whileTrue: [ roots add: x. 
					   pol := pol deflatedAt: x. 
					   pol degree > 0
						 ifFalse: [ ^roots].
					 ].
	^roots