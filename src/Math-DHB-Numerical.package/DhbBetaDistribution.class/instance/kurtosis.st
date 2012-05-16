information
kurtosis
		"Answer the kurtosis of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	^3 * ( alpha1 + alpha2 + 1) * ( (alpha1 + alpha2) squared * 2 + ( ( alpha1 + alpha2 - 6) * alpha1 * alpha2)
			/ ( ( alpha1 + alpha2 + 2) * ( alpha1 + alpha2 + 3) * alpha1 * alpha2)) - 3