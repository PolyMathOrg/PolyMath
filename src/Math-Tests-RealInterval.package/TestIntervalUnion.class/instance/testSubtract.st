tests - arithmetic
testSubtract
|y|
self assert: (x-empty) isEmpty .
self assert: (empty-x) isEmpty .
self assert: (x-i) isEmpty .
self assert: (i-x) isEmpty .
self assert: (i-i) isEmpty .
y:=IntervalUnion with: (e-1)  with: o negated with:(g-1). 
self assert: (x-1) =y .
self assert: (1- x) =y negated.
self assert: (x-o) =y .
self assert: (o-x) =y negated.
self assert: (x - y) =(x+ y negated).
i:=IntervalUnion with: o with: z .
y addAll: (y+1).
self assert: (x-i) =y. 
self assert: (i-x)= y negated. 