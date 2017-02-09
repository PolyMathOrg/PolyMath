information
skewness
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/5/99 "

	| n v |
	n := self count.
	n < 3 ifTrue: [^nil].
	v := self variance.
	^(moments at: 4) * n squared / ((n - 1) * (n - 2) * (v sqrt * v))