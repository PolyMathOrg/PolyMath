private
backwardSubstitution: anArray
	"Private"
	| n sum answer |
	n := rows size.
	answer := DhbVector new: n.
	n to: 1 by: -1 do:
		[ :i |
		  sum := anArray at: i.
		  ( i + 1) to: n do: [ :j | sum := sum - ( ( ( rows at: i) at: j) * ( answer at: j))].
		  answer at: i put: sum / ( ( rows at: i) at: i).
		].
	^answer