Class {
	#name : #PMComplexNumberBinaryOperationsTests,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAddingComplexNumbersToFractions [
	| expected z fraction |
	z := 1 + 22 i.
	fraction := Fraction numerator: 3 denominator: 7.

	expected := 10 / 7 + 22 i.
	self assert: z + fraction equals: expected.
	self assert: fraction + z equals: expected
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAddingToIntegers [
	self assert: 1 + 2 i + 1 equals: 2 + 2 i.
	self assert: 1 + (1 + 2 i) equals: 2 + 2 i.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAddingToPolynomials [
	| c poly |
	c := 6 - 6 i.
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAddingToRealNumbers [
	| z expected |
	z:= 3 - 9 i.
	
	expected := 12.12 - 9 i.
	self assert: z  + 9.12 equals: expected.
	self assert: (9.12 + 3 - 9 i) equals: expected.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAddingTwoComplexNumbers [
	"self run: #testAdding"

	| c |
	c := 5 - 6 i + (-5 + 8 i).	"Complex with Complex"
	self assert: c equals: 0 + 2 i
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAdditionIsAssociative [
	| z w u expected |
	
	z := 1 + 3 i.
	w := 7 - 2 i.
	u := -9 + 8 i.
	
	expected := -1 + 9 i.
	self assert: (z + w) + u equals: expected.
	self assert: z + (w + u) equals: expected.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTests >> testAdditionIsCommutative [
	| z w expected |
	z := 5 - 6 i.
	w := -8 + 1 i.
	
	expected := -3 - 5 i.
	self assert: (z + w) equals: expected.
	self assert: (w + z) equals: expected.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testComplexNumberAndIntegerAreUnequalEvenIfRealPartIsEqualToInteger [
	self deny: 1 + 3 i equals: 1.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testComplexNumberIsNotEqualToObjectsOfADifferentType [
	self deny: 1 i equals: nil.
	self deny: nil equals: 1 i.
	self deny: 1 i equals: #(1 2 3).
	self deny: #(1 2 3) equals: 1 i.
]

{ #category : #division }
PMComplexNumberBinaryOperationsTests >> testDividingPolynomial [
	| c poly |
	c := 4 + 4 i.
	poly := PMPolynomial coefficients: #(1 0 1).
	self assert: poly / c equals: 1 / c * poly
]

{ #category : #division }
PMComplexNumberBinaryOperationsTests >> testDividingTwoComplexNumbers [
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
PMComplexNumberBinaryOperationsTests >> testEqualsIsReflexive [
	| z |
	z := -10 + 10 i.
	 
	self assert: z equals: z.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testEqualsIsSymmetric [
	| z w |
	
	z := 13 + 14 i.
	w := 13 + 14 i.
	
	self assert: z equals: w.
	self assert: w equals: z
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testEqualsIsSymmetricWithComplexNumbersAndIntegers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testEqualsIsSymmetricWithFractions [
	self assert: 1 / 2 + 0 i equals: 1 / 2.
	self assert: 1 / 2 equals: 1 / 2 + 0 i
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testEqualsIsSymmetricWithRealNumbers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testEqualsIsTransitive [
	| z w u |
	
	z := 4 - 1 i.
	w := 4 - 1 i.
	u := 4 - 1 i.
	
	self assert: z equals: w.
	self assert: w equals: u.
	self assert: z equals: u.
]

{ #category : #multiplication }
PMComplexNumberBinaryOperationsTests >> testMultiplyByI [
	| c |
	c := 5 - 6 i.
	self assert: c * 1 i equals: c i
]

{ #category : #multiplication }
PMComplexNumberBinaryOperationsTests >> testProductWithVector [
	| v c |
	c := 1 + 1 i.
	v := PMVector new: 1.
	v at: 1 put: 1.
	self assert: (v * c at: 1) equals: c.
	self assert: (c * v at: 1) equals: c
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testPureImaginaryNumbersAreNotEqualToZero [
	self deny: 1 i equals: 0.
	self deny: 0 equals: 1 i.
]

{ #category : #division }
PMComplexNumberBinaryOperationsTests >> testSecureDivision1 [
	"self run: #testSecureDivision1"
	"self debug: #testSecureDivision1"
	
	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 divideSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #division }
PMComplexNumberBinaryOperationsTests >> testSecureDivision2 [
	"self run: #testSecureDivision2"
	"self debug: #testSecureDivision2"
	
	| c1 c2 quotient |
 	c1 := 2.0e252 + 3.0e70 i.
 	c2 := c1.
 	quotient := c1 divideFastAndSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #subtraction }
PMComplexNumberBinaryOperationsTests >> testSubtractToPolynomial [
	| c poly |
	poly := PMPolynomial coefficients: #(1 2 3).
	c := 1 + 3 i.
	self assert: (c - poly at: 0) equals: 3 i.
	self assert: (poly - c at: 0) equals: -3 i
]

{ #category : #multiplication }
PMComplexNumberBinaryOperationsTests >> testTimesPolynomial [
	| c poly |
	c := 1 + 1 i.
	poly := PMPolynomial coefficients: #(1).
	self assert: (c * poly at: 0) equals: c.
	self assert: (poly * c at: 0) equals: c
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testTwoComplexNumbersWithDifferentImaginaryPartsAreNotEqual [
	| z w |
	z := 1 + 3 i.
	w := 1 + 2 i.
	
	self deny: z equals: w.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testTwoComplexNumbersWithDifferentRealPartsAreNotEqual [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| z w |
	z := 4 + 3 i.
	w := -7 + 3 i.
	
	self deny: z equals: w.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTests >> testZeroComplexNumberIsEqualToIntegerZero [
	self assert: 0 i equals: 0.
	self assert: 0 equals: 0 i.
]
