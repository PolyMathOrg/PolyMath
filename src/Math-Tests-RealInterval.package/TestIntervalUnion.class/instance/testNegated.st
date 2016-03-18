tests - arithmetic
testNegated
self assert: i negated isEmpty .
i addAll:  {a.e} asSet.
i:=i negated .	
self assert: (i at:2)=e negated.
self assert: (i at:1)=a negated .
