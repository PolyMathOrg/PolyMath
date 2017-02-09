information
incompleteGammaFunction
	"Private"

	incompleteGammaFunction isNil 
		ifTrue: 
			[incompleteGammaFunction := PMIncompleteGammaFunction shape: alpha].
	^incompleteGammaFunction