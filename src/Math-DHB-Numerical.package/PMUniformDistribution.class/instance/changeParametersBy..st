transformation
changeParametersBy: aVector
		"Modify the parameters of the receiver by aVector."
	lowLimit := lowLimit + ( aVector at: 1).
	highLimit := highLimit + ( aVector at: 2)