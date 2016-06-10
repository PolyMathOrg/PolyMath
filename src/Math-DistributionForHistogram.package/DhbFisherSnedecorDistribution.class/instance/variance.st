information
variance
	"Answer the variance of the receiver.  Undefined if dof2 is smaller than 5."

	^ dof2 > 4
		ifTrue: [ dof2 squared * 2 * (dof1 + dof2 - 2) / ((dof2 - 2) squared * dof1 * (dof2 - 4)) ]
		ifFalse: [ nil ]