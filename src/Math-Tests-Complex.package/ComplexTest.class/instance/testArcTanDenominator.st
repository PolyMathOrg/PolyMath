tests
testArcTanDenominator
	| c1 c2 |
	
	c1 :=  1 i.
	c2 := 0.
	self should: [(c1 arcTan: c1) = (Float pi / 4)].
	self should: [(c2 arcTan: c1 ) = 0].
	self should: [(c2 arcTan: c1* c1) = Float pi].
	