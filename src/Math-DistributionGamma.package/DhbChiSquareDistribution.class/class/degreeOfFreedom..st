creation
degreeOfFreedom: anInteger
	"Create a new instance of the receiver with given degree of freedom."

	^ anInteger > 40
		ifTrue: [ DhbAsymptoticChiSquareDistribution degreeOfFreedom: anInteger ]
		ifFalse: [ super shape: anInteger / 2 scale: 2 ]