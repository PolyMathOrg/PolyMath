tests - comparing
testMax
|x|
self assert: (empty max: a)=empty.
self assert: (o max: empty)=empty .
self assert: (3 max: empty)=empty.
self assert: (empty max: -1)=empty.
self assert: (e max: c)=c.
self assert: (e max: c)=c.
self assert: (h+1 max: h)=(h+1).
self assert: (c max: Float infinity negated)=c.
self assert: (Float infinity negated max: c)=c.
self assert: (c max: Float infinity)=Float infinity.
self assert: (Float infinity max:c)=Float infinity.
self assert: (e max: d)=d.
self assert: (d max: e)=d.
x:=RealInterval inf: (-5/4) sup: 2.
self assert: (e max: h)=x.
self assert: (h max: e)=x.
self assert: (e max: 1)=1.
self assert: (1 max: e)=1.
x:=RealInterval inf: 0 sup: 8.
self assert: (0 max: d)=x.
self assert: (d max: 0)=x.
self assert: (e max: -3)=e.
self assert: (-3 max: e)=e.






