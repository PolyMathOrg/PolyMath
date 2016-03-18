tests - arithmetic
testMultiply
|f|
f:=a negated.
self assert: d*empty=empty.
self assert: empty*a=empty.
self assert: empty*0=empty.
self assert: empty*z=empty.
self assert: 0*empty=empty.
self assert: empty*empty=empty.
self assert: (b*0) isZeroInterval  .
self assert: (0*b) isZeroInterval .
self assert: (b*z) isZeroInterval .
self assert: (z*b) isZeroInterval .
self assert: ((RealInterval fromNumber: 3)*(RealInterval fromNumber: 5)=15) .
self assert: a*a=a.
self assert: a *f=f .
self assert: f * -3 =a .
self assert: -3*a=f.
self assert: f * d =b .
self assert: c * b =b .
self assert: o * d =d .
self assert: e * o =e .
self assert: c*d=(RealInterval inf: -7 sup:56 ). 
self assert: c*e=(RealInterval inf: (-35/4) sup:(-3/4) ).  
self assert: e*d=(RealInterval inf: -10 sup:(5/4) ).  
self assert: h*e=(RealInterval inf: (-10/4) sup: Float infinity  ).  
