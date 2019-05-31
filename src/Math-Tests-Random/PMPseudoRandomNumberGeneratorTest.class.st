Class {
	#name : #PMPseudoRandomNumberGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamDoesntRespondToContents [
	PMPseudoRandomNumberGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self should: [ gen contents ] raise: Error ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamIsReadOnly [
	PMPseudoRandomNumberGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self shouldnt: [ gen isWriteable ].
			self assert: gen isReadable ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamNeverEnds [
	PMPseudoRandomNumberGenerator subclasses do: 
	[:cls | | gen |
		gen := cls new.
		self shouldnt: [gen atEnd]].
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamPeekIsNext [
	PMPseudoRandomNumberGenerator subclasses
		do: [ :cls | 
			| gen value |
			gen := cls new.
			value := gen peek.
			self assert: gen peek equals: value.
			self assert: gen next equals: value ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamProducesNumbers [
	PMPseudoRandomNumberGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self assert: gen next isNumber.
			self assert: gen next isFloat ]
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testGeneratorStreamProducesRandomNumbers [
	PMPseudoRandomNumberGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		value := gen next.
		self shouldnt: [gen next = value]].
]

{ #category : #tests }
PMPseudoRandomNumberGeneratorTest >> testNextGivesArrayOfNumbers [
	PMPseudoRandomNumberGenerator subclasses
		do: [ :cls | 
			| gen samples |
			gen := cls new.
			samples := gen next: 10.
			self assert: samples size equals: 10.
			self assert: (samples at: 1) isFloat.
			self assert: samples asSet size equals: 10 ]
]
