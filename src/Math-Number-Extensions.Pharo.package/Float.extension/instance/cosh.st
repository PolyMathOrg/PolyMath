*Math-Number-Extensions-mathematical functions
cosh
	"Answer receivers hyperbolic cosine."
	
	| ex |
	ex := self exp.
	^(ex + ex reciprocal) / 2