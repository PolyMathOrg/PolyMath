privateMethods
setUp
	"Reset the seed of the random numbers (to get consistent results)"
	DhbMitchellMooreGenerator reset: 0.
	"Reset the FloatingPointMachine to make coverage consistent"
	DhbFloatingPointMachine reset.