accessing
parameter: aParameter
	(aParameter isArray or: [ aParameter isNil ])
		ifFalse: [ self error: 'parameter must be an Array' ].
	(aParameter isArray and: [ aParameter size = 1 ])
		ifTrue: [ self error: 'parameter of size 1 is not possible' ].
	^ parameters at: self findKey put: aParameter 