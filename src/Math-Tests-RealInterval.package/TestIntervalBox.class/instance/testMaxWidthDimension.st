tests-accessing
testMaxWidthDimension

self assert: x maxWidthDimension =2.
x swap: 3 with:2. 
self assert: x maxWidthDimension =3.
x :=IntervalBox with: RealInterval new.
self assert: x maxWidthDimension =1.
x :=IntervalBox new.
self assert: x maxWidthDimension =0.
x:=IntervalBox new:3 withAll:(RealInterval fromNumber: 3).
self assert: x maxWidthDimension =1.