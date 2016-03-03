transformation
reset
	"Set all accumulators to zero."
	super reset.
	covariance do: [ :each | each atAllPut: 0].