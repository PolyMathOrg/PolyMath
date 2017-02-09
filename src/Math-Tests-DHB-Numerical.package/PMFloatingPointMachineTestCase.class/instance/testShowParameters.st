precision
testShowParameters
	"included for coverage, test has no effect"

	self
		assert:
			(PMFloatingPointMachine new showParameters
				isKindOf: PMFloatingPointMachine)