initialization
initialize: anInteger
	"Build empty components for a square matrix. No check is made: components are assumed to be orgainized in rows."
	rows := (1 to: anInteger) asPMVector collect: [ :each | PMVector new: anInteger].