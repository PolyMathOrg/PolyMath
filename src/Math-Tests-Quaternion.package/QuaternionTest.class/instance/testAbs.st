running
testAbs
	self assert: (1 i: 1 j: 1 k: 1) abs = 2.
	self should: [(1.0e200 i: 1.0e200 j: 1.0e200 k: 1.0e200) abs = 2.0e200]
		description: 'An overflow should be avoided'.
	self 
		should: 
			[| big |
			big := (2.0 raisedTo: 53) - 1 timesTwoPower: 1023 - 52.
			(big i: big j: big k: big) abs = Float infinity]
		description: 'An overflow cannot be avoided'.
	self should: [(1.0e-200 i: 1.0e-200 j: 1.0e-200 k: 1.0e-200) abs = 2.0e-200]
		description: 'An underflow should be avoided'