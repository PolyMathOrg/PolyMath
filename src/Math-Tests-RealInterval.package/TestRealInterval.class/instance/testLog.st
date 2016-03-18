tests - mathematical functions
testLog
self assert: empty log =empty.
self assert: z log=empty .
self assert: o log=0.
self assert: o negated log=empty .
self assert: a log=b.
self assert: b log=b.
self assert: (RealInterval inf: -1 sup: 1) log = a negated .
self assert: a negated log=empty .
self assert: h log=(RealInterval inf: Float infinity negated sup: 2 log).
