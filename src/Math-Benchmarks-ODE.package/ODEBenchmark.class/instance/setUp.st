running
setUp
	dt := 0.09.
	function :=  [:x :t | (t ** 4) * (t sin ** (2 * t cos)) * ( (2 * t negated) * (2 * t sin) * (t sin log) + 
		t * (2 * t cos) * (t tan reciprocal) + 5)].
	startState := 0.
	startTime := 0.3 .
	endTime := Float halfPi 