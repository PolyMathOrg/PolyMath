running
testFractionDoubleDispatch
	"needed for coverage of adaptToFraction:andSend:"

	| frac |
	frac := 1 / 2.
	self assert: frac + q1234 equals: q1234 + frac.
	self assert: ((frac + q1234) real isKindOf: Fraction).
	self assert: (frac + q1234) real equals: 3 / 2