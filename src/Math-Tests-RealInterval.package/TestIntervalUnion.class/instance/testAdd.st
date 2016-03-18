tests - arithmetic
testAdd
|y|
self assert: (x+empty) isEmpty .
self assert: (empty+x) isEmpty .
self assert: (x+i) isEmpty .
self assert: (i+x) isEmpty .
self assert: (i+i) isEmpty .
self assert: (a+i) isEmpty .
y:=IntervalUnion with: (RealInterval inf: (-1/4) sup: (1/4)) with: o with:(RealInterval inf: 3 sup: Float infinity ). 
self assert: (x+1) =y .
self assert: (1+x) =y .
self assert: (x+o) =y .
self assert: (o+x) =y .
self assert: (x+y) =(x+x+o).
i:=IntervalUnion with: o with: z .
self assert: (i+x) =(IntervalUnion 
	with: (RealInterval inf:(-5/4) sup: (-3/4))
	with:(RealInterval inf:(-1/4) sup: (1/4)) 
	with: o 
	with:(RealInterval inf: 2 sup: Float infinity )).
i:=IntervalUnion with: (RealInterval inf: (-5/2) sup: (-3/2)) with: e with: (RealInterval inf: (3/4) sup: Float infinity) .
self assert: (x+e) =i .
self assert: (e+x) =i .
 