tests - arithmetic
testAbs
x add: g negated.
x:=x abs .	
self assert: (x at:3)=g.
self assert: (x at:2)=e abs.
self assert: (x at:1)=0 .
self assert: x size=3 .
self assert: i isIntervalUnion .
self assert: i abs isEmpty
