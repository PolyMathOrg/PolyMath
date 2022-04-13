Class {
	#name : #PMComplexNumberBinaryOperationsTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAddPolynomial [
	| c poly |
	c := 6 - 6 i.
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i
]

{ #category : #addition }
PMComplexNumberBinaryOperationsTest >> testAdding [
	"self run: #testAdding"

	| c |
	c := 5 - 6 i + (-5 + 8 i).	"Complex with Complex"
	self assert: c equals: 0 + 2 i
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

{ #category : #equality }
PMComplexNumberBinaryOperationsTest >> testEquality [
	"self run: #testEquality"

	"self debug: #testEquality"

	self assert: 0 i equals: 0.
	self assert: 2 - 5 i equals: 1 - 4 i + (1 - 1 i).
	self assert: 0 i isZero.
	self deny: 1 + 3 i = 1.
	self deny: 1 + 3 i = (1 + 2 i).

	"Some more stuff"
	self deny: 1 i = nil.
	self deny: nil = 1 i.
	self deny: 1 i = #(1 2 3).
	self deny: #(1 2 3) = 1 i.
	self deny: 1 i = 0.
	self deny: 0 = 1 i.
	self assert: 1 + 0 i equals: 1.
	self assert: 1 equals: 1 + 0 i.
	self assert: 1 + 0 i equals: 1.0.
	self assert: 1.0 equals: 1 + 0 i.
	self assert: 1 / 2 + 0 i equals: 1 / 2.
	self assert: 1 / 2 equals: 1 / 2 + 0 i
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
