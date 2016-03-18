tests
testIsEmpty
|z|
self deny: x isEmpty.
z:=x copy.
x at:1 put: RealInterval new.
self assert: x isEmpty .
x at:2 put: RealInterval new.
x at:3 put: RealInterval new.
self assert: x isEmpty .
z at:3 put: RealInterval new.
self assert: z isEmpty .
self assert: IntervalBox new isEmpty.