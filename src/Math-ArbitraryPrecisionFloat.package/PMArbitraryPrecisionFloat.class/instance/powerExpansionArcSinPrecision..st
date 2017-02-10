private
powerExpansionArcSinPrecision: precBits
	"Evaluate the arc sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"
	
	| one x2 two count sum term |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceMultiplyBy: count.
	term inPlaceDivideBy: count + one.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum