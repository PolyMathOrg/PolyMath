tests
testIncludes
"IntervalBox with: (RealInterval inf: -2 sup: -1)  with: (RealInterval inf: -3 sup: -1) with:(RealInterval inf: 2 sup:2.8)"
|z|
self assert: (x includes: x).
z:=x copy.
z at:1put: RealInterval new.
self assert: (x includes: z).
self deny: (z includes: x).
z:=x copy.
z at:3 put: RealInterval new.
self assert: (x includes: z).
self deny: (z includes: x).
z:=x copy.
z at:2put: (RealInterval inf: -2 sup: -1.7).
self assert: (x includes: z).
self deny: (z includes: x).
z at:3 put: RealInterval new.
z at:1 put: (RealInterval inf: -2 sup: -1.6).
self assert: (x includes: z).
self deny: (z includes: x).
