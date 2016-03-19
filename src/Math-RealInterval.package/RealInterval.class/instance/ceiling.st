truncation
ceiling
|i|
self isEmpty ifTrue: [ ^RealInterval new ].
i:=self isFinite  
	ifTrue: [ IntervalUnion withAll: (inf ceiling to: sup ceiling)] 
	ifFalse:[( i:= inf isInfinite 
		ifTrue:  [ self copy sup: (self sup isInfinite ifTrue: [ sup ] ifFalse:[ sup ceiling]); yourself ]
		ifFalse: [ self copy inf: self inf ceiling; yourself ]) comments:'onlyIntegers'; yourself ].
^(i isIntervalUnion and: [i size=1]) ifTrue: [ i first ] ifFalse: [ i ]
