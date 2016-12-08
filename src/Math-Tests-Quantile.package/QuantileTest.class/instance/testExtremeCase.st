tests
testExtremeCase
	self assert: #(2) asSortedCollection interQuartileRange equals: 0.
	self assert: #(2 2) asSortedCollection interQuartileRange equals: 0.
	self
		assert: #(2 2 2 2 2 2.2) asSortedCollection interQuartileRange
		equals: 0.
	self
		assert:
			(a
				quantile: 0
				method:
					{0.5.
					0.5.
					(1 / 2).
					(1 / 2)})
		equals: 1