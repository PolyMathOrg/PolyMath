information
digits
	"Private"

	Digits isNil
		ifTrue: [ Digits := self defaultDigits ].
	^ Digits