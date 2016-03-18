tests - arithmetic
testIntegerDiv
|y|
self assert: (x // empty) isEmpty .
self assert: (empty // x) isEmpty .
self assert: (x // i) isEmpty .
self assert: (i // x) isEmpty .
self assert: (i // i) isEmpty .
self assert: (4 // i) isEmpty .
self assert: (b // i) isEmpty .
y:=IntervalUnion from: -2 to:0.
i:=IntervalUnion with: o with: z .
self assert: (1 // x)=y.
self assert: (o // x) =y .
self assert: (i // x) =y .
self assert: (e // x) =(IntervalUnion from: -1 to:1).
self assert: (x // 1)=(y add: (RealInterval inf: 2 sup: Float infinity);yourself ).
self assert: (x // i) =y .
self assert: (x // o) =y .
self assert: (x // e) =(IntervalUnion with: (g // e)  with: o with: z).
