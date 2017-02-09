private
incompleteBetaFunction
	"Private - Answers the incomplete beta function used to compute the symmetric acceptance integral of the receiver. "

	incompleteBetaFunction isNil 
		ifTrue: 
			[incompleteBetaFunction := PMIncompleteBetaFunction shape: dof2 / 2
						shape: dof1 / 2].
	^incompleteBetaFunction