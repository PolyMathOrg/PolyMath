tests
testReduce
i addAll: {1.RealInterval inf: 1 sup: 2.empty.empty. 1. empty.1.  RealInterval inf: 1 sup: 2. 1}.
self assert: i size=2.
i:=OpenIntervalUnion with:1 with:(RealInterval inf: 1 sup: 2) with:1   with:1.
self assert: i size=2.