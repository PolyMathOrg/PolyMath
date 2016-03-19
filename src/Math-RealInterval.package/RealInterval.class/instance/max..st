comparing
max: anObject
	^anObject isRealInterval
		ifFalse: [(anObject isNumber) 
			ifTrue: [
				anObject isInfinite 
					ifTrue: [ ^(anObject >0) ifTrue: [ Float infinity ] ifFalse: [ self ] ] 
					ifFalse: [ self adaptToNumber: anObject andSend: #max:] ] 
			ifFalse:[(anObject isIntervalUnion)
				ifTrue: [ anObject max: self ] 
				ifFalse: [ self error: 'max:'] ]]
		ifTrue: [ (self isEmpty or:[anObject isEmpty])
			ifTrue:  [ RealInterval new ] 
			ifFalse: [  RealInterval inf: (inf max: anObject inf) sup:(sup max:anObject sup) ] ]
