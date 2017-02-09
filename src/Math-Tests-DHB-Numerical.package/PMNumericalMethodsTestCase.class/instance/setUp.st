privateMethods
setUp
	"Reset the seed of the random numbers (to get consistent results)"
	PMMitchellMooreGenerator reset: 0.
	"Reset the FloatingPointMachine to make coverage consistent"
	PMFloatingPointMachine reset.