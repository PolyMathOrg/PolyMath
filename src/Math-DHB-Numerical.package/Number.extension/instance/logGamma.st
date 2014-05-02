*Math-DHB-Numerical
logGamma
		"Computes the log of the Gamma function (for positive numbers only)
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	^self > 1
		ifTrue: [ DhbLanczosFormula new logGamma: self]
		ifFalse:[ self > 0
						ifTrue: [ ( DhbLanczosFormula new logGamma: ( self + 1) ) - self ln ]
						ifFalse: [ ^self error: 'Argument for the log gamma function must be positive']
					]