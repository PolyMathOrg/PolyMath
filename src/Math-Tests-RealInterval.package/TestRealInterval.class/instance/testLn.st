tests - mathematical functions
testLn
self assert: empty ln =empty.
self assert: z ln=empty .
self assert: o ln=0.
self assert: o negated ln=empty .
self assert: a ln=b.
self assert: b ln=b.
self assert: (RealInterval inf: -1 sup: 1) ln = a negated .
self assert: a negated ln=empty .
h sup: Float e.
self assert: h ln=(RealInterval inf: Float infinity negated sup: 1).
