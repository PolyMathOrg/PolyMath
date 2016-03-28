operation
initializeIterations
	"Initialize the iterations (subclasses must write their own method and call this one last).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	eigenvector := DhbVector new: matrix numberOfRows.
	eigenvector atAllPut: 1.0.
	transposeEigenvector := DhbVector new: eigenvector size.
	transposeEigenvector atAllPut: 1.0