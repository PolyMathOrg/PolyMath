initialization
initialize: anArrayOfArrays constants: anArrayOfConstantArrays
	"Private - Initialize the receiver with system's matrix in anArrayOfArrays and several constants."
	| n |
	n := 0.
	rows := anArrayOfArrays collect: [ :each | n := n + 1. each, (anArrayOfConstantArrays collect: [ :c | c at: n])].
	^ self