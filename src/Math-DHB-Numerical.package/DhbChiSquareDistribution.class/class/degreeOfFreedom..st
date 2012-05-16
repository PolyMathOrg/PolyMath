creation
degreeOfFreedom: anInteger
		"Create a new instance of the receiver with given degree of freedom.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^anInteger > 40
		ifTrue: [ DhbAsymptoticChiSquareDistribution degreeOfFreedom: anInteger]
		ifFalse:[ super shape: anInteger / 2 scale: 2]