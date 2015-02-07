testing-arithmetic
testSum
	self assert: zero + zero = zero.
	self assert: zero + minusOne = minusOne.
	self assert: huge + zero = huge.
	self assert: one + zero = one.
	
	self assert: one + minusOne = zero.
	self assert: minusOne + two = one.
	self assert: one + minusTwo = minusOne.
	
	"check rounding"
	self assert: huge + one = huge.