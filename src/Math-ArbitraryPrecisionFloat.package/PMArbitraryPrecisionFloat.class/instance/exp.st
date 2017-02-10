mathematical functions
exp
	"Answer the exponential of the receiver."

	| ln2 x q r ri res n maxIter p one two |
	one := self one.
	two := one timesTwoPower: 1.
	"Use following decomposition:
		x exp = (2 ln * q + r) exp.
		x exp = (2**q * r exp)"
	ln2 := two ln.
	x := self / ln2.
	q := x truncated.
	r := (x - q) * ln2.

	"now compute r exp by power series expansion
	we compute (r/(2**p)) exp ** (2**p) in order to have faster convergence"
	p := 10 min: nBits // 2.
	r := r timesTwoPower: p negated.
	ri := one asArbitraryPrecisionFloatNumBits: nBits + 16.
	res := ri copy.
	n := 0.
	maxIter := 1 + ((nBits + 16) / p) ceiling.
	[n <= maxIter] whileTrue: 
			[n := n + 1.
			ri inPlaceMultiplyBy: r / n.
			res inPlaceAdd: ri].
	p timesRepeat: [res inPlaceMultiplyBy: res].
	res inPlaceTimesTwoPower: q.

	"now use a Newton iteration to refine the result
	res = res * (self - res ln + 1)"
	[| oldres delta |
	oldres := res.
	res := res asArbitraryPrecisionFloatNumBits: res numBits + 32.
	res inPlaceMultiplyBy: self - res ln + 1.
	delta := (res - oldres) exponent.
	delta = 0 or: [delta <= (res exponent - nBits - 8)]] 
			whileFalse.
	
	^res asArbitraryPrecisionFloatNumBits: nBits