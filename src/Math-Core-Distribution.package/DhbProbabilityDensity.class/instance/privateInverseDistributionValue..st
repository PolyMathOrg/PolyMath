information
privateInverseDistributionValue: aNumber
		"Private - Answer the number whose distribution is aNumber.
		 NOTE: Subclass may overwrite this method for faster computation.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( DhbNewtonZeroFinder function: [ :x | ( self distributionValue: x) - aNumber] derivative: self)
		initialValue: self average / (1 - aNumber); evaluate