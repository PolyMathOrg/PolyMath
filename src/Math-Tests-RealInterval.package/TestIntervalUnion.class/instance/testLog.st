tests - mathematical functions
testLog
self assert: i log  isEmpty.
x:=IntervalUnion with: 1 with: 0 with:e. 
self assert: x log=0.
x:=IntervalUnion with: g with: 1 with: e.
self assert: (x log equalsTo: (IntervalUnion with:  0 with: g log)).