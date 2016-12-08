testing-arithmetic
testMultiply
	self assert: zero * zero = zero.
	self assert: zero * minusOne = zero.
	self assert: huge * zero = zero.
	self assert: one * zero = zero.
	
	self assert: one * two = two.
	self assert: minusOne * one = minusOne.
	self assert: minusOne * minusTwo = two.
	
	self assert: half * two = one.
	
	"check rounding"
	self assert: huge * one = huge.