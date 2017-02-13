utils
integerDigitsFor: anInteger base: aBase
	| n integer next result |
	"n:=(anInteger ln / aBase ln) floor ." "does not always work because of floating point errors. next 2 lines are better"
	"aBase has to be greater than 1. there is no error-checking"
	n:=0.
	[n:=n+1. (aBase raisedToInteger: n)<=anInteger ]whileTrue.
	result := Array new: n.
	integer :=anInteger .
	n to: 1 by: -1 do: [:i |
		next := integer // aBase .
		result at: i put: (integer - (next * aBase)).
		integer := next].
	^result