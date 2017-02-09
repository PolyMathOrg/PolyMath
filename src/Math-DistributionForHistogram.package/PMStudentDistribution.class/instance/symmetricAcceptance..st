information
symmetricAcceptance: aNumber
	"Compute the acceptance of the receiver between -aNumber and aNumber"
	^ self incompleteBetaFunction value: ( degreeOfFreedom / ( aNumber squared + degreeOfFreedom))