information
incompleteGammaFunction
	"Private"

	incompleteGammaFunction isNil 
		ifTrue: 
			[incompleteGammaFunction := DhbIncompleteGammaFunction shape: alpha].
	^incompleteGammaFunction