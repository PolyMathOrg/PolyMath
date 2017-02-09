*Math-DHB-Numerical
gamma
		"Compute the Gamma function for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^ self > 1
		ifTrue: [ ^ PMLanczosFormula new gamma: self]
		ifFalse:[ self < 0
						ifTrue: [ Float pi / ( ( Float pi * self) sin * ( 1 - self) gamma)]
						ifFalse:[ ( PMLanczosFormula new gamma: ( self + 1)) / self]
					]