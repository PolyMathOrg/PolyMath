Class {
	#name : #PMPolynomialTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Polynomials'
}

{ #category : #comparing }
PMPolynomialTest >> testIsZero [
	| p1 p2 |
	p1 := PMPolynomial coefficients: #(0 0 0 0 0).
	p2 := PMPolynomial coefficients: #(0 0 0 0 1 0 0 0).
	self assert: p1 isZero.
	self shouldnt: [ p2 isZero ]
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialAddition [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1))
		+ (PMPolynomial coefficients: #(-3 7 2 1)).
	self assert: (polynomial at: 0) equals: -1.
	self assert: (polynomial at: 1) equals: 4.
	self assert: (polynomial at: 2) equals: 3.
	self assert: (polynomial at: 3) equals: 1.
	self assert: (polynomial at: 4) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialDerivative [
	"Code example 2.3"

	| polynomial |
	polynomial := (PMPolynomial coefficients: #(-3 7 2 1)) derivative.
	self assert: (polynomial at: 0) equals: 7.
	self assert: (polynomial at: 1) equals: 4.
	self assert: (polynomial at: 2) equals: 3.
	self assert: (polynomial at: 3) equals: 0.
	self assert: (polynomial at: 4) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialDivision [
	| pol1 pol2 polynomial |
	pol1 := PMPolynomial coefficients: #(2 -3 1).
	pol2 := PMPolynomial coefficients: #(-6 23 -20 3 -1 1).
	polynomial := pol2 / pol1.
	self assert: (polynomial at: 0) equals: -3.
	self assert: (polynomial at: 1) equals: 7.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 1.
	self assert: (polynomial at: 4) equals: 0.
	self assert: (polynomial at: 5) equals: 0.
	self assert: (polynomial at: 6) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialDivisionBug [
	"identify an error when trying to create a zero dividend"

	| pol1 pol2 |
	pol1 := PMPolynomial coefficients: #( 2 -3 1 ).
	pol2 := PMPolynomial coefficients: #( -6 23 -20 3 -1 1 ).
	self shouldnt: [ pol1 / pol2 ] raise: Error
]

{ #category : #arithmetic }
PMPolynomialTest >> testPolynomialDoubleDispatch [
	| n p |
	n := 3.2.
	p := PMPolynomial coefficients: #(1 0 1).
	self assert: p + n equals: n + p.
	self assert: p * n equals: n * p.
	n := 3.
	self assert: p + n equals: n + p.
	self assert: p * n equals: n * p.
	self shouldnt: [ n - p = (p - n) ].
	self assert: n - p equals: (p - n) * -1.
	n := 1 / 2.
	self assert: n + p equals: p + n.
	self assert: n - p equals: (p - n) negated
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialEvaluation [
	"Code example 2.2"

	| polynomial |
	polynomial := PMPolynomial coefficients: #(2 -3 1).
	self assert: 0 equals: (polynomial value: 1)
]

{ #category : #comparing }
PMPolynomialTest >> testPolynomialHash [
	"polynomial hash is hash of coefficient array"

	| p1 p2 p3 |
	p1 := PMPolynomial coefficients: #(1 0 1).
	p2 := PMPolynomial coefficients: #(1 0 1).
	p3 := PMPolynomial coefficients: #(1 1 1).
	self assert: p1 hash equals: p1 hash.
	self assert: p2 hash equals: p2 hash.
	self shouldnt: [ p3 hash = p1 hash ].
	self shouldnt: [ p3 hash = p2 hash ].
	p3 := p3 - (PMPolynomial coefficients: #(0 1)).
	self assert: p3 hash equals: p2 hash
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialIntegral [
	"Code example 2.3"

	| polynomial |
	polynomial := (PMPolynomial coefficients: #(-3 7 2 1)) integral.
	self assert: (polynomial at: 0) equals: 0.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 7 / 2.
	self assert: (polynomial at: 3) equals: 2 / 3.
	self assert: (polynomial at: 4) equals: 1 / 4.
	self assert: (polynomial at: 5) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialIntegralWithConstant [
	"Code example 2.3"

	| polynomial |
	polynomial := (PMPolynomial coefficients: #(-3 7 2 1)) integral: 5.
	self assert: (polynomial at: 0) equals: 5.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 7 / 2.
	self assert: (polynomial at: 3) equals: 2 / 3.
	self assert: (polynomial at: 4) equals: 1 / 4.
	self assert: (polynomial at: 5) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialMultiplication [
	"Code example 2.3"

	| pol1 pol2 polynomial |
	pol1 := PMPolynomial coefficients: #(2 -3 1).
	pol2 := PMPolynomial coefficients: #(-3 7 2 1).
	polynomial := pol1 * pol2.
	self assert: (polynomial at: 0) equals: -6.
	self assert: (polynomial at: 1) equals: 23.
	self assert: (polynomial at: 2) equals: -20.
	self assert: (polynomial at: 3) equals: 3.
	self assert: (polynomial at: 4) equals: -1.
	self assert: (polynomial at: 5) equals: 1.
	self assert: (polynomial at: 6) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberAddition [
	| polynomial |
	polynomial := 2 + (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberAdditionInverse [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) + 2.
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberDivision [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) / 2.
	self assert: (polynomial at: 0) equals: 1.
	self assert: (polynomial at: 1) equals: -3 / 2.
	self assert: (polynomial at: 2) equals: 1 / 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberMultiplication [
	| polynomial |
	polynomial := 2 * (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -6.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberMultiplicationInverse [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) * 2.
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -6.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberSubtraction [
	| polynomial |
	polynomial := 2 - (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 0.
	self assert: (polynomial at: 1) equals: 3.
	self assert: (polynomial at: 2) equals: -1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialNumberSubtractionInverse [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) - 2.
	self assert: (polynomial at: 0) equals: 0.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #printing }
PMPolynomialTest >> testPolynomialPrintOn [
	| poly |
	poly := PMPolynomial coefficients: #(1 0 1).
	self assert: poly printString equals: '1 +  X^2'.
	poly := PMPolynomial coefficients: #(1).
	self assert: poly printString equals: '1'
]

{ #category : #'iterative algorithms' }
PMPolynomialTest >> testPolynomialRoots [
	"Code Example 5.5"

	| polynomial roots |
	polynomial := PMPolynomial coefficients: #(-10 -13 -2 1).
	roots := polynomial roots asSortedCollection asArray.
	self assert: roots size equals: 3.
	self
		assert:
			((roots at: 1) + 2) abs
				< PMFloatingPointMachine new defaultNumericalPrecision.
	self
		assert:
			((roots at: 2) + 1) abs
				< PMFloatingPointMachine new defaultNumericalPrecision.
	self
		assert:
			((roots at: 3) - 5) abs
				< PMFloatingPointMachine new defaultNumericalPrecision
]

{ #category : #'function evaluation' }
PMPolynomialTest >> testPolynomialSubtraction [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1))
		- (PMPolynomial coefficients: #(-3 7 2 1)).
	self assert: (polynomial at: 0) equals: 5.
	self assert: (polynomial at: 1) equals: -10.
	self assert: (polynomial at: 2) equals: -1.
	self assert: (polynomial at: 3) equals: -1.
	self assert: (polynomial at: 4) equals: 0
]
