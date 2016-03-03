information
randomForSmallAlpha
	"Private - Generate a random number distributed according to the receiver when alpha < 1. "

	[ true ]
		whileTrue: [ 
			| p |
			p := flatGenerator floatValue * self randomCoefficientsForSmallAlpha.
			p > 1
				ifTrue: [ 
					| y |
					y := ((self randomCoefficientsForSmallAlpha - p) / alpha) ln negated.
					flatGenerator floatValue <= (y raisedTo: alpha - 1)
						ifTrue: [ ^ y ] ]
				ifFalse: [ 
					| y |
					y := p raisedTo: 1 / alpha.
					flatGenerator  floatValue <= y negated exp
						ifTrue: [ ^ y ] ] ]