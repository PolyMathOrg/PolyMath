tests - arithmetic
testQuo
|y|
self assert: (x quo: empty) isEmpty .
self assert: (empty quo: x) isEmpty .
self assert: (x quo:i) isEmpty .
self assert: (i quo:x) isEmpty .
self assert: (i quo:i) isEmpty .
self assert: (4 quo: i) isEmpty .
self assert: (b quo:i) isEmpty .
y:=IntervalUnion with:o negated with:z.
i:=IntervalUnion with: o with: z .
self assert: (1 quo: x)=y.
self assert: (o quo: x) =y .
self assert: (i quo: x) =i negated .
self assert: (e quo: x) =y negated.
self assert: (x quo: 1)=(y add: (RealInterval inf: 2 sup: Float infinity);yourself ).
self assert: (x quo: i) =y .
self assert: (x quo: o) =y .
self assert: (x quo: e) =(IntervalUnion with: (g quo:e)  with: (e quo:e)).
self assert: (x quo: x) =(IntervalUnion with: (g quo:e)  with: (g quo:g)).
