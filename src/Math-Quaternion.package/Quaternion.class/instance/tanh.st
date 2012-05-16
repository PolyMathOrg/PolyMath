mathematical functions
tanh
	"Answer the hyperbolic tangent"

	| ep em |
	ep := self exp.
	em := self negated exp.
	^(ep - em) / (ep + em)