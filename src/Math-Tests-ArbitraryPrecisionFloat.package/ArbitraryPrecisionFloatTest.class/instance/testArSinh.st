testing-hyperbolic
testArSinh
	<timeout: 10 "seconds">
	| serie |
	serie := ((-5 to: 10) , #(1.0e-20 1.0e-10  0.9999 1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arSinh