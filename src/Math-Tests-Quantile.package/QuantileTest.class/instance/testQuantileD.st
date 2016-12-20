tests
testQuantileD
	"tests #(1 3 2 4 5 6)"

	self
		assert: (self resultCollect: d method: #modeBased)
		equals:
			{1.
			(9 / 4).
			(7 / 2).
			(19 / 4).
			6}.
	self
		assert: (self resultCollect: d method: #inverseCDF)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #closestObservation)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #california)
		equals:
			{1.
			(3 / 2).
			3.
			(9 / 2).
			6}.
	self
		assert: (self resultCollect: d method: #hydrologist)
		equals:
			{1.
			2.
			(7 / 2).
			5.
			6}.
	self
		assert: (self resultCollect: d method: #weibull)
		equals:
			{1.
			(7 / 4).
			(7 / 2).
			(21 / 4).
			6}.
	self
		assert: (self resultCollect: d method: #medianBased)
		equals:
			{1.
			(23 / 12).
			(7 / 2).
			(61 / 12).
			6}.
	self
		assert: (self resultCollect: d method: #normalDistribution)
		equals:
			{1.
			(31 / 16).
			(7 / 2).
			(81 / 16).
			6}.
	self assert: d interQuartileRange equals: 3