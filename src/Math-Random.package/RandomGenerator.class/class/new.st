instance creation
new
	"Answer a new instance of the receiver"

	^ (self seed: Time millisecondClockValue)
		initialize