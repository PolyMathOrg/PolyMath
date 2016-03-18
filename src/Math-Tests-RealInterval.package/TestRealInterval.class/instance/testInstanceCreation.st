tests-rest
testInstanceCreation
"instances are created in setUp"
self assert: a inf=0.
self assert: a sup=Float infinity.
self assert: b inf=Float infinity negated.
self assert: b sup=Float infinity.
self assert: d inf= -1.
self assert: d sup=8.
self assert: e inf= (-5/4).
self assert: e sup=(-3/4).
self assert: c inf= 1.
self assert: c sup=7.
self assert: empty isEmpty.
self assert: (RealInterval fromNumber: Float infinity  withUncertainty:2) =empty.
self assert: (RealInterval fromNumber: 2  withUncertainty: Float infinity) =b.
self assert: (RealInterval fromNumber: 4  withUncertainty: -3) =c.
self assert: (RealInterval inf: Float infinity sup: Float infinity)=empty.
self assert: (RealInterval inf: Float infinity negated sup: Float infinity negated)=empty.
self assert: (RealInterval inf: Float infinity sup: Float infinity negated)=empty.
self assert: (RealInterval inf: -2 sup: -3)=empty.
a:=(RealInterval fromNumber: -3).
b:=(RealInterval fromNumber: (RealInterval fromNumber: -3)).
self assert: a =b.
self assert: a class=b class.
b:= RealInterval fromNumber: (IntervalUnion  from: -3 to: -3 ).
self assert: a =b.
self assert: a class=b class.
self assert: RealInterval big isFinite.
self assert: (RealInterval big includes: (RealInterval inf: -1000 sup: 1000) ).
self assert: RealInterval big inf > Float fmax negated.
self assert: RealInterval big sup < Float fmax .
self assert: RealInterval pi = (RealInterval inf: Float pi sup: Float pi successor) .
self assert: RealInterval halfPi = (RealInterval inf: Float halfPi sup: Float halfPi successor) .
self assert: RealInterval twoPi = (RealInterval inf: Float twoPi sup: Float twoPi successor) .



