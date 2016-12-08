private
inPlaceSqrt
	"Replace the receiver by its square root."

	| guess guessSquared delta shift |
	self negative 
		ifTrue: 
			[^ DomainError signal: 'sqrt undefined for number less than zero.'].
	self isZero ifTrue: [^self].

	shift := 2 * nBits - mantissa highBit.
	biasedExponent := biasedExponent - shift.
	biasedExponent odd
		ifTrue:
			[shift := shift + 1.
			biasedExponent := biasedExponent - 1].
	mantissa := mantissa bitShift: shift.
	guess := mantissa bitShift: mantissa highBit + 1 // 2.
	[
		guessSquared := guess * guess.
		delta := guessSquared - mantissa quo: (guess bitShift: 1).
		delta = 0 ] whileFalse:
			[ guess := guess - delta ].
	guessSquared = mantissa
		ifFalse:
			[(guessSquared - guess - mantissa) negative ifFalse: [guess := guess - 1]].
	mantissa := guess.
	biasedExponent := biasedExponent quo: 2.
	self round	