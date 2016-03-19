truncation
floor
|i|
self isEmpty ifTrue: [ ^RealInterval new ].
i:=self isFinite  
	ifTrue: [ IntervalUnion withAll: (inf floor to: sup floor) ] 
	ifFalse:[( i:= inf isInfinite 
		ifTrue:  [ self copy sup: (self sup isInfinite ifTrue: [ sup ] ifFalse:[ sup floor]); yourself ]
		ifFalse: [ self copy inf: self inf floor; yourself ]) comments:'onlyIntegers'; yourself ].
^(i isIntervalUnion and: [i size=1]) ifTrue: [ i first ] ifFalse: [ i ]
