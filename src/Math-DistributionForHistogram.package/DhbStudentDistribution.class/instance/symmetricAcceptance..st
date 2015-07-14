information
symmetricAcceptance: aNumber
		"Private - Compute the acceptance of the receiver between -aNumber and aNumber
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "
	^ self incompleteBetaFunction value: ( degreeOfFreedom / ( aNumber squared + degreeOfFreedom))