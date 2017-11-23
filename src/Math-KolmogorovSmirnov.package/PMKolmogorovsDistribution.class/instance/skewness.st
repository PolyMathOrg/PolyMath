information
skewness
	| p s |
	p := distribution parameters.
	s := p sum.
	^ (p second - p first) * 2 / (s + 2) * ((s + 1) / (p first * p second)) sqrt