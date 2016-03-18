tests-set operations
testHull
|y x1|
self assert: (x hull)=x.
x1 := IntervalBox with: (RealInterval inf: -2 sup: -1)  with: (RealInterval inf: -3 sup: -1) with:(IntervalUnion with: (RealInterval inf: -2 sup: -1) with:(RealInterval inf: 1 sup: 2)).
self assert: (x1 hull)=(IntervalBox with: (RealInterval inf: -2 sup: -1)  with: (RealInterval inf: -3 sup: -1) with:(RealInterval inf: -2 sup:2)).
y :=IntervalBox new:3.
self assert: (y hull)=y.
x1 :=(IntervalBox with: (RealInterval inf: -2 sup: -1)  with: (RealInterval inf: -3 sup: -1) with:(RealInterval inf: 2 sup:2.8)).
self assert: (x1 hull:y)=x1.
self assert: (y hull:x1)=x1.
y:=IntervalBox with: (RealInterval inf: -1 sup: 1)  with: (RealInterval inf: 2 sup: 3) with:(RealInterval inf: 2.2 sup:2.9).
x1:=(IntervalBox with: (RealInterval inf: -2 sup: -1)  with: (RealInterval inf: -3 sup: -1) with:(RealInterval inf: 2 sup:2.8)).
self assert: (y hull:x1)=(IntervalBox with: (RealInterval inf: -2 sup: 1)  with: (RealInterval inf: -3 sup: 3) with:(RealInterval inf: 2 sup:2.9)).
