tests
testExtremeCollectionmax
	| c |
	c := #(4 4 2).
	self
		assert: (a extremeCollection: c max: true)
		equals: {Float infinity negated}.
	self
		assert: (a extremeCollection: c max: false)
		equals: {Float infinity}.
	self
		assert: (a extremeCollection: {c} max: false)
		equals:
			{Float infinity.
			Float infinity.
			Float infinity}