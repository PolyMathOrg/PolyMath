private
powerExpansionSinCosPrecision: precBits
	"Evaluate the sine and cosine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"
	
	| count one sin cos term |
	one := self one.
	count := one copy.
	cos := one copy.
	sin := self copy.
	term := self copy.
	
	[count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: self;
		inPlaceDivideBy: count;
		inPlaceNegated.
	cos inPlaceAdd: term.

	count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: self;
		inPlaceDivideBy: count.
	sin inPlaceAdd: term.
	
	term exponent + precBits < sin exponent] whileFalse.
	^Array with: sin with: cos