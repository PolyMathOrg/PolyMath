private
powerExpansionSinhPrecision: precBits
	"Evaluate the hyperbolic sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"
	
	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := self copy.
	term := self copy.
	x2 := self squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum