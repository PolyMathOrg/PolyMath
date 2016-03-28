operation
finalizeIterations
	"Transfer the eigenValues into a vector and set this as the result.
		 eigen values and transform matrix are sorted using a bubble sort.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "

	| n |
	n := 0.
	result := lowerRows collect: 
					[:each | 
					n := n + 1.
					each at: n].
	self sortEigenValues