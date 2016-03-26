function evaluation
testErrorFunction
	"simple cases to expect"

	self assert: 0 errorFunction equals: 1 / 2.
	self
		assert:
			DhbFloatingPointMachine new largestNumber errorFunction
				> (1 - DhbFloatingPointMachine new machinePrecision).
	"add some code to require initialize to run"
	DhbErfApproximation reset.
	self
		assert:
			DhbFloatingPointMachine new largestNumber negated errorFunction
				< DhbFloatingPointMachine new smallestNumber