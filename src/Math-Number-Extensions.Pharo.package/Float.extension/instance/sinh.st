*Math-Number-Extensions-mathematical functions
sinh
	"Answer receivers hyperbolic sine"
	
	| ex |
	ex := self exp.
	^(ex - ex reciprocal) / 2