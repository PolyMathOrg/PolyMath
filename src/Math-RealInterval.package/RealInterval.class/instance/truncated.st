truncation
truncated
|i|
self isEmpty ifTrue: [ ^RealInterval new ].
i:=self isFinite  
	ifTrue: [ IntervalUnion withAll: (inf truncated to: sup truncated) ] 
	ifFalse:[( i:= inf isInfinite 
		ifTrue:  [ self copy sup: (self sup isInfinite ifTrue: [ sup ] ifFalse:[ sup truncated]); yourself ]
		ifFalse: [ self copy inf: self inf truncated; yourself ]) comments:'onlyIntegers'; yourself ].
^(i isIntervalUnion and: [i size=1]) ifTrue: [ i first ] ifFalse: [ i ]
