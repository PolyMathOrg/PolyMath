operation
computeInitialValues

	[ bestPoints size  > 3] whileTrue: [ bestPoints removeLast].
	bestPoints size = 3
		ifTrue: [ self hasBracketingPoints
					ifFalse:[ bestPoints removeLast].
				].
	bestPoints size < 3
		ifTrue: [ ( DhbOptimizingBracketFinder forOptimizer: self) evaluate]