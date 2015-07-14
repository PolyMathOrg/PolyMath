transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	alpha1 := alpha1 + ( aVector at: 1).
	alpha2 := alpha2 + ( aVector at: 2).
	self computeNorm.
	gamma1 := nil.
	gamma2 := nil.
	incompleteBetaFunction := nil.