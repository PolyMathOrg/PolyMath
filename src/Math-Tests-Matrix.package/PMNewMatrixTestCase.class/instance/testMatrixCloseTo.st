comparing
testMatrixCloseTo
	self assert: ((PMMatrix rows: #(#(1.00001 2.00002) #(3.00001 4.00002))) closeTo: (PMMatrix rows: #(#(1.00002 2.00001) #(3.00002 4.00001)))).
	self assert: (PMMatrix rows: #(#(1.00001 2.00002) #(3.00001 4.00002))) closeTo: (PMMatrix rows: #(#(1.00002 2.00001) #(3.00002 4.00001))).	"Double check that the TestAsserter >> #assert:closeTo: functions properly here."
		self deny: ((PMMatrix rows: #(#(1.00001 2.00004) #(3.00001 4.00004))) closeTo: (PMMatrix rows: #(#(1.00004 2.00001) #(3.00004 4.00001)))).