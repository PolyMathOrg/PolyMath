transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	dof1 := ( dof1 + ( aVector at: 1)) max: 1.
	dof2 := ( dof2 + ( aVector at: 2)) max: 1.
	self computeNorm.
	chiSquareDistribution1 := nil.
	chiSquareDistribution2 := nil.
	incompleteBetaFunction := nil.