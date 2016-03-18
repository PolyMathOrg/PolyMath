tests-converting
testEnlargeToWidth
|y|
self assert: (x copy enlargeToWidth: Float infinity )=(IntervalBox with: RealInterval entire with: RealInterval entire with: RealInterval entire ).
self assert: (x copy enlargeToWidth: 0 )=x.
y:=x copy.
y at:3 put:(RealInterval inf: 1.92 sup: 2.88).
x  enlargeToWidth: 0.4.
self assert: x=y.