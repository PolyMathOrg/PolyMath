testing-arithmetic
testSubtract
	self assert: zero - zero = zero.
	self assert: zero - minusOne = one.
	self assert: huge - zero = huge.
	self assert: one - zero = one.
	
	self assert: one - minusOne = two.
	self assert: minusOne - minusTwo = one.
	self assert: minusOne - one = minusTwo.
	
	"check rounding"
	self assert: huge - one = huge.