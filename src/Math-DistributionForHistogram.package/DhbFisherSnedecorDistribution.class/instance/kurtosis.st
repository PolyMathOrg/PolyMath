information
kurtosis
	"Answer the kurtosis of the receiver."

	^ dof2 > 8
		ifTrue: [ (dof1 * (5 * dof2 - 22) * (dof1 + dof2 - 2) + ((dof2 - 4) * (dof2 - 2) squared)) * 12
				/ (dof1 * (dof2 - 6) * (dof2 - 8) * (dof1 + dof2 - 2)) ]
		ifFalse: [ nil ]