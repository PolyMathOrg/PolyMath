tests - mathematical functions
testExp
self assert: empty exp =empty.
self assert: z exp=1.
self assert: o exp=Float e.
self assert: o negated exp=(1/Float e).
self assert: a exp=(a max:1).
self assert: b exp=a.
self assert: c exp =(RealInterval inf: Float e sup: 7 exp).
self assert: a negated exp=(RealInterval inf: 0 sup: 1) .
h sup: 2 ln.
self assert: h exp=(RealInterval inf: 0 sup: 2).
