operation
trace
	"computes the trace of a square matrix"
	|result|	
	result := 0.
	1 to: self numberOfRows do: [ :n | result := result + (self at:n at:n) ].
	^result.
	
	