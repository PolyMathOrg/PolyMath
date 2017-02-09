information
randomCoefficientsForLargeAlpha
	"Private"
	randomCoefficients isNil
		ifTrue: [ randomCoefficients := self initializeRandomCoefficientsForLargeAlpha].
	^randomCoefficients