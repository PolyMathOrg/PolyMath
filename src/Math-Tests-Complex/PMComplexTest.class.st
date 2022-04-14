Class {
	#name : #PMComplexTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #'unary operations' }
PMComplexTest >> testAbs [
	"self run: #testAbs"

	"self debug: #testAbs"

	| c |
	c := 6 i: -6.
	self assert: c abs equals: 72 sqrt
]

{ #category : #'unary operations' }
PMComplexTest >> testAbsSecure [
	"self run: #testAbsSecure"

	"using equalsTo since absSecure returns a slightly different Float"

	| c |
	c := 6 - 6 i.
	self assert: (c absSecure equalsTo: 72 sqrt)
]

{ #category : #tests }
PMComplexTest >> testAdaptToCollectionAndSend [
	"self run: #testAbsSecure"

	"using equalsTo since absSecure returns a slightly different Float"

	| c arr |
	c := 6 - 6 i.
	arr := #(0 1 2 3 4 5).
	self assert: (arr + c at: 1) equals: c.
	self assert: (arr * c at: 2) equals: c
]

{ #category : #addition }
PMComplexTest >> testAddingComplexNumbersToFractions [
	| expected z fraction |
	z := 1 + 22 i.
	fraction := Fraction numerator: 3 denominator: 7.

	expected := 10 / 7 + 22 i.
	self assert: z + fraction equals: expected.
	self assert: fraction + z equals: expected
]

{ #category : #addition }
PMComplexTest >> testAddingToIntegers [
	self assert: 1 + 2 i + 1 equals: 2 + 2 i.
	self assert: 1 + (1 + 2 i) equals: 2 + 2 i.
]

{ #category : #addition }
PMComplexTest >> testAddingToPolynomials [
	| c poly |
	c := 6 - 6 i.
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i
]

{ #category : #addition }
PMComplexTest >> testAddingToRealNumbers [
	| z expected |
	z:= 3 - 9 i.
	
	expected := 12.12 - 9 i.
	self assert: z  + 9.12 equals: expected.
	self assert: 9.12 + z equals: expected.
]

{ #category : #addition }
PMComplexTest >> testAddingTwoComplexNumbers [
	"self run: #testAdding"

	| c |
	c := 5 - 6 i + (-5 + 8 i).	"Complex with Complex"
	self assert: c equals: 0 + 2 i
]

{ #category : #addition }
PMComplexTest >> testAdditionIsAssociative [
	| z w u expected |
	
	z := 1 + 3 i.
	w := 7 - 2 i.
	u := -9 + 8 i.
	
	expected := -1 + 9 i.
	self assert: (z + w) + u equals: expected.
	self assert: z + (w + u) equals: expected.
]

{ #category : #addition }
PMComplexTest >> testAdditionIsCommutative [
	| z w expected |
	z := 5 - 6 i.
	w := -8 + 1 i.
	
	expected := -3 - 5 i.
	self assert: (z + w) equals: expected.
	self assert: (w + z) equals: expected.
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArCosh [
	| c |
	c := (2.5 + 0 i).
	self assert: (c arCosh real closeTo: c real arCosh).
	self assert: (c arCosh imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arCosh cosh real closeTo: c real).
		self assert: (c arCosh cosh imaginary closeTo: c imaginary).
		self deny: c arCosh real negative]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArSinh [
	| c |
	c := (2.5 + 0 i).
	self assert: (c arSinh real closeTo: c real arSinh).
	self assert: (c arSinh imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arSinh sinh real closeTo: c real).
		self assert: (c arSinh sinh imaginary closeTo: c imaginary)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArTanh [
	| c |
	c := (0.5 + 0 i).
	self assert: (c arTanh real closeTo: c real arTanh).
	self assert: (c arTanh imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arTanh tanh real closeTo: c real).
		self assert: (c arTanh tanh imaginary closeTo: c imaginary)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArcCos [
	| c |
	c := (0.5 + 0 i).
	self assert: (c arcCos real closeTo: c real arcCos).
	self assert: (c arcCos imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arcCos cos real closeTo: c real).
		self assert: (c arcCos cos imaginary closeTo: c imaginary)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArcCosPlusArcSin [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c arcCos + c arcSin) real closeTo: Float halfPi).
		self assert: ((c arcCos + c arcSin) imaginary closeTo: 0.0)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArcSin [
	| c |
	c := (0.5 + 0 i).
	self assert: (c arcSin real closeTo: c real arcSin).
	self assert: (c arcSin imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arcSin sin real closeTo: c real).
		self assert: (c arcSin sin imaginary closeTo: c imaginary)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArcTan [
	| c |
	c := (0.5 + 0 i).
	self assert: (c arcTan real closeTo: c real arcTan).
	self assert: (c arcTan imaginary closeTo: 0).
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: (c arcTan tan real closeTo: c real).
		self assert: (c arcTan tan imaginary closeTo: c imaginary)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testArcTanDenominator [
	| c1 c2 |
	c1 := 1 i.
	c2 := 0.
	self assert: (c1 arcTan: c1) equals: Float pi / 4.
	self assert: (c2 arcTan: c1) equals: 0.
	self assert: (c2 arcTan: c1 * c1) equals: Float pi
]

{ #category : #tests }
PMComplexTest >> testArg [
	"self run: #testArg"

	"self debug: #testArg"

	| c |
	c := 0 + 5 i.
	self assert: c arg equals: Float pi / 2
]

{ #category : #'testing - bugs' }
PMComplexTest >> testBug1 [
	self assert: (0.5 * (2 + 0 i) ln) exp equals: (0.5 * 2 ln) exp
]

{ #category : #tests }
PMComplexTest >> testComplexAsComplex [
	| ineg |
	ineg := -1 i.
	self assert: ineg asComplex == ineg.
]

{ #category : #tests }
PMComplexTest >> testComplexCollection [
	"self run: #testComplexCollection"

	"self debug: #testComplexCollection"

	| array array2 |
	array := Array with: 1 + 2 i with: 3 + 4 i with: 5 + 6 i.
	array2 := 2 * array.
	array
		with: array2
		do: [ :one :two | self assert: 2 * one equals: two ]
]

{ #category : #'complex conjugation' }
PMComplexTest >> testComplexConjugate [
	| z complexConjugateOfZ expected |
	z := 5 - 6 i.
	
	complexConjugateOfZ := z complexConjugate .
	
	expected := 5 + 6 i.
	self assert: complexConjugateOfZ equals: expected.
]

{ #category : #equality }
PMComplexTest >> testComplexNumberAndIntegerAreUnequalEvenIfRealPartIsEqualToInteger [
	self deny: 1 + 3 i equals: 1.
]

{ #category : #equality }
PMComplexTest >> testComplexNumberIsNotEqualToObjectsOfADifferentType [
	self deny: 1 i equals: nil.
	self deny: nil equals: 1 i.
	self deny: 1 i equals: #(1 2 3).
	self deny: #(1 2 3) equals: 1 i.
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testCos [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c cos real closeTo: c real cos).
	self assert: (c cos imaginary closeTo: 0).
	c := (2 + 3 i).
	c2 := c i exp + c i negated exp / 2.
	self assert: (c cos real closeTo: c2 real).
	self assert: (c cos imaginary closeTo: c2 imaginary).
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testCos2PlusSin2 [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c cos squared + c sin squared) real closeTo: 1).
		self assert: ((c cos squared + c sin squared) imaginary closeTo: 0.0)]]
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testCosh [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c cosh real closeTo: c real cosh).
	self assert: (c cosh imaginary closeTo: 0).
	c := (2 + 3 i).
	c2 := c exp + c negated exp / 2.
	self assert: (c cosh real closeTo: c2 real).
	self assert: (c cosh imaginary closeTo: c2 imaginary).
	c2 := c i cos.
	self assert: (c cosh real closeTo: c2 real).
	self assert: (c cosh imaginary closeTo: c2 imaginary).
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testCosh2MinusSinh2 [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c cosh squared - c sinh squared) real closeTo: 1).
		self assert: ((c cosh squared - c sinh squared) imaginary closeTo: 0.0)]]
]

{ #category : #tests }
PMComplexTest >> testCreation [
	"self run: #testCreation"

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
	c := PMComplex real: 10 imaginary: 5.
	self assert: c real equals: 10.
	self assert: c imaginary equals: 5.
	c := PMComplex abs: 5 arg: Float pi / 2.
	self assert: c real rounded equals: 0.
	self assert: c imaginary equals: 5
]

{ #category : #division }
PMComplexTest >> testDividingPolynomial [
	| c poly |
	c := 4 + 4 i.
	poly := PMPolynomial coefficients: #(1 0 1).
	self assert: poly / c equals: 1 / c * poly
]

{ #category : #division }
PMComplexTest >> testDividingTwoComplexNumbers [
	"self run: #testDivision1"
	"self debug: #testDivision1"
	
	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 / c2.
 	self deny: (quotient - 1) isZero.
	
	"This test fails due to the wonders of floating point arithmetic. 
	 Please have a look at Complex>>divideSecureBy: and #divideFastAndSecureBy:
	how this can be avoided."
	

]

{ #category : #equality }
PMComplexTest >> testEqualsIsReflexive [
	| z |
	z := -10 + 10 i.
	 
	self assert: z equals: z.
]

{ #category : #equality }
PMComplexTest >> testEqualsIsSymmetric [
	| z w |
	
	z := 13 + 14 i.
	w := 13 + 14 i.
	
	self assert: z equals: w.
	self assert: w equals: z
]

{ #category : #equality }
PMComplexTest >> testEqualsIsSymmetricWithComplexNumbersAndIntegers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #equality }
PMComplexTest >> testEqualsIsSymmetricWithFractions [
	self assert: 1 / 2 + 0 i equals: 1 / 2.
	self assert: 1 / 2 equals: 1 / 2 + 0 i
]

{ #category : #equality }
PMComplexTest >> testEqualsIsSymmetricWithRealNumbers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #equality }
PMComplexTest >> testEqualsIsTransitive [
	| z w u |
	
	z := 4 - 1 i.
	w := 4 - 1 i.
	u := 4 - 1 i.
	
	self assert: z equals: w.
	self assert: w equals: u.
	self assert: z equals: u.
]

{ #category : #tests }
PMComplexTest >> testFloatClass [
	"just make sure it's implemented"

	self assert: ((1 + 3.4 i) imaginary isKindOf: 1 i floatClass).
	self assert: (1.01 asComplex real isKindOf: 1.01 class)
]

{ #category : #tests }
PMComplexTest >> testHash [
	| aComplex |
	aComplex := 2 - 3 i.
	self assert: aComplex copy hash equals: aComplex hash
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfConjugateComplex [

	self assert: ((3 + 2i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfConjugateComplexAndReal [

	self assert: ((5 + 0i) isComplexConjugateOf: 5)
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfConjugateRealAndComplex [

	self assert: (5 isComplexConjugateOf: (5 - 0i))
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfDifferentReal [

	self deny: (-5 isComplexConjugateOf: 5)
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfNonConjugateComplexAndReal [

	self deny: ((5 + 3i) isComplexConjugateOf: 5)
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfNonConjugateDifferentComplex [

	self deny: ((-0.5 - 1i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfNonConjugateRealAndComplex [

	self deny: (5 isComplexConjugateOf: (5 - 3i))
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfSameComplex [

	self deny: ((3 - 2i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #'complex conjugation' }
PMComplexTest >> testIsComplexConjugateOfSameReal [

	self assert: (5 isComplexConjugateOf: 5)
]

{ #category : #tests }
PMComplexTest >> testIsComplexNumberOnComplex [
	
	self assert: (3 + 2i) isComplexNumber
]

{ #category : #tests }
PMComplexTest >> testIsComplexNumberOnNaN [
	
	self deny: Character space isComplexNumber
]

{ #category : #tests }
PMComplexTest >> testIsComplexNumberOnReal [
	
	self deny: 5 isComplexNumber
]

{ #category : #tests }
PMComplexTest >> testIsRealNumberOnComplex [
	
	self deny: (3 + 2i) isRealNumber
]

{ #category : #tests }
PMComplexTest >> testIsRealNumberOnNaN [
	
	self deny: Character space isRealNumber
]

{ #category : #tests }
PMComplexTest >> testIsRealNumberOnReal [
	
	self assert: 0.5 isRealNumber
]

{ #category : #'unary operations' }
PMComplexTest >> testLn [
	self assert: (Float e + 0 i) ln equals: Float e ln	"See Bug 1815 on Mantis"
]

{ #category : #'unary operations' }
PMComplexTest >> testLog [
	self assert: (Float e + 0 i log: Float e) equals: Float e ln.	"See Bug 1815 on Mantis"
	self assert: (2 + 0 i log: 2) equals: 1
]

{ #category : #multiplication }
PMComplexTest >> testMultiplicationByI [
	| c |
	c := 5 - 6 i.
	self assert: c * 1 i equals: c i
]

{ #category : #multiplication }
PMComplexTest >> testMultiplicationIsAssociative [
	| z w u expected |
	
	z := 1 + 2 i.
	w := -2 + 3 i.
	u := 2 - 1 i.
	
	expected := -17 + 6 i.
	self assert: (z * w) * u equals: expected.
	self assert: z * (w * u) equals: expected.
]

{ #category : #multiplication }
PMComplexTest >> testMultiplicationIsCommutative [
	| z w expected |
	z := 3 - 4 i.
	w := 5 + 8 i.
	
	expected := (15 + 32) + (24 - 20) i.
	self assert: z * w equals: expected.
	self assert: w * z equals: expected.
]

{ #category : #multiplication }
PMComplexTest >> testMultiplicationWithVector [
	| v c |
	c := 1 + 1 i.
	v := PMVector new: 1.
	v at: 1 put: 1.
	self assert: (v * c at: 1) equals: c.
	self assert: (c * v at: 1) equals: c
]

{ #category : #'unary operations' }
PMComplexTest >> testNegated [
	"self run: #testNegated"

	"self debug: #testNegated"

	| c |
	c := 2 + 5 i.
	self assert: c negated equals: -2 - 5 i
]

{ #category : #tests }
PMComplexTest >> testNew [
	| c |
	c := PMComplex new.
	self assert: c real equals: 0.
	self assert: c imaginary equals: 0
]

{ #category : #tests }
PMComplexTest >> testNumberAsComplex [
	| minusOne |
	minusOne := -1 asComplex.
	self assert: minusOne real equals: -1.
	self assert: minusOne imaginary equals: 0.
	self assert: minusOne complexConjugate equals: minusOne.
	self assert: minusOne sqrt equals: 1 i
]

{ #category : #tests }
PMComplexTest >> testOne [
	| one |
	one := PMComplex one.
	self assert: one isComplexNumber.
	self assert: one real equals: 1.
	self assert: one imaginary equals: 0
]

{ #category : #equality }
PMComplexTest >> testPureImaginaryNumbersAreNotEqualToZero [
	self deny: 1 i equals: 0.
	self deny: 0 equals: 1 i.
]

{ #category : #tests }
PMComplexTest >> testRaisedTo [
	
	| c c3 |
	c := (5 - 6 i).
	c3 := (c raisedTo: 0.2) raisedTo: 5.
	self assert: (c3 real closeTo: c real).
	self assert: (c3 imaginary closeTo: c imaginary).
]

{ #category : #tests }
PMComplexTest >> testRaisedToInteger [
	| z zCubed |
	z := 5 - 6 i.
	zCubed := z * z * z.
	self assert: zCubed equals: (z raisedToInteger: 3).
	self assert: zCubed reciprocal equals: (z raisedToInteger: -3)
]

{ #category : #tests }
PMComplexTest >> testRandom [
	| c r |
	c := Float random + Float random i.
	r := c random.
	self assert: r isComplexNumber.
	self assert: r abs < c abs
]

{ #category : #'unary operations' }
PMComplexTest >> testReciprocal [
	"self run: #testReciprocal"

	"self debug: #testReciprocal"

	| c |
	c := 2 + 5 i.
	self assert: c reciprocal equals: 2 / 29 - (5 / 29) i
]

{ #category : #'unary operations' }
PMComplexTest >> testReciprocalError [
	"self run: #testReciprocalError"
	"self debug: #testReciprocalError"
	
	| c |
	c := (0 i).
	self should: [c reciprocal] raise: ZeroDivide
	
]

{ #category : #division }
PMComplexTest >> testSecureDivision1 [
	"self run: #testSecureDivision1"
	"self debug: #testSecureDivision1"
	
	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 divideSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #division }
PMComplexTest >> testSecureDivision2 [
	"self run: #testSecureDivision2"
	"self debug: #testSecureDivision2"
	
	| c1 c2 quotient |
 	c1 := 2.0e252 + 3.0e70 i.
 	c2 := c1.
 	quotient := c1 divideFastAndSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testSin [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c sin real closeTo: c real sin).
	self assert: (c sin imaginary closeTo: 0).
	c := 2 + 3 i.
	c2 := c i exp - c i negated exp / 2 i.
	self assert: (c sin real closeTo: c2 real).
	self assert: (c sin imaginary closeTo: c2 imaginary).
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testSinh [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c sinh real closeTo: c real sinh).
	self assert: (c sinh imaginary closeTo: 0).
	c := 2 + 3 i.
	c := c cosh squared - c sinh squared.
	self assert: (c real closeTo: 1).
	self assert: (c imaginary closeTo: 0).
	c2 := c exp - c negated exp / 2.
	self assert: (c sinh real closeTo: c2 real).
	self assert: (c sinh imaginary closeTo: c2 imaginary).
	c2 := c i sin i negated.
	self assert: (c sinh real closeTo: c2 real).
	self assert: (c sinh imaginary closeTo: c2 imaginary).
]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfANegativeRealNumberIsPureImaginary [

	"Given z = -4 + 0 i, the square root is 2 i"

	| squareRoot z |
	z := PMComplex real: -4 imaginary: 0.
	
	squareRoot := z sqrt.
	
	self assert: squareRoot equals: 2 i
]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfComplexNumberIsAComplexNumber [
	| squareRoot z |
	z := PMComplex real: 2 imaginary: 2.
	
	squareRoot := z sqrt.

	self assert: squareRoot real closeTo: 1.55377397.
	self assert: squareRoot imaginary closeTo: 0.643594253
]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfNegativePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [
   | squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: -4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt negated + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary

]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfPositivePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [

	"e.g. square root of 4 i = root(2) + i root(2)"

	| squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: 4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary
]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfPositiveRealNumberIsAComplexNumberWithOnlyARealPart [

	"Given z = 6 + 0 i, then root z = root 6"

	| squareRoot expected positiveRealNumber |
	positiveRealNumber := PMComplex real: 6 imaginary: 0.
	
	squareRoot := positiveRealNumber sqrt.

	expected := PMComplex real: 6 sqrt imaginary: 0.
	self assert: squareRoot equals: expected
]

{ #category : #'square root' }
PMComplexTest >> testSquareRootOfZeroIsZero [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| squareRoot expected |
	squareRoot := PMComplex zero sqrt .
	
	expected := PMComplex zero.
	self assert: squareRoot equals: expected.
]

{ #category : #'square root' }
PMComplexTest >> testSquared [
	"self run: #testSquared"

	"self debug: #testSquared"

	| c c2 |
	c := 6 - 6 i.
	c2 := c squared.
	self assert: c2 imaginary equals: -72.
	self assert: c2 real equals: 0
]

{ #category : #subtraction }
PMComplexTest >> testSubtractToPolynomial [
	| c poly |
	poly := PMPolynomial coefficients: #(1 2 3).
	c := 1 + 3 i.
	self assert: (c - poly at: 0) equals: 3 i.
	self assert: (poly - c at: 0) equals: -3 i
]

{ #category : #subtraction }
PMComplexTest >> testSubtractingComplexNumberFromInteger [
	| integer z expected |
	integer := 23.
	z := 10 + 6 i.
	
	expected := 13 - 6 i.
	self assert: integer - z equals: expected.
]

{ #category : #subtraction }
PMComplexTest >> testSubtractingIntegerFromAComplexNumber [
	| z integer expected |
	z := -5 + 7 i.
	integer := 5.
	
	expected := -10 + 7 i.
	self assert: z - integer equals: expected.
]

{ #category : #subtraction }
PMComplexTest >> testSubtractingTwoComplexNumbers [
	| z w expected |
	z := 17 + 20 i.
	w := 3 - 34 i.
	
	expected := 14 + 54 i.
	self assert: z - w equals: expected.
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testTan [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c tan real closeTo: c real tan).
	self assert: (c tan imaginary closeTo: 0).
	c := 2 + 3 i.
	c2 := c sin / c cos.
	self assert: (c2 real closeTo: c tan real).
	self assert: (c2 imaginary closeTo: c tan imaginary).
]

{ #category : #'trigonometric operations' }
PMComplexTest >> testTanh [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c tanh real closeTo: c real tanh).
	self assert: (c tanh imaginary closeTo: 0).
	c := 2 + 3 i.
	c2 := c sinh / c cosh.
	self assert: (c2 real closeTo: c tanh real).
	self assert: (c2 imaginary closeTo: c tanh imaginary).
]

{ #category : #multiplication }
PMComplexTest >> testTimesPolynomial [
	| c poly |
	c := 1 + 1 i.
	poly := PMPolynomial coefficients: #(1).
	self assert: (c * poly at: 0) equals: c.
	self assert: (poly * c at: 0) equals: c
]

{ #category : #equality }
PMComplexTest >> testTwoComplexNumbersWithDifferentImaginaryPartsAreNotEqual [
	| z w |
	z := 1 + 3 i.
	w := 1 + 2 i.
	
	self deny: z equals: w.
]

{ #category : #equality }
PMComplexTest >> testTwoComplexNumbersWithDifferentRealPartsAreNotEqual [
	| z w |
	z := 4 + 3 i.
	w := -7 + 3 i.
	
	self deny: z equals: w.
]

{ #category : #tests }
PMComplexTest >> testZero [
	| z |
	z := PMComplex zero.
	self assert: z isZero.
	self assert: z isComplexNumber.
	self assert: z real isZero.
	self assert: z imaginary isZero.
	self assert: 0 i isZero.
]

{ #category : #equality }
PMComplexTest >> testZeroComplexNumberIsEqualToIntegerZero [
	self assert: 0 i equals: 0.
	self assert: 0 equals: 0 i.
]
