testing-compare
testLessThan
	
	self assert: zero < one.
	self assert: one < two.
	self assert: two < huge.
	self assert: minusOne < one.
	self assert: minusTwo < minusOne.
	self assert: minusTwo < huge.
	
	self deny: huge < one.
	self deny: huge < zero.
	self deny: huge < minusOne.
	self deny: one < minusOne.
	self deny: minusOne < minusTwo.