tests - mathematical functions
testSquared
|j k|
self assert: i squared isEmpty.
j:=IntervalUnion with:z with:o.
k:=j copy add: -1; yourself.
self assert: k squared=j.
j:=IntervalUnion with:b.
self assert: j squared=a.
self assert: (IntervalUnion with:e) squared =(IntervalUnion with:e negated) squared.
self assert: x squared=(IntervalUnion with:z with: (RealInterval inf: (9/16) sup: (25/16)) with:g squared ).
