information
computeChiSquare
"does not make much sense to use in most cases, but then, the superclass has it and if its here, the calculation should be correct and the superclass's way does not work here eg because of the way DataHolder>>pointsAndErrorsDo: works"
	chiSquare := 0.
	degreeOfFreedom := self numberOfFreeParameters negated.
	dataHolder pointsAndErrorsDo:
		[ :each | |y| 
		  y :=result value: each xValue .
		  (y closeTo: 0) ifFalse:
		  	[chiSquare := (each yValue - y) squared / y abs +chiSquare  .
		  	degreeOfFreedom := degreeOfFreedom + 1].
		].