private
powerExpansionArcTanPrecision: precBits
	"Evaluate the arc tangent of the receiver by power series expansion.
	arcTan (x) = x (1 - x^2/3 + x^4/5 - ... ) for -1 < x < 1
	The algorithm is interesting when the receiver is close to zero"
	
	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum