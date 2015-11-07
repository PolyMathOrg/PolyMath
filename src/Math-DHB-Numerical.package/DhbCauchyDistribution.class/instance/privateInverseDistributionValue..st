information
privateInverseDistributionValue: aNumber
		"Private - Answer the number whose acceptance is aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	^aNumber =0 
		ifTrue:[Float infinity negated] 
		ifFalse: [aNumber =1 
			ifTrue:[Float infinity ] 
			ifFalse:[( ( aNumber - (1 / 2)) * Float pi) tan * beta + mu]].