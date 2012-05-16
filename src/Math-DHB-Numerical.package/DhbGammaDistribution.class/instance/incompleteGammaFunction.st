information
incompleteGammaFunction
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "

	incompleteGammaFunction isNil 
		ifTrue: 
			[incompleteGammaFunction := DhbIncompleteGammaFunction shape: alpha].
	^incompleteGammaFunction