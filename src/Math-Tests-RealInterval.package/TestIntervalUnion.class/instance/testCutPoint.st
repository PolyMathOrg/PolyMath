tests - accessing
testCutPoint
x:=x copy. "so that g wont be changed"
self assert: x cutPoint =0.
x sup:3.5 .
self assert: x cutPoint =0.
x sup:0 .
self assert: x cutPoint > (-3/4).
self assert: x cutPoint < 0.
self assert: i cutPoint isNaN .
i:=IntervalUnion with: o.
self assert: i cutPoint isNaN .
i:=(IntervalUnion with: g with: e negated) .
self assert: i cutPoint =(13/8).
self assert: i negated cutPoint = (-13/8).