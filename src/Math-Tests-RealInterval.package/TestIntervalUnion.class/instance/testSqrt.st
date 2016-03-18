tests - mathematical functions
testSqrt
|j k|
self assert: i sqrt isEmpty.
j:=IntervalUnion with:z with:o.
self assert: j sqrt=j.
k:=j copy add: -1; yourself.
self assert: k sqrt=j.
j:=IntervalUnion with:b.
self assert: j sqrt=a.
self assert: (IntervalUnion with:e) sqrt isEmpty .
