tests - mathematical functions
testLn
self assert: i ln  isEmpty.
x:=IntervalUnion with: 1 with: 0 with:e. 
self assert: x ln=0.
x:=IntervalUnion with: g with: Float e reciprocal with: e.
self assert: (x ln equalsTo: (IntervalUnion with: -1 with: (RealInterval inf: 0.6931471805599 sup: Float infinity))).