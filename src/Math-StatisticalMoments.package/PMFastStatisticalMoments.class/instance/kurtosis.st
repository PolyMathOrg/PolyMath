information
kurtosis
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/6/99 "

	| var x1 x2 x3 x4 kFact kConst n m4 xSquared |
	n := self count.
	n < 4 ifTrue: [^nil].
	var := self variance.
	var = 0 ifTrue: [^nil].
	x1 := (moments at: 2) / n.
	x2 := (moments at: 3) / n.
	x3 := (moments at: 4) / n.
	x4 := (moments at: 5) / n.
	xSquared := x1 squared.
	m4 := x4 - (4 * x1 * x3) + (6 * x2 * xSquared) - (xSquared squared * 3).
	kFact := n * (n + 1) / (n - 1) / (n - 2) / (n - 3).
	kConst := 3 * (n - 1) * (n - 1) / (n - 2) / (n - 3).
	^kFact * (m4 * n / var squared) - kConst