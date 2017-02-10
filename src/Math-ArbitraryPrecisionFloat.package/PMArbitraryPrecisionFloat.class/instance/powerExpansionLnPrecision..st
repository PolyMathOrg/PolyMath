private
powerExpansionLnPrecision: precBits
	"Evaluate the neperian logarithm of the receiver by power series expansion.
	For quadratic convergence, use:
	ln ((1+y)/(1-y)) = 2 y (1 + y^2/3 + y^4/5 + ... ) = 2 ar tanh( y )
	(1+y)/(1-y) = self => y = (self-1)/(self+1)
	This algorithm is interesting when the receiver is close to 1"
	
	| one |
	one := self one.
	^((self - one)/(self + one) powerExpansionArTanhPrecision: precBits) timesTwoPower: 1