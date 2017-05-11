operation
tr
	"Return the trace or sum along diagonals of the array."
	"https://en.wikipedia.org/wiki/Trace_(linear_algebra)"

	| result |
	result := 0.
	1 to: self numberOfRows do: [ :n | result := result + (self at: n at: n) ].
	^ result