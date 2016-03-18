tests - arithmetic
testMod
self assert: i \\ 1=empty.
self assert: x \\ 4.7=(RealInterval inf: 0 sup: 4.7).
x:=IntervalUnion with: 1 with: 0 with:e.
self assert: (x \\ 1)=(e \\ 1).
self assert: (x \\ -1)=(e \\ 1) negated.
i:=IntervalUnion with:0 with: e negated .
self assert: (x \\ 2)=i.
self assert: (x \\ -2)=i negated.
