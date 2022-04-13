Class {
	#name : #PMComplexNumberUnaryOperationTests,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testAbs [
	"self run: #testAbs"

	"self debug: #testAbs"

	| c |
	c := 6 i: -6.
	self assert: c abs equals: 72 sqrt
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testAbsSecure [
	"self run: #testAbsSecure"

	"using equalsTo since absSecure returns a slightly different Float"

	| c |
	c := 6 - 6 i.
	self assert: (c absSecure equalsTo: 72 sqrt)
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testArCosh [
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
PMComplexNumberUnaryOperationTests >> testArSinh [
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
PMComplexNumberUnaryOperationTests >> testArTanh [
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
PMComplexNumberUnaryOperationTests >> testArcCos [
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
PMComplexNumberUnaryOperationTests >> testArcCosPlusArcSin [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c arcCos + c arcSin) real closeTo: Float halfPi).
		self assert: ((c arcCos + c arcSin) imaginary closeTo: 0.0)]]
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testArcSin [
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
PMComplexNumberUnaryOperationTests >> testArcTan [
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
PMComplexNumberUnaryOperationTests >> testArcTanDenominator [
	| c1 c2 |
	c1 := 1 i.
	c2 := 0.
	self assert: (c1 arcTan: c1) equals: Float pi / 4.
	self assert: (c2 arcTan: c1) equals: 0.
	self assert: (c2 arcTan: c1 * c1) equals: Float pi
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testCos [
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
PMComplexNumberUnaryOperationTests >> testCos2PlusSin2 [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c cos squared + c sin squared) real closeTo: 1).
		self assert: ((c cos squared + c sin squared) imaginary closeTo: 0.0)]]
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testCosh [
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
PMComplexNumberUnaryOperationTests >> testCosh2MinusSinh2 [
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c cosh squared - c sinh squared) real closeTo: 1).
		self assert: ((c cosh squared - c sinh squared) imaginary closeTo: 0.0)]]
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testLn [
	self assert: (Float e + 0 i) ln equals: Float e ln	"See Bug 1815 on Mantis"
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testLog [
	self assert: (Float e + 0 i log: Float e) equals: Float e ln.	"See Bug 1815 on Mantis"
	self assert: (2 + 0 i log: 2) equals: 1
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testNegated [
	"self run: #testNegated"

	"self debug: #testNegated"

	| c |
	c := 2 + 5 i.
	self assert: c negated equals: -2 - 5 i
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testReciprocal [
	"self run: #testReciprocal"

	"self debug: #testReciprocal"

	| c |
	c := 2 + 5 i.
	self assert: c reciprocal equals: 2 / 29 - (5 / 29) i
]

{ #category : #tests }
PMComplexNumberUnaryOperationTests >> testReciprocalError [
	"self run: #testReciprocalError"
	"self debug: #testReciprocalError"
	
	| c |
	c := (0 i).
	self should: [c reciprocal] raise: ZeroDivide
	
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testSin [
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
PMComplexNumberUnaryOperationTests >> testSinh [
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
PMComplexNumberUnaryOperationTests >> testSquareRootOfANegativeRealNumberIsPureImaginary [

	"Given z = -4 + 0 i, the square root is 2 i"

	| squareRoot z |
	z := PMComplex real: -4 imaginary: 0.
	
	squareRoot := z sqrt.
	
	self assert: squareRoot equals: 2 i
]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquareRootOfComplexNumberIsAComplexNumber [
	| squareRoot z |
	z := PMComplex real: 2 imaginary: 2.
	
	squareRoot := z sqrt.

	self assert: squareRoot real closeTo: 1.55377397.
	self assert: squareRoot imaginary closeTo: 0.643594253
]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquareRootOfNegativePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [
   | squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: -4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt negated + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary

]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquareRootOfPositivePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [

	"e.g. square root of 4 i = root(2) + i root(2)"

	| squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: 4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary
]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquareRootOfPositiveRealNumberIsAComplexNumberWithOnlyARealPart [

	"Given z = 6 + 0 i, then root z = root 6"

	| squareRoot expected positiveRealNumber |
	positiveRealNumber := PMComplex real: 6 imaginary: 0.
	
	squareRoot := positiveRealNumber sqrt.

	expected := PMComplex real: 6 sqrt imaginary: 0.
	self assert: squareRoot equals: expected
]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquareRootOfZeroIsZero [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| squareRoot expected |
	squareRoot := PMComplex zero sqrt .
	
	expected := PMComplex zero.
	self assert: squareRoot equals: expected.
]

{ #category : #'square root' }
PMComplexNumberUnaryOperationTests >> testSquared [
	"self run: #testSquared"

	"self debug: #testSquared"

	| c c2 |
	c := 6 - 6 i.
	c2 := c squared.
	self assert: c2 imaginary equals: -72.
	self assert: c2 real equals: 0
]

{ #category : #'trigonometric operations' }
PMComplexNumberUnaryOperationTests >> testTan [
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
PMComplexNumberUnaryOperationTests >> testTanh [
	| c c2 |
	c := (2 + 0 i).
	self assert: (c tanh real closeTo: c real tanh).
	self assert: (c tanh imaginary closeTo: 0).
	c := 2 + 3 i.
	c2 := c sinh / c cosh.
	self assert: (c2 real closeTo: c tanh real).
	self assert: (c2 imaginary closeTo: c tanh imaginary).
]
