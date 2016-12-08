testing-compare
testGreaterThan
	
	self assert: zero < one.
	self deny: one > two.
	self deny: two > huge.
	self deny: minusOne > one.
	self deny: minusTwo > minusOne.
	self deny: minusTwo > huge.
	
	self assert: huge > one.
	self assert: huge > zero.
	self assert: huge > minusOne.
	self assert: one > minusOne.
	self assert: minusOne > minusTwo.