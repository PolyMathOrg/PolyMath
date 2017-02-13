util
range: anArray size: anInteger type: string
^anArray isNumber 
	ifTrue: [Array new: anInteger withAll: anArray ] 
	ifFalse: [anArray isCollection 
		ifTrue: [anArray size=anInteger 
			ifTrue: [anArray]
			ifFalse: [self error:  'minimum or maximum values dont have correct sizes'] ] 
		ifFalse: [self error: (string, ' values is no collection or number')]].