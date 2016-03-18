tests - set operations
testHull
self assert: ((a hull) =a).
self assert: ((d hull) =d).
self assert: 2 hull=2.
self assert: 2 hull isRealInterval .
self assert: (a hull: a )=a.
self assert: (a hull: empty )=a.
self assert: (empty hull: c)=c.
self assert: (2 hull: empty )=2.
self assert: (empty hull: -1.3)= -1.3.
self assert: (empty hull: Float infinity negated)=empty.
self assert: (Float infinity hull: empty)=empty.
self assert: (empty hull: empty)=empty.
self assert: (d hull: e)=(d union: e)hull.
self assert: (e hull: g)=(e union: g)hull.
self assert: (e hull: 3)=(RealInterval inf: (-5/4) sup: 3).
self assert: (-1 hull: e)=e.
self assert: (e hull: 2)=(2 hull: e).
self assert: (2 hull: Float infinity)=g.
self assert: (Float infinity negated hull: 2)=h.
self assert: (Float infinity negated hull: Float infinity)=b.

