tests - arithmetic
testAdd
|f|
f:=a negated.
self assert: d+empty=empty.
self assert: empty+b=empty.
self assert: z+empty=empty.
self assert: empty+z=empty.
self assert: empty+empty=empty.
self assert: b+b=b.
self assert: o+b=b.
self assert: f+f=f.
self assert: f+g=b.
self assert: a+2=g .
self assert: 2+f=h.
self assert: z+c=c.
self assert: c+z=c.
self assert: d+c=(RealInterval inf: 0 sup: 15).
self assert: e+g=(RealInterval inf: (3/4) sup: Float infinity).
