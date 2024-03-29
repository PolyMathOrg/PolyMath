Class {
	#name : #PMComplexNumberTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #'testing - equality' }
PMComplexNumberTest >> testAPureImaginaryNumberIsNotEqualToZero [
	self deny: 1 i equals: 0.
	self deny: 0 equals: 1 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAbs [
	"self run: #testAbs"

	"self debug: #testAbs"

	| c |
	c := 6 - 6 i.
	self assert: c abs equals: 72 sqrt
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAbsSecure [
	"self run: #testAbsSecure"

	"using equalsTo since absSecure returns a slightly different Float"

	| c |
	c := 6 - 6 i.
	self assert: c absSecure closeTo: 72 sqrt
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingComplexNumbersToAnArrayOfIntegers [
	| c arrayOfIntegers expected |
	c := 6 - 6 i.
	arrayOfIntegers := #(0 1 2 3 4 5).

	expected := { 6 - 6 i . 7 - 6 i . 8 - 6 i . 9 - 6 i . 10 - 6 i . 11 - 6 i }.
	self assert: (arrayOfIntegers + c) equals: expected
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingFractionsAndComplexNumbers [
	self assert: 1 + 2 i + (2 / 3) equals: 5 / 3 + 2 i.
	self assert: 2 / 3 + (1 + 2 i) equals: 5 / 3 + 2 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingIntegersAndComplexNumbers [
	self assert: 1 + 2 i + 1 equals: 2 + 2 i.
	self assert: 1 + (1 + 2 i) equals: 2 + 2 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingRealNumbersAndComplexNumbers [
	self assert: 1 + 2 i + 1.0 equals: 2.0 + 2 i.
	self assert: 1.0 + (1 + 2 i) equals: 2.0 + 2 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingToAPolynomial [
	| c poly |
	c := 6 - 6 i.
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testAddingTwoComplexNumbers [
	| c |
	c := 5 - 6 i + (-5 + 8 i).	"Complex with Complex"
	self assert: c equals: 0 + 2 i
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArCosh [

	| c |
	c := 2.5 + 0 i.
	self assert: c arCosh real closeTo: c real arCosh.
	self assert: c arCosh imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arCosh cosh real closeTo: c real.
			self assert: c arCosh cosh imaginary closeTo: c imaginary.
			self deny: c arCosh real negative ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArSinh [

	| c |
	c := 2.5 + 0 i.
	self assert: c arSinh real closeTo: c real arSinh.
	self assert: c arSinh imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arSinh sinh real closeTo: c real.
			self assert: c arSinh sinh imaginary closeTo: c imaginary ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArTanh [

	| c |
	c := 0.5 + 0 i.
	self assert: c arTanh real closeTo: c real arTanh.
	self assert: c arTanh imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arTanh tanh real closeTo: c real.
			self assert: c arTanh tanh imaginary closeTo: c imaginary ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArcCos [

	| c |
	c := 0.5 + 0 i.
	self assert: c arcCos real closeTo: c real arcCos.
	self assert: c arcCos imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arcCos cos real closeTo: c real.
			self assert: c arcCos cos imaginary closeTo: c imaginary ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArcCosPlusArcSin [

	| c |
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: (c arcCos + c arcSin) real closeTo: Float halfPi.
			self assert: (c arcCos + c arcSin) imaginary closeTo: 0.0 ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArcSin [

	| c |
	c := 0.5 + 0 i.
	self assert: c arcSin real closeTo: c real arcSin.
	self assert: c arcSin imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arcSin sin real closeTo: c real.
			self assert: c arcSin sin imaginary closeTo: c imaginary ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArcTan [

	| c |
	c := 0.5 + 0 i.
	self assert: c arcTan real closeTo: c real arcTan.
	self assert: c arcTan imaginary closeTo: 0.
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: c arcTan tan real closeTo: c real.
			self assert: c arcTan tan imaginary closeTo: c imaginary ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testArcTanDenominator [
	| c1 c2 |
	c1 := 1 i.
	c2 := 0.
	self assert: (c1 arcTan: c1) equals: Float pi / 4.
	self assert: (c2 arcTan: c1) equals: 0.
	self assert: (c2 arcTan: c1 * c1) equals: Float pi
]

{ #category : #'testing - polar coordinates' }
PMComplexNumberTest >> testArgumentOfAComplexNumber [
	self assert: (1 + 1 i) arg equals: Float pi / 4
]

{ #category : #'testing - polar coordinates' }
PMComplexNumberTest >> testArgumentOfAPositivePureImaginaryNumber [
	| c |
	c := 0 + 5 i.
	self assert: c arg equals: Float pi / 2
]

{ #category : #'testing - polar coordinates' }
PMComplexNumberTest >> testArgumentOfAPositiveRealNumber [
	self assert: (5 + 0 i) arg equals: 0
]

{ #category : #'testing - polar coordinates' }
PMComplexNumberTest >> testArgumentOfPureNegativeImaginaryNumber [
	self assert: -1 i arg equals: (Float pi / 2) negated
]

{ #category : #'testing - bugs' }
PMComplexNumberTest >> testBug1 [
	| logOfRootTwo logRootTwo |
	logOfRootTwo := (0.5 * (2 + 0 i) ln).
	self assert: logOfRootTwo exp closeTo: 2 sqrt + 0.0 i.
	logRootTwo := (0.5 * 2 ln).
	self assert: logOfRootTwo exp equals: logRootTwo exp
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testCloseTo [

	self assert: 2 + 3.000000000000001i closeTo: 2 + 3i.
	self assert: 2.000000000000001 + 3i closeTo: 2 + 3i.
	self assert: 2.000000000000001 + 3.000000000000001i closeTo: 2 + 3i
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testCloseToReal [

	self assert: 2 + 0.000000000000001i closeTo: 2.
	self assert: 2.000000000000001 + 0.000000000000001i closeTo: 2.

	self assert: 2 + 0i closeTo: 2.000000000000001.
	self deny: 2 + 3i closeTo: 2.000000000000001
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testCloseToRealWithPrecision [

	self assert: 2 + 0.001i closeTo: 2 precision: 0.01.
	self assert: 2.001 + 0.001i closeTo: 2 precision: 0.01
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testCloseToWithPrecision [

	self assert: 2 + 3.001i closeTo: 2 + 3i precision: 0.01.
	self assert: 2.001 + 3i closeTo: 2 + 3i precision: 0.01.
	self assert: 2.001 + 3.001i closeTo: 2 + 3i precision: 0.01
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testComplexConjugate [

	self assert: (5 - 6i) complexConjugate equals: (5 + 6i)
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testComplexNumberAndIntegerAreUnequalEvenIfRealPartIsEqualToInteger [
	self deny: 1 + 3 i equals: 1
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testCos [

	| c c2 |
	c := 2 + 0 i.
	self assert: c cos real closeTo: c real cos.
	self assert: c cos imaginary closeTo: 0.
	c := 2 + 3 i.
	c2 := c i exp + c i negated exp / 2.
	self assert: c cos real closeTo: c2 real.
	self assert: c cos imaginary closeTo: c2 imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testCos2PlusSin2 [

	| c |
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: (c cos squared + c sin squared) real closeTo: 1.
			self assert: (c cos squared + c sin squared) imaginary closeTo: 0.0 ] ]
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testCosh [

	| c c2 |
	c := 2 + 0 i.
	self assert: c cosh real closeTo: c real cosh.
	self assert: c cosh imaginary closeTo: 0.
	c := 2 + 3 i.
	c2 := c exp + c negated exp / 2.
	self assert: c cosh real closeTo: c2 real.
	self assert: c cosh imaginary closeTo: c2 imaginary.
	c2 := c i cos.
	self assert: c cosh real closeTo: c2 real.
	self assert: c cosh imaginary closeTo: c2 imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testCosh2MinusSinh2 [

	| c |
	#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :real |
		#( -0.5 -2 -3 0 0.5 2 3 ) do: [ :imag |
			c := real + imag i.
			self assert: (c cosh squared - c sinh squared) real closeTo: 1.
			self assert: (c cosh squared - c sinh squared) imaginary closeTo: 0.0 ] ]
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testDividingALargeComplexNumbersByItself [
	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 / c2.
 	self deny: (quotient - 1) isZero.

	"This test fails due to the wonders of floating point arithmetic.
	 Please have a look at Complex>>divideSecureBy: and #divideFastAndSecureBy:
	how this can be avoided."
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testDividingPolynomialByAComplexNumber [
	| c poly |
	c := 4 + 4 i.
	poly := PMPolynomial coefficients: #(1 0 1).
	self assert: poly / c equals: 1 / c * poly
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsReflexive [
	| z |
 	z := -10 + 10 i.

 	self assert: z equals: z
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsSymmetric [
	| z w |

 	z := 13 + 14 i.
 	w := 13 + 14 i.

 	self assert: z equals: w.
 	self assert: w equals: z
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsSymmetricWithRespectToFractions [
	self assert: 1 / 2 + 0 i equals: 1 / 2.
	self assert: 1 / 2 equals: 1 / 2 + 0 i
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsSymmetricWithRespectToIntegers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsSymmetricWithRespectToRealNumbers [
	self assert: 1 + 0 i equals: 1.0.
	self assert: 1.0 equals: 1 + 0 i
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testEqualsIsTransitive [
	| z w u |

 	z := 4 - 1 i.
 	w := 4 - 1 i.
 	u := 4 - 1 i.

 	self assert: z equals: w.
 	self assert: w equals: u.
 	self assert: z equals: u
]

{ #category : #tests }
PMComplexNumberTest >> testFloatClass [
	"just make sure it's implemented"

	self assert: ((1 + 3.4 i) imaginary isKindOf: 1 i floatClass).
	self assert: (1.01 asComplex real isKindOf: 1.01 class)
]

{ #category : #tests }
PMComplexNumberTest >> testHash [
	| aComplex |
	aComplex := 2 - 3 i.
	self assert: aComplex copy hash equals: aComplex hash
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsComplexNumberOnComplex [

	self assert: (3 + 2i) isComplexNumber
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsComplexNumberOnNaN [

	self deny: Character space isComplexNumber
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsComplexNumberOnReal [

	self deny: 5 isComplexNumber
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsRealNumberOnComplex [

	self deny: (3 + 2i) isRealNumber
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsRealNumberOnNaN [

	self deny: Character space isRealNumber
]

{ #category : #'testing - type checking' }
PMComplexNumberTest >> testIsRealNumberOnReal [

	self assert: 0.5 isRealNumber
]

{ #category : #tests }
PMComplexNumberTest >> testIsRealOnComplexMatrix [
	| matrix |

	matrix := PMMatrix rows: {
		{ 1 . 3 + 4i . 0 } .
		{ 1 - 2i . 2 . -4 } .
		{ -8 + 0i . 5 . -1 } }.

	self deny: matrix isReal
]

{ #category : #tests }
PMComplexNumberTest >> testIsRealOnComplexVector [

	| vector |
	vector := { 1. 4. -2. (0.5 + 3 i) } asPMVector.
	self deny: vector isReal
]

{ #category : #tests }
PMComplexNumberTest >> testIsRealOnRealMatrix [

	| matrix |
	matrix := PMMatrix rows: #(
		#(  1  3  0 )
		#(  1  2 -4 )
		#( -8  5 -1 ) ).

	self assert: matrix isReal
]

{ #category : #tests }
PMComplexNumberTest >> testIsRealOnRealVector [

	| vector |
	vector := #( 1 4 -2 0.5 ) asPMVector.
	self assert: vector isReal
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testLn [
	self assert: (Float e + 0 i) ln equals: Float e ln	"See Bug 1815 on Mantis"
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testLog [
	self assert: (Float e + 0 i log: Float e) equals: Float e ln.	"See Bug 1815 on Mantis"
	self assert: (2 + 0 i log: 2) equals: 1
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testMultiplyByI [
	| c |
	c := 5 - 6 i.
	self assert: c * 1 i equals: c i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testMultiplyingAnArrayOfIntegersByAComplexNumber [
	| c arrayOfIntegers expected |
	c := 6 - 6 i.
	arrayOfIntegers := #(0 1 2 3 4 5).

	expected := { 0 + 0 i . 6 - 6 i . 12 - 12 i . 18 - 18 i . 24 - 24 i . 30 - 30 i }.
	self assert: (arrayOfIntegers * c) equals: expected
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testMultiplyingArraysOfComplexNumbers [
	| complexNumbersMultiplied complexNumbers expected |
	complexNumbers := Array with: 1 + 2 i with: 3 + 4 i with: 5 + 6 i.

	complexNumbersMultiplied := 2 * complexNumbers .

	expected := Array with: 2 + 4 i with: 6 + 8 i with: 10 + 12 i.
	complexNumbersMultiplied
		with: expected
		do: [ :actual :expectedComplexNumber | self assert: actual equals: expectedComplexNumber ]
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testMultiplyingByPolynomials [
	| c poly |
	c := 1 + 1 i.
	poly := PMPolynomial coefficients: #(1).
	self assert: (c * poly at: 0) equals: c.
	self assert: (poly * c at: 0) equals: c
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testNegated [
	| c |
	c := 2 + 5 i.
	self assert: c negated equals: -2 - 5 i
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testNew [
	| c |
	c := PMComplexNumber new.
	self assert: c real equals: 0.
	self assert: c imaginary equals: 0
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testNormalizedFractionsOfComplexNumbersCannotBeWritten [

	| z w numerator |
	z := 1 + 2 i.
	w := 3 + 4 i.
	numerator := z * w complexConjugate.
	w squaredNorm.

	self should: [ Fraction numerator: numerator denominator: w squaredNorm ] raise: Exception
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testNotCloseToRealWithPrecision [

	self deny: 2 + 0.001i closeTo: 2 precision: 0.000001.
	self deny: 2.001 + 0.001i closeTo: 2 precision: 0.000001
]

{ #category : #'testing - close to' }
PMComplexNumberTest >> testNotCloseToWithPrecision [

	self deny: 2 + 3.001i closeTo: 2 + 3i precision: 0.000001.
	self deny: 2.001 + 3i closeTo: 2 + 3i precision: 0.000001.
	self deny: 2.001 + 3.001i closeTo: 2 + 3i precision: 0.000001
]

{ #category : #tests }
PMComplexNumberTest >> testNumberAsComplex [
	| minusOne |
	minusOne := -1 asComplex.
	self assert: minusOne real equals: -1.
	self assert: minusOne imaginary equals: 0.
	self assert: minusOne complexConjugate equals: minusOne.
	self assert: minusOne sqrt equals: 1 i
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testOne [
	| one |
	one := PMComplexNumber one.
	self assert: one isComplexNumber.
	self assert: one real equals: 1.
	self assert: one imaginary equals: 0
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testProductWithVector [
	| v c |
	c := 1 + 1 i.
	v := PMVector new: 1.
	v at: 1 put: 1.
	self assert: (v * c at: 1) equals: c.
	self assert: (c * v at: 1) equals: c
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testPureImaginaryNumbersAreNotEqualToObjectsOfADifferentType [

	self deny: 1 i isNil.
	self deny: nil equals: 1 i.
	self deny: 1 i equals: #( 1 2 3 ).
	self deny: #( 1 2 3 ) equals: 1 i
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testQuotientsOfComplexNumbersCannotBeWritten [
	| numerator denominator |
	"It is interesting that we cannot instanciate a fraction of the form z/w"
	"Perhaps, we could do something like z * (w*)/ |w|**2"
	numerator := PMComplexNumber real: 1 imaginary: 1.
	denominator := PMComplexNumber real: 3 imaginary: 4 .

	self should: [ Fraction numerator: numerator denominator: denominator ] raise: Exception
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedTo [

	| c c3 |
	c := 5 - 6 i.
	c3 := (c raisedTo: 0.2) raisedTo: 5.
	self assert: c3 real closeTo: c real.
	self assert: c3 imaginary closeTo: c imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedToFractionalPower [

	| z expected |
	z := 0 + 1 i.
	expected := 3 sqrt / 2 + (1 / 2) i.
	self assert: (z raisedTo: 1 / 3) closeTo: expected 
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedToInteger [
	| c c3 |
	c := 5 - 6 i.
	c3 := c * c * c.
	self assert: c3 equals: (c raisedToInteger: 3).
	self assert: c3 reciprocal equals: (c raisedToInteger: -3)
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedToIntegerWithNonIntegersRaisesAnError [
	|z|
	z := 5 - 9 i.
	self should: [ z raisedToInteger: 3.0 ] raise: ArithmeticError .
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedToNegativeInteger [
	"
	Suppose z = cos(pi / 3) + i sin(pi / 3). By De Moivre's theorem, z**-3 is
	z ** 3 = cos(-3 pi / 3) + i sin(-3 pi / 3) = cos(-pi) + sin(pi) = cos(pi) - i sin(pi)
	z ** 3 = -1 + 0 i
	"
	| z |
	z := (1 / 2) + (3 sqrt / 2) i.
	self assert: (z raisedTo: -3) closeTo: (-1 + 0 i).
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisedToPositiveInteger [
	| z zCubed |
	"
	Suppose z = cos(pi / 6) + i sin(pi / 6). By De Moivre's theorem, z**3 is
	z ** 3 = cos(3 pi / 6) + i sin(3 pi / 6) = cos(pi / 2) + sin(pi / 2) = 0 + i
	"
	z := (3 sqrt / 2) + (1 / 2) i.
	zCubed := (z raisedTo: 3) .
	self assert: zCubed closeTo: (0 + 1 i).
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testRaisingZeroToThePowerOfNegativeIndex [
	| zero |
	zero := PMComplexNumber zero.
	self should: [ zero raisedTo: -4 ] raise: ZeroDivide  
]

{ #category : #tests }
PMComplexNumberTest >> testRandom [
	| random c r |
	random := Random new.
	c := random next + random next i.
	r := c random.
	self assert: r isComplexNumber.
	self assert: r abs < c abs
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testReciprocal [
	"self run: #testReciprocal"

	"self debug: #testReciprocal"

	| c |
	c := 2 + 5 i.
	self assert: c reciprocal equals: 2 / 29 - (5 / 29) i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testSecureDivision1 [
	"self run: #testSecureDivision1"
	"self debug: #testSecureDivision1"

	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 divideSecureBy: c2.
	self assert: (quotient - 1) isZero
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testSecureDivision2 [
	"self run: #testSecureDivision2"
	"self debug: #testSecureDivision2"

	| c1 c2 quotient |
 	c1 := 2.0e252 + 3.0e70 i.
 	c2 := c1.
 	quotient := c1 divideFastAndSecureBy: c2.
	self assert: (quotient - 1) isZero
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSin [

	| c c2 |
	c := 2 + 0 i.
	self assert: c sin real closeTo: c real sin.
	self assert: c sin imaginary closeTo: 0.
	c := 2 + 3 i.
	c2 := c i exp - c i negated exp / 2 i.
	self assert: c sin real closeTo: c2 real.
	self assert: c sin imaginary closeTo: c2 imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSinh [

	| c c2 |
	c := 2 + 0 i.
	self assert: c sinh real closeTo: c real sinh.
	self assert: c sinh imaginary closeTo: 0.
	c := 2 + 3 i.
	c := c cosh squared - c sinh squared.
	self assert: c real closeTo: 1.
	self assert: c imaginary closeTo: 0.
	c2 := c exp - c negated exp / 2.
	self assert: c sinh real closeTo: c2 real.
	self assert: c sinh imaginary closeTo: c2 imaginary.
	c2 := c i sin i negated.
	self assert: c sinh real closeTo: c2 real.
	self assert: c sinh imaginary closeTo: c2 imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfANegativeRealNumberIsPureImaginary [

	"Given z = -4 + 0 i, the square root is 2 i"

	| squareRoot z |
	z := PMComplexNumber real: -4 imaginary: 0.

	squareRoot := z sqrt.

	self assert: squareRoot equals: 2 i
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfComplexNumberIsAComplexNumber [
	| squareRoot z |
	z := PMComplexNumber real: 2 imaginary: 2.

	squareRoot := z sqrt.

	self assert: squareRoot real closeTo: 1.55377397.
	self assert: squareRoot imaginary closeTo: 0.643594253
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfNegativePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [
   | squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplexNumber real: 0 imaginary: -4.

	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt - 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfPositivePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [

	"e.g. square root of 4 i = root(2) + i root(2)"

	| squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplexNumber real: 0 imaginary: 4.

	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfPositiveRealNumberIsAComplexNumberWithOnlyARealPart [

	"Given z = 6 + 0 i, then root z = root 6"

	| squareRoot expected positiveRealNumber |
	positiveRealNumber := PMComplexNumber real: 6 imaginary: 0.

	squareRoot := positiveRealNumber sqrt.

	expected := PMComplexNumber real: 6 sqrt imaginary: 0.
	self assert: squareRoot equals: expected
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfVeryLargeRealAndVerySmallImaginary [
	"This may cause problems because of the loss of precision.
	Very large and very small floating point numbers have different units of least precision.

	verySmall ~= 0.
	veryLarge + verySmall = veryLarge."

	| veryLarge verySmall complexNumber expected |

	veryLarge := 1e20.
	verySmall := 1e-20.

	complexNumber := veryLarge + verySmall i.
	expected := 1e10 + 1e-31 i.

	self assert: complexNumber sqrt closeTo: expected
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfVerySmallRealAndVeryLargeImaginary [
	"This may cause problems because of the loss of precision.
	Very large and very small floating point numbers have different units of least precision.

	verySmall ~= 0.
	veryLarge + verySmall = veryLarge."

	| veryLarge verySmall complexNumber expected |

	veryLarge := 1e20.
	verySmall := 1e-20.

	complexNumber := verySmall + veryLarge i.
	expected := 7071067811.865476 + 7071067811.865475 i.

	self assert: complexNumber sqrt closeTo: expected
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquareRootOfZeroIsZero [
	| squareRoot expected |
	squareRoot := PMComplexNumber zero sqrt .

	expected := PMComplexNumber zero.
	self assert: squareRoot equals: expected
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testSquared [

	| c |
	c := 6 - 6 i.
	self assert: c squared equals: 0 - 72 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testSubtractingPolynomials [
	| c poly |
	poly := PMPolynomial coefficients: #(1 2 3).
	c := 1 + 3 i.
	self assert: (c - poly at: 0) equals: 3 i.
	self assert: (poly - c at: 0) equals: -3 i
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testTan [

	| c c2 |
	c := 2 + 0 i.
	self assert: c tan real closeTo: c real tan.
	self assert: c tan imaginary closeTo: 0.
	c := 2 + 3 i.
	c2 := c sin / c cos.
	self assert: c2 real closeTo: c tan real.
	self assert: c2 imaginary closeTo: c tan imaginary
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testTanh [

	| c c2 |
	c := 2 + 0 i.
	self assert: c tanh real closeTo: c real tanh.
	self assert: c tanh imaginary closeTo: 0.
	c := 2 + 3 i.
	c2 := c sinh / c cosh.
	self assert: c2 real closeTo: c tanh real.
	self assert: c2 imaginary closeTo: c tanh imaginary
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testTwoComplexNumbersWithDifferentImaginaryPartsAreNotEqual [
	| z w |
 	z := 1 + 3 i.
 	w := 1 + 2 i.

 	self deny: z equals: w
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testTwoComplexNumbersWithDifferentRealPartsAreNotEqual [
	| z w |
 	z := 4 + 3 i.
 	w := -7 + 3 i.

 	self deny: z equals: w
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testWritingComplexNumbersInCartesianCoordinates [
	| c |
	c := 5 i.
	self assert: c real equals: 0.
	self assert: c imaginary equals: 5.
	c := 6 + 7 i.
	self assert: c real equals: 6.
	self assert: c imaginary equals: 7.
	c := 5.6 - 8 i.
	self assert: c real equals: 5.6.
	self assert: c imaginary equals: -8.
	c := PMComplexNumber real: 10 imaginary: 5.
	self assert: c real equals: 10.
	self assert: c imaginary equals: 5.
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testWritingComplexNumbersInPolarCoordinates [
	| c |

	c := PMComplexNumber abs: 5 arg: Float pi / 2.
	self assert: c real rounded equals: 0.
	self assert: c imaginary equals: 5
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testWritingComplexNumbersWhoseRealAndImaginaryPartsAreFractions [
	| z |
	z := PMComplexNumber real: 3 / 5 imaginary: 4 / 5.

	self assert: (z real) equals: (Fraction numerator: 3 denominator: 5).
	self assert: (z imaginary) equals: (Fraction numerator: 4 denominator: 5)
]

{ #category : #'testing - expressing complex numbers' }
PMComplexNumberTest >> testZero [
	| z |
	z := PMComplexNumber zero.
	self assert: z isZero.
	self assert: z isComplexNumber.
	self assert: z real isZero.
	self assert: z imaginary isZero
]

{ #category : #'testing - equality' }
PMComplexNumberTest >> testZeroComplexNumberIsEqualToIntegerZero [
	self assert: 0 i equals: 0.
 	self assert: 0 equals: 0 i
]

{ #category : #'testing - arithmetic' }
PMComplexNumberTest >> testZeroComplexNumbersDoNotHaveAReciprocal [
	self should: [ PMComplexNumber zero reciprocal ] raise: ZeroDivide
]

{ #category : #'testing - mathematical functions' }
PMComplexNumberTest >> testZeroRaisedToThePowerOfZero [

	| zeroRaisedToZero |
	zeroRaisedToZero := (PMComplexNumber zero) raisedTo: 0.
	self assert: zeroRaisedToZero equals: PMComplexNumber one.
]

{ #category : #tests }
PMComplexNumberTest >> testZeroToThePowerOfZero [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| zero |
	zero := PMComplexNumber zero.
	self assert: (zero raisedTo: 0) equals: PMComplexNumber one.
]
