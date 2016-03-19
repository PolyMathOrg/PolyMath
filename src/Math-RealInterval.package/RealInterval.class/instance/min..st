comparing
min: anObject
	^anObject isRealInterval
		ifFalse: [anObject isNumber 
			ifTrue: [
				anObject isInfinite 
					ifTrue: [ ^(anObject >0) ifTrue: [ self ] ifFalse: [ Float infinity negated] ] 
					ifFalse: [self adaptToNumber: anObject  andSend: #min:] ]
			ifFalse:[(anObject isIntervalUnion)
				ifTrue: [ anObject min: self ] 
				ifFalse: [ self error: 'min:'] ]]
		ifTrue: [ (self isEmpty or:[anObject isEmpty])
			ifTrue:  [ RealInterval new ] 
			ifFalse: [  RealInterval inf: (inf min: anObject inf) sup:(sup min:anObject sup) ] ]
