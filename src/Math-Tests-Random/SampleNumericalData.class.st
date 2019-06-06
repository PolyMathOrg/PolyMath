"
I generate sample numerical data for the convergence tests given a size and distribution/PRNG

messages: 
 - generateASampleOfSize: size usingGenerator:gen
"
Class {
	#name : #SampleNumericalData,
	#superclass : #Object,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
SampleNumericalData class >> generateASampleOfSize: size usingGenerator: gen [ 
	"Generates sample data given a distribution"
	| sample |
	sample := OrderedCollection new.
	size timesRepeat: [ sample add: gen next ].
	^ sample
		
]
