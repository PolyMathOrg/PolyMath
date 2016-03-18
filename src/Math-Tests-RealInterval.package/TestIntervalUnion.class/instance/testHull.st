tests - set operations
testHull
self assert: i hull = empty .
i add:c.
self assert: i hull=c.
i add: c negated .
self assert: i hull=(RealInterval inf: -7 sup: 7).
self assert: x hull =(RealInterval inf: (-5/4) sup: Float infinity).
self assert: b hull=b.
