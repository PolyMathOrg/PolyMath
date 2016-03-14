information
setEndPointDerivatives: anArray
		"Defines the end point derivatives.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/4/99 "
	startPointDerivative := anArray at: 1.
	endPointDerivative := anArray at: 2.
	self resetCoefficients.