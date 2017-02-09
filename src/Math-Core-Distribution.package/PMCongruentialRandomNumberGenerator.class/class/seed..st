creation
seed: aNumber
	"Create a new instance of the receiver with given seed using D. Knuth's constants."
	^ super new initialize; setSeed: aNumber; yourself