creation
degreeOfFreedom: anInteger 
	"Create a new instance of the receiver with anInteger degrees of freedom."

	^anInteger > self asymptoticLimit 
		ifTrue: [PMNormalDistribution new]
		ifFalse: 
			[anInteger = 1 
				ifTrue: [PMCauchyDistribution shape: 0 scale: 1]
				ifFalse: [super new initialize: anInteger]]