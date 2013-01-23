tests
testDigits
	self should: [DhbDecimalFloatingNumber digits = DhbDecimalFloatingNumber defaultDigits].
	DhbDecimalFloatingNumber resetDigits.
	self shouldnt: [DhbDecimalFloatingNumber digits isNil].
	DhbDecimalFloatingNumber defaultDigits: 24.
	self shouldnt: [DhbDecimalFloatingNumber digits isNil].
	self should: [DhbDecimalFloatingNumber digits = 24].
	self should: [DhbDecimalFloatingNumber defaultDigits = 15].
	DhbDecimalFloatingNumber resetDigits.