creation
degreeOfFreedom: anInteger 
	"Create a new instance of the receiver with anInteger degrees of freedom.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "

	^anInteger > self asymptoticLimit 
		ifTrue: [DhbNormalDistribution new]
		ifFalse: 
			[anInteger = 1 
				ifTrue: [DhbCauchyDistribution shape: 0 scale: 1]
				ifFalse: [super new initialize: anInteger]]