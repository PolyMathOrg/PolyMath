tests - arithmetic
testReciprocal
self assert: empty reciprocal =empty.
self assert: z reciprocal=empty.
self assert: o reciprocal=o.
self assert: o negated reciprocal=o negated.
self assert: a reciprocal=a.
self assert: b reciprocal=b.
self assert: c reciprocal reciprocal =c.
self assert: d reciprocal=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1)with:(RealInterval inf: 1/8 sup: Float infinity)).
self assert: e reciprocal=(RealInterval inf: -4/3 sup: -4/5).
self assert: a negated reciprocal=a negated.
self assert: g reciprocal=(RealInterval inf: 0 sup: 1/2).
self assert: h reciprocal=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: 0)with:(RealInterval inf: 1/2 sup: Float infinity)).
self assert: (RealInterval inf: -10 sup: 8) reciprocal=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1/10)with:(RealInterval inf: 1/8 sup: Float infinity)). 
