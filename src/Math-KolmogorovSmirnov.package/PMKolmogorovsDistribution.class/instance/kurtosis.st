information
kurtosis
	| p s |
	p := distribution parameters.
	s := p sum.
	^ (s + 1) * 3 / (s + 3) * ((p second - p first) squared * 2 / ((s + 2) * p first * p second) + 1)