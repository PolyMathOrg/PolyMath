information
incompleteBetaFunction
	"Private - Answers the incomplete beta function used to compute
		 the symmetric acceptance integral of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "

	incompleteBetaFunction isNil 
		ifTrue: 
			[incompleteBetaFunction := DhbIncompleteBetaFunction shape: dof2 / 2
						shape: dof1 / 2].
	^incompleteBetaFunction