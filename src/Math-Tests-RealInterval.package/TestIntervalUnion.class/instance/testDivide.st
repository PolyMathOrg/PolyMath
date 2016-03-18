tests - arithmetic
testDivide
|y|
self assert: (x/empty) isEmpty .
self assert: (empty/x) isEmpty .
self assert: (x/i) isEmpty .
self assert: (i/x) isEmpty .
self assert: (i/i) isEmpty .
self assert: (4/i) isEmpty .
self assert: (b/i) isEmpty .
self assert: (x/ -1) =x negated.
y:=IntervalUnion new add: (RealInterval inf: (4/5)  sup: (4/3))  ;
	add: (RealInterval inf: (-1/2)  sup: 0); yourself .
self assert: (-1/ x) =y.
self assert: (x/o) =x .
self assert: (o/x) =y negated.
self assert: (x/x) =(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-8/5)) 
	with:(RealInterval inf: (-5/8) sup: Float infinity)). 
i:=IntervalUnion with: o with: z .
self assert: (i/x) =y negated. 
self assert: (i negated/x)= y. 
self assert: (IntervalUnion with: c with:e) / (IntervalUnion with: d with:e)=
	(IntervalUnion 
	 with: (RealInterval inf: Float infinity negated   sup: (-3/32)) 
	 with: (RealInterval inf: (1/8) sup: Float infinity)).
self assert: (e/x) = (IntervalUnion with: e/g with: e/e). 
self assert: (x/e)= (IntervalUnion with: (RealInterval inf: Float infinity negated   sup: (-8/5)) with: e/e with:z). 