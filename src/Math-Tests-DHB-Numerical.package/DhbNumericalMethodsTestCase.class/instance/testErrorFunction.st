function evaluation
testErrorFunction
	"simple cases to expect"
	self should: [0 errorFunction = (1 / 2)].
	self should:
		[ DhbFloatingPointMachine new  largestNumber errorFunction > 
 		(1 - DhbFloatingPointMachine new machinePrecision  )].
	"add some code to require initialize to run"
	DhbErfApproximation reset.
	self should:
		[DhbFloatingPointMachine new largestNumber negated errorFunction < DhbFloatingPointMachine new smallestNumber ].