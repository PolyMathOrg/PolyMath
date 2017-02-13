tests
testEpanechnikov
|f |
f:=5 sqrt.
density epanechnikov.
self assert: (density kernel value:f)=0.
self assert: (density kernel value:f negated)=0.
self assert: (density kernel value:0)=(3/(4*f)).
f:=3/(5*f).
self assert: ((density kernel value:1)equalsTo: f).
self assert: ((density kernel value: -1)equalsTo: f).
f :=ReadWriteStream with:''.
density printOn: f .
self assert: ((f contents findString: 'epanechnikov')>0).