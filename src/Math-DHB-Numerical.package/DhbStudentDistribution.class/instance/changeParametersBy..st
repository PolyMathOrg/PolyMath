transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	degreeOfFreedom := degreeOfFreedom + ( aVector at: 1).
	self computeNorm.