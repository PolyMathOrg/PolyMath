running
setUp
	"Reset the seed of the random numbers (to get consistent results)"

	PMMitchellMooreGenerator reset: 0.
	"Reset the FloatingPointMachine to make coverage consistent"
	PMFloatingPointMachine reset.
	f := [ :x :a :b | (a * x) sin / (b + x squared) ].
	col := (-4 to: 4 by: 0.1) collect: [ :i | i @ (f cull: i cull: 0.1 cull: 0.4) ]