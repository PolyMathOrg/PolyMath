testing-hyperbolic
testArTanh
	<timeout: 20 "seconds">
	| serie |
	serie := ((-19 to: 19) collect: [:e | (e / 20) asFloat]) , ((-6 to: 6) collect: [:e | (e / 7) asFloat]) , #(1.0e-20 1.0e-10 0.99 0.9999 0.999999).
	self checkDoublePrecisionSerie: serie forFunction: #arTanh