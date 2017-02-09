initialization
initializeIdentity: anInteger
	"Build components for an identity matrix."
	rows := ( 1 to: anInteger) asPMVector collect: [ :n | (PMVector new: anInteger) atAllPut: 0; at: n put: 1; yourself].