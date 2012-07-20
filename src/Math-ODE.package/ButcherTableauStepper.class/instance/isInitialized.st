as yet unclassified
isInitialized
	self assert: [stageCoefficients notNil].
	self assert: [stageIncrements notNil].
	self assert: [stageWeights notNil].
	self assert: [system notNil].
	^ self