tests
testDigits
	self
		assert: DhbDecimalFloatingNumber digits
		equals: DhbDecimalFloatingNumber defaultDigits.
	DhbDecimalFloatingNumber resetDigits.
	self shouldnt: [ DhbDecimalFloatingNumber digits isNil ].
	DhbDecimalFloatingNumber defaultDigits: 24.
	self shouldnt: [ DhbDecimalFloatingNumber digits isNil ].
	self assert: DhbDecimalFloatingNumber digits equals: 24.
	self assert: DhbDecimalFloatingNumber defaultDigits equals: 15.
	DhbDecimalFloatingNumber resetDigits