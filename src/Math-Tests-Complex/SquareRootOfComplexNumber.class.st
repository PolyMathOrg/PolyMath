Class {
	#name : #SquareRootOfComplexNumber,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfANegativeRealNumberIsPureImaginary [

	"Given z = -4 + 0 i, the square root is 2 i"

	| squareRoot z |
	z := PMComplex real: -4 imaginary: 0.
	
	squareRoot := z sqrt.
	
	self assert: squareRoot equals: 2 i
]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfComplexNumberIsAComplexNumber [
	| squareRoot z |
	z := PMComplex real: 2 imaginary: 2.
	
	squareRoot := z sqrt.

	self assert: squareRoot real closeTo: 1.55377397.
	self assert: squareRoot imaginary closeTo: 0.643594253
]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfNegativePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [
   | squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: -4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt negated + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary

]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfPositivePureImaginaryNumberIsAComplexNumberWithRealAndImaginaryParts [

	"e.g. square root of 4 i = root(2) + i root(2)"

	| squareRoot expected pureImaginaryNumber |
	pureImaginaryNumber := PMComplex real: 0 imaginary: 4.
	
	squareRoot := pureImaginaryNumber sqrt.

	expected := 2 sqrt + 2 sqrt i.
	self assert: squareRoot real closeTo: expected real.
	self assert: squareRoot imaginary closeTo: expected imaginary
]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfPositiveRealNumberIsAComplexNumberWithOnlyARealPart [

	"Given z = 6 + 0 i, then root z = root 6"

	| squareRoot expected positiveRealNumber |
	positiveRealNumber := PMComplex real: 6 imaginary: 0.
	
	squareRoot := positiveRealNumber sqrt.

	expected := PMComplex real: 6 sqrt imaginary: 0.
	self assert: squareRoot equals: expected
]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquareRootOfZeroIsZero [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| squareRoot expected |
	squareRoot := PMComplex zero sqrt .
	
	expected := PMComplex zero.
	self assert: squareRoot equals: expected.
]

{ #category : #tests }
SquareRootOfComplexNumber >> testSquared [
	"self run: #testSquared"

	"self debug: #testSquared"

	| c c2 |
	c := 6 - 6 i.
	c2 := c squared.
	self assert: c2 imaginary equals: -72.
	self assert: c2 real equals: 0
]
