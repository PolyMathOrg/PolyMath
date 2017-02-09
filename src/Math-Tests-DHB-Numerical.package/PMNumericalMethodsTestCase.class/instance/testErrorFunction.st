function evaluation
testErrorFunction
	"simple cases to expect"

	self assert: 0 errorFunction equals: 1 / 2.
	self
		assert:
			PMFloatingPointMachine new largestNumber errorFunction
				> (1 - PMFloatingPointMachine new machinePrecision).
	"add some code to require initialize to run"
	PMErfApproximation reset.
	self
		assert:
			PMFloatingPointMachine new largestNumber negated errorFunction
				< PMFloatingPointMachine new smallestNumber