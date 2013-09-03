running
setUp
	dt := 0.005.
	function := [ :x :t | 3 * t exp negated exp - (0.4 * x) + (2 * t * x exp exp) ].
	startState := 5.
	startTime := 0.
	endTime := 1.5