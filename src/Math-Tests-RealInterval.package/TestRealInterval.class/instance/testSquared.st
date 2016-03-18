tests - mathematical functions
testSquared
self assert: empty squared =empty.
self assert: z squared=z.
self assert: o squared=o.
self assert: o negated squared=o.
self assert: a squared=a.
self assert: b squared=a.
self assert: c squared =(RealInterval inf: 1 sup: 49).
self assert: d squared=(RealInterval inf: 0 sup: 64).
self assert: e squared=(RealInterval inf: 9/16 sup: 25/16).
self assert: a negated squared=a .
self assert: g squared=(RealInterval inf: 4 sup: Float infinity ).
self assert: h squared=a.
self assert: (RealInterval inf: -10 sup: 8) squared=(RealInterval inf: 0 sup: 100). 
