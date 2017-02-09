transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."
	dof1 := ( dof1 + ( aVector at: 1)) max: 1.
	dof2 := ( dof2 + ( aVector at: 2)) max: 1.
	self computeNorm.
	chiSquareDistribution1 := nil.
	chiSquareDistribution2 := nil.
	incompleteBetaFunction := nil.