Class {
	#name : #PMComplexNumberBinaryOperationsTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAddingComplexNumbersToFractions [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| sum expected z |
	z := 1 + 22 i.
	
	sum := z + (Fraction numerator: 3 denominator: 7).
	
	expected := (10 / 7) + 22 i.
	self assert: sum equals: expected.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAddingToPolynomials [
	| c poly |
	c := 6 - 6 i.
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAddingToRealNumbers [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| z sum expected |
	z:= 3 - 9 i.
	sum := z  + 9.12.
	
	expected := 12.12 - 9 i.
	self assert: sum equals: expected.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAddingTwoComplexNumbers [
	"self run: #testAdding"

	| c |
	c := 5 - 6 i + (-5 + 8 i).	"Complex with Complex"
	self assert: c equals: 0 + 2 i
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAdditionIsAssociative [
	| z w u expected |
	
	z := 1 + 3 i.
	w := 7 - 2 i.
	u := -9 + 8 i.
	
	expected := -1 + 9 i.
	self assert: (z + w) + u equals: expected.
	self assert: z + (w + u) equals: expected.
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAdditionIsCommutative [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| z w expected |
	z := 5 - 6 i.
	w := -8 + 1 i.
	
	expected := -3 - 5 i.
	self assert: (z + w) equals: expected.
	self assert: (w + z) equals: expected.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEquality [
	"self run: #testEquality"

	"self debug: #testEquality"

	self assert: 0 i equals: 0.
	self assert: 0 i isZero.

	"Some more stuff"
	self deny: 1 i equals: nil.
	self deny: nil equals: 1 i.
	self deny: 1 i equals: #(1 2 3).
	self deny: #(1 2 3) equals: 1 i.
	self deny: 1 + 3 i equals: 1.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEqualsIsReflexive [
	| z |
	z := -10 + 10 i.
	 
	self assert: z equals: z.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEqualsIsSymmetric [
	| z w |
	
	z := 13 + 14 i.
	w := 13 + 14 i.
	
	self assert: z equals: w.
	self assert: w equals: z
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEqualsIsSymmetricWithComplexNumbersAndIntegers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #tests }
PMComplexNumberBinaryOperationsTest >> testEqualsIsSymmetricWithFractions [
	self assert: 1 / 2 + 0 i equals: 1 / 2.
	self assert: 1 / 2 equals: 1 / 2 + 0 i
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEqualsIsSymmetricWithRealNumbers [
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEqualsIsTransitive [
	| z w u |
	
	z := 4 - 1 i.
	w := 4 - 1 i.
	u := 4 - 1 i.
	
	self assert: z equals: w.
	self assert: w equals: u.
	self assert: z equals: u.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testPureImaginaryNumbersAreNoteEqualToZero [
	self deny: 1 i equals: 0.
	self deny: 0 equals: 1 i.
]

{ #category : #division }
PMComplexNumberBinaryOperationsTest >> testSecureDivision1 [
	"self run: #testSecureDivision1"
	"self debug: #testSecureDivision1"
	
	| c1 c2 quotient |
	c1 := 2.0e252 + 3.0e70 i.
	c2 := c1.
	quotient := c1 divideSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #division }
PMComplexNumberBinaryOperationsTest >> testSecureDivision2 [
	"self run: #testSecureDivision2"
	"self debug: #testSecureDivision2"
	
	| c1 c2 quotient |
 	c1 := 2.0e252 + 3.0e70 i.
 	c2 := c1.
 	quotient := c1 divideFastAndSecureBy: c2.
	self assert: (quotient - 1) isZero.
	
]

{ #category : #subtraction }
PMComplexNumberBinaryOperationsTest >> testSubtractToPolynomial [
	| c poly |
	poly := PMPolynomial coefficients: #(1 2 3).
	c := 1 + 3 i.
	self assert: (c - poly at: 0) equals: 3 i.
	self assert: (poly - c at: 0) equals: -3 i
]

{ #category : #multiplication }
PMComplexNumberBinaryOperationsTest >> testTimesPolynomial [
	| c poly |
	c := 1 + 1 i.
	poly := PMPolynomial coefficients: #(1).
	self assert: (c * poly at: 0) equals: c.
	self assert: (poly * c at: 0) equals: c
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testTwoComplexNumbersWithDifferentImaginaryPartsAreNotEqual [
	| z w |
	z := 1 + 3 i.
	w := 1 + 2 i.
	
	self deny: z equals: w.
]

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testTwoComplexNumbersWithDifferentRealPartsAreNotEqual [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| z w |
	z := 4 + 3 i.
	w := -7 + 3 i.
	
	self deny: z equals: w.
]
