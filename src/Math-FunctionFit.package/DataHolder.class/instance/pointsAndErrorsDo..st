iterators
pointsAndErrorsDo: aBlock
"uses an unweighted approach; the weighted one does not make sense here and is dangerous, if done too naively, eg because of negative or infinite weights"
	self do:
		[ :each | aBlock value: (DhbWeightedPoint point: each)].