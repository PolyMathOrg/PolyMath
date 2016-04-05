creation
points: aDataHolder function: aParametricFunction
	^aParametricFunction isNil
		ifTrue: [nil]
		ifFalse: [self new initialize: aDataHolder data: aParametricFunction]