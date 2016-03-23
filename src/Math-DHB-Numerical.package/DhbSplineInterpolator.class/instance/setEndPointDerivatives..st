information
setEndPointDerivatives: anArray
	"Defines the end point derivatives."
	startPointDerivative := anArray at: 1.
	endPointDerivative := anArray at: 2.
	self resetCoefficients.