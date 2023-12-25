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

{ #category : #'algebra - addition' }
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

{ #category : #algebra }
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

{ #category : #'algebra - division' }
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

{ #category : #'algebra - division' }
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

{ #category : #algebra }
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

{ #category : #algebra }
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

{ #category : #algebra }
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

{ #category : #'algebra - multiplication' }
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

{ #category : #'algebra - multiplication' }
PMPolynomialTest >> testPolynomialMultiplicationIsCommutative [

	| expected p q |
	"p(x) = (x - 3) (x - 4), q(x) = x^3 + 1 therefore:
	
	p(x) * q(x) = q(x) * p(x) = x^5 - 7 x^4 + 12 x^3 + x^2 - 7x + 12"
	p := PMPolynomial coefficients: #( 12 -7 1 ).
	q := PMPolynomial coefficients: #( 1 0 0 1 ).
	
	expected := PMPolynomial coefficients: #( 12 -7 1 12 -7 1 ).
	self assert: p * q equals: expected.
	self assert: q * p equals: expected
]

{ #category : #'algebra - addition' }
PMPolynomialTest >> testPolynomialNumberAddition [
	| polynomial |
	polynomial := 2 + (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - addition' }
PMPolynomialTest >> testPolynomialNumberAdditionInverse [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) + 2.
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - division' }
PMPolynomialTest >> testPolynomialNumberDivision [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) / 2.
	self assert: (polynomial at: 0) equals: 1.
	self assert: (polynomial at: 1) equals: -3 / 2.
	self assert: (polynomial at: 2) equals: 1 / 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - multiplication' }
PMPolynomialTest >> testPolynomialNumberMultiplication [
	| polynomial |
	polynomial := 2 * (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -6.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - multiplication' }
PMPolynomialTest >> testPolynomialNumberMultiplicationInverse [
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) * 2.
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -6.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - subtraction' }
PMPolynomialTest >> testPolynomialNumberSubtraction [
	| polynomial |
	polynomial := 2 - (PMPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 0.
	self assert: (polynomial at: 1) equals: 3.
	self assert: (polynomial at: 2) equals: -1.
	self assert: (polynomial at: 3) equals: 0
]

{ #category : #'algebra - subtraction' }
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
	polynomial := PMPolynomial coefficients: #( -10 -13 -2 1 ).
	roots := polynomial roots .
	self assert: roots size equals: 3.
	self assert: (roots at: 1) + 2 closeTo: 0.
	self assert: (roots at: 2) + 1 closeTo: 0.
	self assert: (roots at: 3) - 5 closeTo: 0
]

{ #category : #'iterative algorithms' }
PMPolynomialTest >> testPolynomialRootsConstantsHaveNoRoots [

	| constant |
	"Here, compute the roots of the constant C = 1"
	constant := PMPolynomial coefficients: #( 1 ).
	self
		should: [ constant roots ]
		raise: Error
		description: 'Function''s derivative seems to be zero everywhere'
]

{ #category : #'iterative algorithms' }
PMPolynomialTest >> testPolynomialRootsForLinear [

	| linearPolynomial roots |
	"Here, compute the roots of the linear (2x + 1)"
	linearPolynomial := PMPolynomial coefficients: #( 1 2 ).
	roots := linearPolynomial roots.
	self assert: roots size equals: 1.
	self assert: (roots at: 1) closeTo: -0.5
]

{ #category : #'algebra - subtraction' }
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

{ #category : #'iterative algorithms' }
PMPolynomialTest >> testPolynomialWithRepeatedRoots [
	| polynomialWithRepeatedRoots roots |
	"Here, compute the roots of the quadratic (2x + 1)^2 = 4 x^2 + 4 x + 1"
	polynomialWithRepeatedRoots := PMPolynomial coefficients: #(1 4 4).
	roots := polynomialWithRepeatedRoots roots .
	self assert: roots size equals: 2.
	self assert: (roots at: 1) closeTo: -0.5 .
	self assert: (roots at: 2) closeTo: -0.5 .
]
