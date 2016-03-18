tests - arithmetic
testNegated
self assert: empty negated=empty.
self assert: z negated=z.
self assert: o negated= 1 negated .
self assert: b negated=b.
self assert: c negated negated=c.
self assert: d negated negated=d.
self assert: a negated=(RealInterval inf: Float infinity negated sup: 0).
