transformation
sum
	"Computes the row sum."
	|a|
	a := PMVector new: self numberOfRows .
	1 to: a size do: [ :n | a at: n put:((self rowAt: n) sum)] .
	^a