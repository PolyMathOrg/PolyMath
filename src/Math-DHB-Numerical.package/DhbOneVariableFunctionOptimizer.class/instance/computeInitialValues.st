operation
computeInitialValues
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

	[ bestPoints size  > 3] whileTrue: [ bestPoints removeLast].
	bestPoints size = 3
		ifTrue: [ self hasBracketingPoints
					ifFalse:[ bestPoints removeLast].
				].
	bestPoints size < 3
		ifTrue: [ ( DhbOptimizingBracketFinder forOptimizer: self) evaluate].