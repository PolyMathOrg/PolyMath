tests - arithmetic
testAbs
self assert: empty abs=empty.
self assert: z abs=z.
self assert: o abs=o.
self assert: o negated abs=o.
self assert: a abs=a.
self assert: b abs=a.
self assert: c abs =c.
self assert: d abs=(RealInterval inf: 0 sup: 8).
self assert: e abs=e negated.
self assert: a negated abs=a .
self assert: g abs=g.
self assert: h abs=a.
self assert: (RealInterval inf: -10 sup: 8) abs=(RealInterval inf: 0 sup: 10). 
