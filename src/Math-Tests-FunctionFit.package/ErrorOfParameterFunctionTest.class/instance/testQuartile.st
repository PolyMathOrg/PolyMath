tests
testQuartile
	self assert: f quartile equals: 1 / 2.
	f quartile: 1.
	self assert: f quartile equals: 1.
	self should: [ f quartile: 2 ] raise: DomainError.
	self should: [ f quartile: -0.1 ] raise: DomainError