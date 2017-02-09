creation
new
	"Create a new instance of the receiver with D. Knuth's constants."
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new initialize.
					 UniqueInstance setSeed: 1.
				   ].
	^UniqueInstance