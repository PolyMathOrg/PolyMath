transformation
sum
	"Compute the sum of a vector."
	|a|
	a := 0.
	1 to: self size do: [ :n | a := a + self at: n].
	^a.