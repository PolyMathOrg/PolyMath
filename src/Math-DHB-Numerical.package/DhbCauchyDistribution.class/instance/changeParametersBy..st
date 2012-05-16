transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	mu := mu + ( aVector at: 1).
	beta := beta + ( aVector at: 2).