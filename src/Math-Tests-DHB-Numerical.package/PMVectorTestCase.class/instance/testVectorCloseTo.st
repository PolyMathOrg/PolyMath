boolean
testVectorCloseTo
	
	self assert: (#(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector).
	self assert: #(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector. "Double check that the TestAsserter >> #assert:closeTo: functions properly here."
	self deny: (#(1.00001 2.00007) asPMVector closeTo: #(1.00007 2.00001) asPMVector)