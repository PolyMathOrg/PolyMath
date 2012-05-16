operation
computeInitialValues
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	step := to - from.
	sum := ( ( functionBlock value: from) + ( functionBlock value: to)) * step /2.
	result := sum.