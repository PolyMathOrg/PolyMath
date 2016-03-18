tests - comparing
testMin
|x|
self assert: (empty min: a)=empty.
self assert: (o min: empty)=empty .
self assert: (3 min: empty)=empty.
self assert: (empty min: -1)=empty.
self assert: (e min: c)=e.
self assert: (c min: e)=e.
self assert: (h+1 min: h)=h.
self assert: (c min: Float infinity negated)=Float infinity negated.
self assert: (Float infinity negated min: c)=Float infinity negated.
self assert: (c min: Float infinity)=c.
self assert: (Float infinity min: c)=c.
self assert: (e min: d)=e.
self assert: (d min: e)=e.
x:=RealInterval inf: Float infinity negated sup: (-3/4).
self assert: (e min: h)=x.
self assert: (h min: e)=x.
self assert: (e min: 1)=e.
self assert: (1 min: e)=e.
x:=RealInterval inf: -1 sup: 0.
self assert: (0 min: d)=x.
self assert: (d min: 0)=x.
self assert: (e min: -3)= -3.
self assert: (-3 min: e)= -3.






