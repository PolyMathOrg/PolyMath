tests
testTruncate
	col at: 1 put: -4 @ -0.2.
	col at: 81 put: 4.000000000000004 @ 0.2.
	col at: 10 put: -3.099999999999999 @ 2.
	fit := GeneralFunctionFit
		function: f
		data: col
		minimumValues: 0
		maximumValues: 5.
	fit errorType: #quartile.
	self assert: (fit findQuartile equalsTo: #(0.1 0.4)).
	self assert: fit quartile < (79 / 81).
	self assert: fit quartile > (75 / 81).
	self deny: fit dataTruncated.
	fit truncateData.
	self assert: fit dataTruncated.
	self
		assert: fit optimizer functionBlock data size
		equals: fit quartile * col size.
	fit errorType: #abs.
	self assert: fit errorType equals: #abs.
	self assert: (fit evaluate equalsTo: #(0.1 0.4)).
	fit resetData.
	self assert: fit optimizer functionBlock data size equals: col size