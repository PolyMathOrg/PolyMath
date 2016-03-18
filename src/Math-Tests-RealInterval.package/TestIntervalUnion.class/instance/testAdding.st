tests - adding
testAdding
i add:1.
self assert:i first isNumber .
i addAll:  {-2.c} asSet.	
self assert: (i at:2)=c.
self assert: (i at:1)= -2.
i addAll:  x.
self assert: (i at:1)= -2 .
self assert: (i at:2)= e .
self assert: (i at:3)=0.
self assert: (i at:4)=(g union: c).
self assert: i size=4.
i add:  a.
self assert: (i at:3)=a.
i add:  e.
self assert: i size=3.
i add:  d.
self assert: i size=2.
self assert: ((i at:2)=(RealInterval inf: (-5/4) sup: Float infinity)).
i:=IntervalUnion  with:0.
i add:empty.
self assert: i size=1.
self assert: i first=z.
i addAll:  {empty.a}.
i addAll:  {c.empty.a}.
self assert: i size=1.
self assert: i first=a.
i