testing-hyperbolic
testArCosh
	<timeout: 5 "seconds">
	| serie |
	serie := ((1 to: 10) , #(1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arCosh