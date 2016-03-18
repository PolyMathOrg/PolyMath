tests - arithmetic
testSubtract
self assert: d-empty=empty.
self assert: empty-b=empty.
self assert: empty-empty=empty.
self assert: b-b=b.
self assert: o-b=b.
self assert: a-a=b.
self assert: a-g negated=g.
self assert: a-2=h negated .
self assert: 2-a=h.
self assert: z-c=c negated.
self assert: c-z=c.
self assert: d-c=(RealInterval inf: -8 sup: 7).
self assert: e-h=(b copy inf: (-13/4);yourself).
