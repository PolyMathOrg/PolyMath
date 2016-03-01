creation
point: aNumber count: anInteger
	
	^ self
		point: aNumber @ anInteger
		weight:
			(anInteger > 0
				ifTrue: [ 1 / anInteger ]
				ifFalse: [ 1 ])