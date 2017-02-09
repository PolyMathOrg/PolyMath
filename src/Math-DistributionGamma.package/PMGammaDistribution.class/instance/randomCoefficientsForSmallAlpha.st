information
randomCoefficientsForSmallAlpha
	"Private"
	randomCoefficients isNil
		ifTrue: [ randomCoefficients := self initializeRandomCoefficientsForSmallAlpha].
	^randomCoefficients