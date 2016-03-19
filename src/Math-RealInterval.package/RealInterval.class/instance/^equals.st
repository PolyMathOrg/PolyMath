comparing
= anObject
	^anObject isRealInterval
		ifFalse: [anObject isIntervalUnion 
			ifTrue: [anObject =self] 
			ifFalse:[anObject isNumber 
				ifTrue: [ self adaptToNumber: anObject  andSend: #= ] 
				ifFalse: [false]]]
		ifTrue: [  ((inf=anObject inf)and:[sup=anObject sup])or:[(self isEmpty and:[anObject isEmpty])] ]
