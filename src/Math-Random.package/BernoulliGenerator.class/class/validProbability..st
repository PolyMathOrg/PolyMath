private
validProbability: aProbability
"reject probabilities outside of [0,1]"
	self assert: [(aProbability < 0) not and: (aProbability > 1) not].