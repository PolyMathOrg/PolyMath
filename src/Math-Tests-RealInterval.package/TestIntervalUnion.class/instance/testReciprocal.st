tests - arithmetic
testReciprocal
self assert: i reciprocal isEmpty .
i add:z.
self assert: i reciprocal isEmpty .
c:=x reciprocal .
self assert: (c at:1)=e reciprocal .
self assert: (c at:2)= g reciprocal .
self assert: c size=2 .
self assert: z=0.
x add: g negated.
x:=x reciprocal .	
self assert: (x at:1)=e reciprocal .
self assert: (x at:2)= (RealInterval inf: (-1/2) sup: (1/2) ) .
self assert: x size=2 .
self assert: i isIntervalUnion .
