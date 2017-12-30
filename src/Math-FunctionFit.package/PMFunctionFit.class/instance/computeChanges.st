operation
computeChanges
	^[super computeChanges]on: PMSingularMatrixError  do:[:signal|signal messageText: 'singular error matrix, set better parameters'.signal pass]