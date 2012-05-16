transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 13/4/99 "
	super changeParametersBy: (Array with: aVector first / 2 with: 0).