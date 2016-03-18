tests - mathematical functions
testTan
|x|
self assert: empty tan =empty.
self assert: ((RealInterval fromNumber: (Float pi*3))negated tan equalsTo: 0).
self assert: ((2 hull:4)tan equalsTo: (RealInterval inf: 2 tan sup:4 tan)).
self assert: a tan=b.
self assert: a negated tan=b.
self assert: c tan=b.
x:=RealInterval inf: 1 arcTan sup: (3/2)arcTan.
self assert: (x tan equalsTo: (RealInterval inf: 1  sup: (3/2))).
self assert: ((x + 0.7) tan equalsTo: (IntervalUnion with: (RealInterval inf: Float infinity negated  sup: (x+0.7)sup tan) with: (RealInterval inf: (x+0.7)inf  tan sup: Float infinity))) .
x:=x+Float pi.
self assert: ((x + 0.7) tan equalsTo: (IntervalUnion with: (RealInterval inf: Float infinity negated  sup: (x+0.7)sup tan) with: (RealInterval inf: (x+0.7)inf  tan sup: Float infinity))) .
