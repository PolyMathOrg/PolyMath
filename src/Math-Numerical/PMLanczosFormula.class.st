"
A DhbLanczosFormula is a singleton class which calculates an approximation to Gamma(x). 
Gamma function is a continuous extension to Factorial. Gamma(x + 1) = x * Gamma(x). For integers Gamma(n) = (n-1) factorial. 

This is called from Number>>gamma, and Number>>logGamma.

Instance variable coefficients contains the terms of the approximation.


The method is detailed in Numerical Recipes in C. The implementation is detailed in Besset's book Section 2.4

"
Class {
	#name : #PMLanczosFormula,
	#superclass : #Object,
	#instVars : [
		'coefficients',
		'sqrt2Pi'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMLanczosFormula class >> new [
		"Answer a unique instance. Create it if it does not exist."
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new.
					 UniqueInstance initialize.
					].
	^UniqueInstance
]

{ #category : #'instance creation' }
PMLanczosFormula class >> reset [
	UniqueInstance := nil.
]

{ #category : #information }
PMLanczosFormula >> gamma: aNumber [
	^ (self leadingFactor: aNumber) exp * (self series: aNumber) * sqrt2Pi / aNumber
]

{ #category : #initialization }
PMLanczosFormula >> initialize [
	"Private"

	sqrt2Pi := (Float pi * 2) sqrt.
	coefficients := #(76.18009172947146 -86.50532032941677 24.01409824083091 -1.231739572450155 0.1208650973866179e-2 -0.5395239384953e-5)
]

{ #category : #information }
PMLanczosFormula >> leadingFactor: aNumber [
	"Private"

	| temp |
	temp := aNumber + 5.5.
	^ temp ln * (aNumber + 0.5) - temp
]

{ #category : #information }
PMLanczosFormula >> logGamma: aNumber [
	^ (self leadingFactor: aNumber) + ((self series: aNumber) * sqrt2Pi / aNumber) ln
]

{ #category : #information }
PMLanczosFormula >> series: aNumber [
	"Private"

	| term |
	term := aNumber.
	^ coefficients
		inject: 1.000000000190015
		into: [ :sum :each | 
			term := term + 1.
			each / term + sum ]
]
