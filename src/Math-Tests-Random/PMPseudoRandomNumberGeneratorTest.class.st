Class {
	#name : #PMPseudoRandomNumberGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #private }
PMPseudoRandomNumberGeneratorTest >> pseudoRandomNumberGeneratorsDo: aBlock [
	"Instanciates a pseudo random number generator 
	to yield to the block"

	PMPseudoRandomNumberGenerator subclasses
		do: [ :typeOfGenerator | 
			| generator |
			generator := typeOfGenerator new.
			aBlock value: generator ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamDoesntRespondToContents [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | self should: [ gen contents ] raise: Error ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamIsReadOnly [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | 
			self shouldnt: [ gen isWriteable ].
			self assert: gen isReadable ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamNeverEnds [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | self shouldnt: [ gen atEnd ] ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamPeekIsNext [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | 
			| value |
			value := gen peek.
			self assert: gen peek equals: value.
			self assert: gen next equals: value ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamProducesNumbers [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | 
			self assert: gen next isNumber.
			self assert: gen next isFloat ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamProducesRandomNumbers [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | 
			| value |
			value := gen next.
			self shouldnt: [ gen next = value ] ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testNextGivesArrayOfNumbers [
	self
		pseudoRandomNumberGeneratorsDo: [ :gen | 
			| samples |
			samples := gen next: 10.
			self assert: samples size equals: 10.
			self assert: (samples at: 1) isFloat.
			self assert: samples asSet size equals: 10 ]
]
