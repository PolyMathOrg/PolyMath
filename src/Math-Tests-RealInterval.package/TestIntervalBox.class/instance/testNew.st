tests
testNew
x:=IntervalBox new:3.
self assert: x = (IntervalBox with: RealInterval new with: RealInterval new with: RealInterval new).
x at:1 put:(RealInterval fromNumber: 3).
x at:2 put:(IntervalUnion from: 2 to: 2).
self assert: x = (IntervalBox with: (RealInterval fromNumber: 3) with: (RealInterval fromNumber: 2) with: RealInterval new).