initialization
initialize
		"Private - Initialize constants needed to evaluate the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/1/99 "
	constant := 0.2316419.
	norm := 1 / ( Float pi * 2) sqrt.
	series := DhbPolynomial coefficients: #( 0.31938153 -0.356563782 1.781477937 -1.821255978 1.330274429).