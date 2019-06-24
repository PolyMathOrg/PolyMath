Class {
	#name : #PMNumberGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMNumberGeneratorTest >> testPeekIsIdempotent [
	"every subclass should implement some basic behavior."

	PMNumberGenerator subclasses
		do: [ :ea | 
			| random numberGenerator |
			numberGenerator := ea new.
			10
				timesRepeat: [ random := numberGenerator peek.
					self assert: random equals: numberGenerator peek.
					self assert: random equals: numberGenerator next ] ]
]
