information
roots: aNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 20/4/99 "
	| pol roots x rootFinder |
	rootFinder := DhbNewtonZeroFinder new.
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