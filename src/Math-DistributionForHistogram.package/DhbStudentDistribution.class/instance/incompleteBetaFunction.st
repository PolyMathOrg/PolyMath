information
incompleteBetaFunction
	"Private - Answers the incomplete beta function used to compute the symmetric acceptance integral of the receiver."

	incompleteBetaFunction isNil 
		ifTrue: 
			[incompleteBetaFunction := DhbIncompleteBetaFunction 
						shape: degreeOfFreedom / 2
						shape: 0.5].
	^incompleteBetaFunction