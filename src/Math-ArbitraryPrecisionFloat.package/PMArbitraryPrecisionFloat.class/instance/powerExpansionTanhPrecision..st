private
powerExpansionTanhPrecision: precBits
	"Evaluate the hyperbolic tangent of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"
	
	| count one sum term pow two x2 seidel |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := one copy.
	pow := one copy.
	x2 := self squared.
	seidel := OrderedCollection new: 256.
	seidel add: 1.
	
	[pow inPlaceMultiplyBy: x2.
	pow inPlaceDivideBy: count * (count + one).
	pow inPlaceNegated.
	count inPlaceAdd: two.
	2 to: seidel size do: [:i | seidel at: i put: (seidel at: i-1) + (seidel at: i)].
	seidel addLast: seidel last.
	seidel size to: 2 by: -1 do: [:i | seidel at: i - 1 put: (seidel at: i-1) + (seidel at: i)].
	seidel addFirst: seidel first.
	term := pow * seidel first.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum