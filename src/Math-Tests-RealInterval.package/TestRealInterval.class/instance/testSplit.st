tests - converting
testSplit
|x old|
x:=a splitAtZero.
self assert: (x at:1)=empty.
self assert: (x at:2)=a.
self assert: (a split:0)isNil.
x:=a negated splitAtZero.
self assert: (x at:2 )=empty.
self assert: (x at:1)=a negated .
self assert: (a negated split:0)=nil.
x:=b splitAtZero.
self assert: (x at:1)=a negated .
self assert: (x at:2)=a.
self assert: (b split:0)=x.
x:=d splitAtZero.
self assert: (x at:1)=(RealInterval inf: -1 sup: 0).
self assert: (x at:2)=(RealInterval inf: 0 sup: 8).

x:=a split:2.
self assert: (x at:1)=(RealInterval inf: 0 sup: 2).
self assert: (x at:2)=(RealInterval inf: 2 sup: Float infinity ).
self assert: (a split:1)=a split.
x:=a split: Float infinity.
self assert: x isNil.
"self assert: (x at:2)=empty ."
x:=d split: -1.
self assert: x isNil.
"self assert: (x at:2)=d."
x:=d split:3.
self assert: (x at:1)=(RealInterval inf: -1 sup: 3).
self assert: (x at:2)=(RealInterval inf: 3 sup: 8).
x:=d split: 8.
self assert: x isNil.
x:=d split:8.2.
self assert: x isNil .
old:= c class consistsOfFloatsOnly .
c class consistsOfFloatsOnly:true.
c sup: 1.0 successor .
x:= c split:1.
self assert: (x at:1) =1.
self assert: (x at:2) =1.0 successor .
c sup: 1.0 .
self assert: (c split:1) isNil.
c class consistsOfFloatsOnly:false.
self assert: (c split:1) isNil.
c class consistsOfFloatsOnly: old .


