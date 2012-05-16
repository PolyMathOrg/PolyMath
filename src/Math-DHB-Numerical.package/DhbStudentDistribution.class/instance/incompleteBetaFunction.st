information
incompleteBetaFunction
	"Private - Answers the incomplete beta function used to compute
		 the symmetric acceptance integral of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "

	incompleteBetaFunction isNil 
		ifTrue: 
			[incompleteBetaFunction := DhbIncompleteBetaFunction 
						shape: degreeOfFreedom / 2
						shape: 0.5].
	^incompleteBetaFunction