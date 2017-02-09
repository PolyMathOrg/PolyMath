creation
new
	"Answer a unique instance. Create it if it does not exist."
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new.
					 UniqueInstance initialize ].
	^UniqueInstance