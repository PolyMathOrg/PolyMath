private
zeros: anInteger
	"Creates a vector of zeros."
	|a|
	a := PMVector new: anInteger.
	1 to: a size do: [ :n | a at: n put: 0].
	^a