information
machinePrecision
	
	machinePrecision isNil
		ifTrue: [ self computeMachinePrecision].
	^machinePrecision