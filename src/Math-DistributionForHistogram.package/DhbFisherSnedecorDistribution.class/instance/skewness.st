information
skewness
	"Answer the skewness of the receiver."

	^dof2>6 ifTrue:[((2*dof1 + dof2 -2)*(8*(dof2-4)) sqrt)/((dof2 - 6)*((dof1 * (dof1 + dof2 -2)) sqrt)) ] ifFalse:[nil]