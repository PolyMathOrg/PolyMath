tests - arithmetic
testMultiply
|y|
self assert: (x*empty) isEmpty .
self assert: (empty*x) isEmpty .
self assert: (x*i) isEmpty .
self assert: (i*x) isEmpty .
self assert: (i*i) isEmpty .
self assert: (2*i) isEmpty .
self assert: (a*i) isEmpty .
self assert: (x* -1) =x negated.
self assert: (-1* x) =x negated.
self assert: (x*o) =x .
self assert: (o*x) =x.
y:=IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-3/2))  
	with: z
	with: (RealInterval inf: (9/16) sup: (25/16)) 
	with:(RealInterval inf: 4 sup: Float infinity). 
self assert: (x*x) =y.
self assert: (x negated * x) =y negated.
i:=IntervalUnion with: o with: z .
self assert: (x*i) =x. 
self assert: (i negated*x)= x negated. 
i:=IntervalUnion with: e*g with: e*e with:z.
self assert: (x*e) =i. 
self assert: (e*x) =i. 