precision
testShowParameters
	"included for coverage, test has no effect"

	self
		assert:
			(DhbFloatingPointMachine new showParameters
				isKindOf: DhbFloatingPointMachine)