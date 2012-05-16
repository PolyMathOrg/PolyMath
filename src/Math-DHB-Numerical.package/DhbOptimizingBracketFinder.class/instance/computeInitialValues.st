operation
computeInitialValues
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

	[bestPoints size < 2] whileTrue: [self addPointAt: Number random]