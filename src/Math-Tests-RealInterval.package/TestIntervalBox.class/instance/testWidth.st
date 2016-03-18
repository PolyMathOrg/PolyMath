tests-accessing
testWidth

self assert: x width =2.
x at:2 put:RealInterval new.
self assert: x width isNaN .
x:=IntervalBox new:3 withAll:(RealInterval fromNumber: 3).
self assert: x width =0.