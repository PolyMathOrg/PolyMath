truncation
rounded
|i|
self isEmpty ifTrue: [ ^RealInterval new ].
i:=self isFinite  
	ifTrue: [ IntervalUnion withAll: (inf rounded to: sup rounded)] 
	ifFalse:[( i:= inf isInfinite 
		ifTrue:  [ self copy sup: (self sup isInfinite ifTrue: [ sup ] ifFalse:[ sup rounded]); yourself ]
		ifFalse: [ self copy inf: self inf rounded; yourself ]) comments:'onlyIntegers'; yourself ].
^(i isIntervalUnion and: [i size=1]) ifTrue: [ i first ] ifFalse: [ i ]
