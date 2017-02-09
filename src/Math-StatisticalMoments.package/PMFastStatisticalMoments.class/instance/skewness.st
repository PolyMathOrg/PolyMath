information
skewness
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/6/99 "

	| x1 x2 x3 n stdev |
	n := self count.
	n < 3 ifTrue: [^nil].
	stdev := self standardDeviation.
	stdev = 0 ifTrue: [^nil].
	x1 := (moments at: 2) / n.
	x2 := (moments at: 3) / n.
	x3 := (moments at: 4) / n.
	^(x3 - (3 * x1 * x2) + (2 * x1 * x1 * x1)) * n * n 
		/ (stdev squared * stdev * (n - 1) * (n - 2))