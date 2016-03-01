information
negativeMachinePrecision
	
	negativeMachinePrecision isNil
		ifTrue: [ self computeNegativeMachinePrecision].
	^negativeMachinePrecision