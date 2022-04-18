Class {
	#name : #PMNumberTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #'complex conjugation' }
PMNumberTest >> testComplexConjugateOfAnIntegerIsAnInteger [
	|complexConjugateOfInteger|
	
	complexConjugateOfInteger := -5 complexConjugate. 
	
	self assert: complexConjugateOfInteger equals: -5.
]

{ #category : #'complex conjugation' }
PMNumberTest >> testComplexConjugateOfRealFractionIsARealFraction [
	| complexConjugateOfFraction |
	complexConjugateOfFraction := (Fraction numerator: 1 denominator: 6) complexConjugate.
	
	self assert: complexConjugateOfFraction equals: (Fraction numerator: 1 denominator: 6) .
]

{ #category : #'complex conjugation' }
PMNumberTest >> testComplexConjugateOfRealNumberIsItself [			
	|realNumber|
	realNumber := 4.5 complexConjugate. 
			
	self assert: realNumber equals: 4.5
]
