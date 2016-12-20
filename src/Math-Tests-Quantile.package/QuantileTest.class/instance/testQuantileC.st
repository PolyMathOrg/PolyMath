tests
testQuantileC
	"tests #(1 3 2 4 5)"

	| r |
	self
		assert: (self resultCollect: c method: #modeBased)
		equals: #(1 2 3 4 5).
	self
		assert: (self resultCollect: c method: #inverseCDF)
		equals: #(1 2 3 4 5).
	self
		assert: (self resultCollect: c method: #closestObservation)
		equals: #(1 1 3 4 5).
	self
		assert: (self resultCollect: c method: #california)
		equals:
			{1.
			(5 / 4).
			(5 / 2).
			(15 / 4).
			5}.
	self
		assert: (self resultCollect: c method: #hydrologist)
		equals:
			{1.
			(7 / 4).
			3.
			(17 / 4).
			5}.
	self
		assert: (self resultCollect: c method: #weibull)
		equals:
			{1.
			(3 / 2).
			3.
			(9 / 2).
			5}.
	self
		assert: (self resultCollect: c method: #medianBased)
		equals:
			{1.
			(5 / 3).
			3.
			(13 / 3).
			5}.
	r := {1.
	(27 / 16).
	3.
	(69 / 16).
	5}.
	self
		assert: (self resultCollect: c method: #normalDistribution)
		equals: r.
	self
		assert:
			(self
				resultCollect: c
				withProbs:
					{(3 / 8).
					(1 / 4).
					0.
					1})
		equals: r.
	self assert: c interQuartileRange equals: 5 / 2