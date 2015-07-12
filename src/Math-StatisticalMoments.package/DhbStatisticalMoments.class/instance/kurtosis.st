information
kurtosis
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/5/99 "

	| n n1 n23 |
	n := self count.
	n < 4 ifTrue: [^nil].
	n23 := (n - 2) * (n - 3).
	n1 := n - 1.
	^((moments at: 5) * n squared * (n + 1) / (self variance squared * n1) 
		- (n1 squared * 3)) / n23