operation
computeChanges
		"Private"
	errorMatrix := PMLUPDecomposition direct: equations.
	^(errorMatrix solve: constants)ifNil:[PMSingularMatrixError new signal:'singular Errormatrix']