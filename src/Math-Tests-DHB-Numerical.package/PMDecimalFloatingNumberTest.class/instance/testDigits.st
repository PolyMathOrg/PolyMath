tests
testDigits
	self
		assert: PMDecimalFloatingNumber digits
		equals: PMDecimalFloatingNumber defaultDigits.
	PMDecimalFloatingNumber resetDigits.
	self shouldnt: [ PMDecimalFloatingNumber digits isNil ].
	PMDecimalFloatingNumber defaultDigits: 24.
	self shouldnt: [ PMDecimalFloatingNumber digits isNil ].
	self assert: PMDecimalFloatingNumber digits equals: 24.
	self assert: PMDecimalFloatingNumber defaultDigits equals: 15.
	PMDecimalFloatingNumber resetDigits