operation
computeChanges
		"Private"
	errorMatrix := PMLUPDecomposition direct: equations.
	^(errorMatrix solve: constants)ifNil:[SingularMatrixError new signal:'singular Errormatrix']