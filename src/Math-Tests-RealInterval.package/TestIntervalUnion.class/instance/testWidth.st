tests - accessing
testWidth
self assert: i width isNaN .
self assert: x width =Float infinity .
self assert: (IntervalUnion with: 0	with: a negated ) width =Float infinity .
self assert: (IntervalUnion with: 0	with: e with:1 ) width = (1/2) .
self assert: (IntervalUnion with:(a sup:3;yourself) with:(e inf: -1;yourself)) width = (13/4) .
