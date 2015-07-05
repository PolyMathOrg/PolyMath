initialization
initializeRows: anArrayOrVector
	"Defines the components of the recevier. No check is made: components are assumed to be orgainized in rows."
	rows := anArrayOrVector asDhbVector collect: [ :each | each asDhbVector].