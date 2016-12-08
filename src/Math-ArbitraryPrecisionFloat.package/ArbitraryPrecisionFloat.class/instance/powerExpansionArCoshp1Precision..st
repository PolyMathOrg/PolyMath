private
powerExpansionArCoshp1Precision: precBits
	"Evaluate arcosh(x+1)/sqrt(2*x) for the receiver x by power series expansion.
	The algorithm is interesting when the receiver is close to zero"
	
	| one two count count2 sum term term1 term2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	count2 := one copy.
	sum := one copy.
	term1 := one copy.
	term2 := one copy.
	
	[term1 inPlaceMultiplyBy: self.
	term1 inPlaceNegated.
	term2 inPlaceMultiplyBy: count2.
	term2 inPlaceMultiplyBy: count2.
	term2 inPlaceDivideBy: count.
	count inPlaceAdd: one.
	count2 inPlaceAdd: two.
	term2 inPlaceDivideBy: count2.
	term2 inPlaceTimesTwoPower: -2.
	term := term1 * term2.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum