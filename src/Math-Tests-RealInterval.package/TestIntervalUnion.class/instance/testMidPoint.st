tests - accessing
testMidPoint
self assert: x midPoint =0.
x sup:3.5 .
self assert: x midPoint =2.
x sup:2.6 .
self assert: x midPoint =0.
x sup:0 .
self assert: x midPoint = (-3/4).
