private
forwardSubstitution: anArray
	"Private"
	| n sum answer|
	answer := permutation collect: [ :each | anArray at: each].
	n := rows size.
	2 to: n do:
		[ :i |
		  sum := answer at: i.
		  1 to: (i - 1) do: [ :j | sum := sum - (((rows at: i) at: j) * (answer at: j))].
		  answer at: i put: sum.
		].
	^answer