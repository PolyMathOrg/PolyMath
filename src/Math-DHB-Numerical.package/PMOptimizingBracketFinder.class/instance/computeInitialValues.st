operation
computeInitialValues
	[bestPoints size < 2] whileTrue: [self addPointAt: Number random]