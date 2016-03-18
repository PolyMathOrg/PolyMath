tests - truncation
testFractionPart
self assert: empty fractionPart =empty.
self assert: o negated fractionPart= 0.
self assert: h fractionPart=(RealInterval inf: -1 sup: 1).
self assert: a negated fractionPart=(RealInterval inf: -1 sup: 0).
a inf:19.3.
self assert: a fractionPart=(RealInterval inf: 0 sup: 1).
self assert: e fractionPart =(IntervalUnion with: (RealInterval inf: (-1/4) sup: 0)with:(RealInterval inf: -1 sup: (-3/4))).
self assert: (e +(1/4)) fractionPart =(IntervalUnion with: 0 with:(RealInterval inf: -1 sup: (-1/2))).
self assert: (e +(1/2)) fractionPart =(RealInterval inf: (-3/4) sup: (-1/4)).
e sup:(-1/4).
self assert: e fractionPart =(RealInterval inf: -1 sup: 0).
e sup:(1/4).
self assert: e fractionPart =(RealInterval inf: -1 sup: (1/4)).
e inf: (1/4).
self assert: e fractionPart = (1/4).


