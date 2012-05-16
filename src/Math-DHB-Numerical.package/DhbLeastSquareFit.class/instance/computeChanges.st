operation
computeChanges
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	errorMatrix := DhbLUPDecomposition direct: equations.
	^errorMatrix solve: constants