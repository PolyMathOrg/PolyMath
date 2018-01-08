tests
testCanCreateCovarianceMatrix

	self assert: average asArray equals:{ (101/2) . (-101/2) . (303/2) .  -101 . -6767}.
	self assert: covarianceMatrix rows size equals: 5.
	self assert: covarianceMatrix isSymmetric