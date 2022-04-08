Class {
	#name : #PMNumberTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Complex'
}

{ #category : #tests }
PMNumberTest >> testComplexConjugateOfAnIntegerIsAnInteger [
	|complexConjugateOfInteger|
	
	complexConjugateOfInteger := -5 complexConjugate. 
	
	self assert: complexConjugateOfInteger equals: -5.
]

{ #category : #tests }
PMNumberTest >> testComplexConjugateOfRealNumberIsItself [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|realNumber|
	realNumber := 4.5 complexConjugate. 
			
	self assert: realNumber equals: 4.5
]
