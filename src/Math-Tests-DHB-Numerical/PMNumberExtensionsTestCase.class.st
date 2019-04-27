"
A DhbNumberExtensionsTestCase is a suite of tests for extension methods to Number, Integer, and Float defined in Didier Besset's book Object Oriented Numerical Methods
"
Class {
	#name : #PMNumberExtensionsTestCase,
	#superclass : #TestCase,
	#category : #'Math-Tests-DHB-Numerical'
}

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testBeta [
	"Code example 2.14"

	| value |
	value := 2.5 gamma * 5.5 gamma / 8 gamma.
	self assert: ((2.5 beta: 5.5) - value) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testBetaLog [
	"Code example 2.15"

	| value |
	value := (2.5 gamma * 5.5 gamma / 8 gamma) ln.
	self assert: ((2.5 logBeta: 5.5) - value) abs < 1.0e-13
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testErrorFunctionCentile [
	"Code example 2.5"

	| weight average stDev centile |
	weight := 2.85.
	average := 3.39.
	stDev := 0.44.
	centile := ((weight - average) / stDev) errorFunction * 100.
	self assert: (centile - 10.986012) abs < 0.000001
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testGamma [
	"Code example 2.10"

	| value |
	value := Float pi sqrt * 3 / 4.
	self assert: (2.5 gamma - value) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testGammaLog [
	"Code example 2.11"

	| value |
	value := 2.5 gamma ln.
	self assert: (2.5 logGamma - value) abs < 1.0e-13
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testGammaLow [
	| value |
	value := Float pi sqrt / 2.
	self assert: ((3 / 2) gamma - value) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumberExtensionsTestCase >> testGammaNegative [
	| value |
	value := Float pi / (1.5 gamma * (Float pi / -2) sin).
	self assert: ((-1 / 2) gamma - value) abs < 1.0e-14
]
