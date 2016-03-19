comparing
=anObject 
^anObject isIntervalUnion 
	ifTrue: [ self hasEqualElements: anObject ] 
	ifFalse: [ (self size=1) 
		ifTrue:[ anObject = self first ]
		ifFalse:[self isEmpty and:[anObject isRealInterval and:[anObject isEmpty]]]]
