initialization
standard
	standard
		ifNil: [ standard := [ :t | t ** 5 * (t sin ** (2 * t cos)) - 0.000888511 ] value: endTime ]. 
	^ standard