tests - set operations
testHull2
self assert: (i hull:i) = empty .
self assert: (i hull:Float infinity negated) = empty .
self assert: (Float infinity negated hull:i) = empty .
self assert: (i hull:3) = 3 .
self assert: (3 hull:i) = 3 .
self assert: (i hull:a) = a .
self assert: (c hull:i) = c .
self assert: (x hull:Float infinity) = x hull.
self assert: (Float infinity hull:x) = x hull.
self assert: (Float infinity negated hull:x) = b.
self assert: (x hull:Float infinity negated) = b.
self assert: (x hull:2) = x hull.
self assert: (x hull: -2) = h negated.
self assert: (-2 hull:x) = h negated.
self assert: (x hull:c negated) = (RealInterval inf: -7 sup: Float infinity).
self assert: (d negated hull:x) = (RealInterval inf: -8 sup: Float infinity).
i:=IntervalUnion with: d with:e. 
self assert: (i negated hull:x) = (RealInterval inf: -8 sup: Float infinity).

