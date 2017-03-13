private
randomSize: anInteger maxNumber: aMaxNumber
	"Creates a vector of rand numbers from 0 to aMaxNumber."
	|a|
	a := self new: anInteger.
	1 to: a size do: [ :n | a at: n put: (aMaxNumber random)].
	^a