Class {
	#name : #PMComplexConjugateOfAComplexNumberTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testComplexConjugate [
	| z complexConjugateOfZ expected |
	z := 5 - 6 i.
	
	complexConjugateOfZ := z complexConjugate .
	
	expected := 5 + 6 i.
	self assert: complexConjugateOfZ equals: expected.
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfConjugateComplex [

	self assert: ((3 + 2i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfConjugateComplexAndReal [

	self assert: ((5 + 0i) isComplexConjugateOf: 5)
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfConjugateRealAndComplex [

	self assert: (5 isComplexConjugateOf: (5 - 0i))
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfDifferentReal [

	self deny: (-5 isComplexConjugateOf: 5)
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfNonConjugateComplexAndReal [

	self deny: ((5 + 3i) isComplexConjugateOf: 5)
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfNonConjugateDifferentComplex [

	self deny: ((-0.5 - 1i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfNonConjugateRealAndComplex [

	self deny: (5 isComplexConjugateOf: (5 - 3i))
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfSameComplex [

	self deny: ((3 - 2i) isComplexConjugateOf: (3 - 2i))
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexConjugateOfSameReal [

	self assert: (5 isComplexConjugateOf: 5)
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexNumberOnComplex [
	
	self assert: (3 + 2i) isComplexNumber
]

{ #category : #tests }
PMComplexConjugateOfAComplexNumberTest >> testIsComplexNumberOnNaN [
	
	self deny: Character space isComplexNumber
]
