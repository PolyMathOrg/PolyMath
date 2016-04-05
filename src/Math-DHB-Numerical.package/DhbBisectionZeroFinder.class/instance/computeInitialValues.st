operation
computeInitialValues
		"Private"
	positiveX isNil
		ifTrue: [ self error: 'No positive value supplied'].
	negativeX isNil
		ifTrue: [ self error: 'No negative value supplied']