operation
computeChanges
		"Private"
	errorMatrix := DhbLUPDecomposition direct: equations.
	^(errorMatrix solve: constants)ifNil:[SingularMatrixError new signal:'singular Errormatrix']