operation
computeChanges
	^[super computeChanges]on: SingularMatrixError  do:[:signal|signal messageText: 'singular error matrix, set better parameters'.signal pass]