initialization
initialize: aDataHolder data: aParametricFunction
	(aDataHolder isCollection and: [aDataHolder allSatisfy: [:aPoint| aPoint isPoint]])
			ifTrue:  [dataHolder:= aDataHolder as: DataHolder ]
			ifFalse: [self error: 'DataHolder must be a Collection of Points'].
	dataHolder size < aParametricFunction parameterSize ifTrue:[self error: 'Problem is underdeterminated. aDataHolders size to small'].
	result := aParametricFunction.
	self finalizeIterations.
	^self