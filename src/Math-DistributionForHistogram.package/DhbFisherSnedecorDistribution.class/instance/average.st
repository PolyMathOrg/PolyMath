information
average

	^dof2 > 2
		ifTrue: [ dof2 / ( dof2 - 2)]
		ifFalse:[ nil]