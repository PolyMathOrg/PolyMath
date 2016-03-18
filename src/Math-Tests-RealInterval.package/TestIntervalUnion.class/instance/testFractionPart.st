tests - truncation
testFractionPart
self assert: i fractionPart isEmpty .
i:=(IntervalUnion with:0 with: -1 with: -2 with: g).
self assert: x fractionPart =(IntervalUnion 
	with: (RealInterval inf: (-1/4) sup: 1)
	with:(RealInterval inf: -1 sup: (-3/4))). 
i:=(IntervalUnion with:0 with: -1 with: -2 with: e negated).
self assert:i fractionPart=(IntervalUnion 
	with: (RealInterval inf: (3/4) sup: 1)
	with:(RealInterval inf: 0 sup: (1/4))).