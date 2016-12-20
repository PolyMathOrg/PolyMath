tests
testQuantileA
	self
		assert: (self resultCollect: a method: #modeBased)
		equals:
			{1.
			(7 / 4).
			(5 / 2).
			(13 / 4).
			4}.
	self
		assert: (self resultCollect: a method: #inverseCDF)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #closestObservation)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #california)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #hydrologist)
		equals:
			{1.
			(3 / 2).
			(5 / 2).
			(7 / 2).
			4}.
	self
		assert: (self resultCollect: a method: #weibull)
		equals:
			{1.
			(5 / 4).
			(5 / 2).
			(15 / 4).
			4}.
	self
		assert: (self resultCollect: a method: #medianBased)
		equals:
			{1.
			(17 / 12).
			(5 / 2).
			(43 / 12).
			4}.
	self
		assert: (self resultCollect: a method: #normalDistribution)
		equals:
			{1.
			(23 / 16).
			(5 / 2).
			(57 / 16).
			4}.
	self assert: (a quantile: 1 / 4) equals: 7 / 4.
	self assert: a interQuartileRange equals: 2