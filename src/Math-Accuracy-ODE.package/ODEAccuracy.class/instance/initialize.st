as yet unclassified
initialize
	dt := 0.005.
	function :=  [:x :t | (t ** 4) * (t sin ** (2 * t cos)) * ( (2 * t negated) * (2 * t sin) * (t sin log) + t * (2 * t cos) * (t tan reciprocal) + 5)].
	"function := [ :x :t | 3 * t exp negated exp - (0.4 * x) + (2 * t * x exp exp) ]."
	startState := 0.
	startTime := 0.01.
	endTime := Float halfPi 