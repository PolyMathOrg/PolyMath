tests - converting
testSplit
|ar|
ar:= i splitAtZero .
self assert: (ar first isEmpty ).
self assert: (ar second isEmpty ).
self assert: (i split:1) =ar.
self assert: (i split) =ar.
i add: 3.
ar:=i split.
self assert: (ar first =3 ).
self assert: (ar second isEmpty ).
 
i add: d.
self assert: i split =d split.
ar:= x splitAtZero .
self assert: (ar first =e ).
self assert: (ar first isRealInterval ).
self assert: (ar second =( IntervalUnion with: g with: 0) ).
self assert: (x split:0) =ar.
x add:(RealInterval inf: (-1/2) sup: 0.5).
ar:= x splitAtZero .
self assert: (ar first =( IntervalUnion with: e with: (RealInterval inf: (-1/2) sup: 0)) ).
self assert: (ar second =( IntervalUnion with: g with: (RealInterval inf: 0 sup: (1/2))) ).
self assert: (x split:0) =ar.
self assert: (x split: Float infinity) =(Array with: x with: empty).
self assert: (x split: Float infinity negated) =(Array with: empty with: x).
x:=(IntervalUnion with: a copy with: e copy).
ar:=x splitAtZero.
self assert: x negated splitAtZero reverse negated= ar.
self assert: (x split: (-3/4))=ar.
self assert: (x split: 0)=ar.
