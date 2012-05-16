information
variance
		"Answer the variance of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( normalDistribution average * 2 + normalDistribution variance) exp * ( normalDistribution variance exp - 1)