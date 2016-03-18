tests - mathematical functions
testSqrt
self assert: empty sqrt =empty.
self assert: z sqrt=0.
self assert: o sqrt=1.
self assert: o negated sqrt=empty.
self assert: a sqrt=a.
self assert: b sqrt=a.
self assert: d sqrt=(RealInterval inf: 0 sup: 8sqrt).
self assert: e sqrt=empty.
self assert: h sqrt=(RealInterval inf: 0 sup: 2sqrt).
