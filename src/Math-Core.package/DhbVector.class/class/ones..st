private
ones: anInteger
	"Creates a vector of ones."
	|a|
	a := DhbVector new: anInteger.
	1 to: a size do: [ :n | a at: n put: 1].
	^a