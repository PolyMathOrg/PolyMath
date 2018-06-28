"
A DhbDecimalFloatingNumberTest is a test class for testing the behavior of DhbDecimalFloatingNumber
"
Class {
	#name : #PMDecimalFloatingNumberTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-DHB-Numerical'
}

{ #category : #tests }
PMDecimalFloatingNumberTest >> testAdd [
	| a b sum |
	a := PMDecimalFloatingNumber new: 0.10101.
	b := PMDecimalFloatingNumber new: 0.2.
	sum := a + b.
	self assert: (sum isKindOf: PMDecimalFloatingNumber).
	self assert: sum value equals: (b + a) value.
	self assert: (sum value isKindOf: Fraction).
	self assert: sum value asFloat equals: 0.30101
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testDigits [
	self
		assert: PMDecimalFloatingNumber digits
		equals: PMDecimalFloatingNumber defaultDigits.
	PMDecimalFloatingNumber resetDigits.
	self shouldnt: [ PMDecimalFloatingNumber digits isNil ].
	PMDecimalFloatingNumber defaultDigits: 24.
	self shouldnt: [ PMDecimalFloatingNumber digits isNil ].
	self assert: PMDecimalFloatingNumber digits equals: 24.
	self assert: PMDecimalFloatingNumber defaultDigits equals: 15.
	PMDecimalFloatingNumber resetDigits
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testDisplay [
	| a |
	a := PMDecimalFloatingNumber new: 1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated.
	a := PMDecimalFloatingNumber new: 0.1.
	self
		assert: (a printString substrings: 'E') last asInteger
		equals: a class digits negated - 1
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testDivide [
	| a b |
	a := PMDecimalFloatingNumber new: 0.10101.
	b := PMDecimalFloatingNumber new: 0.2.
	self assert: (a / b isKindOf: PMDecimalFloatingNumber).
	self assert: (a / b) value asFloat equals: 0.50505.
	self assert: (b / b) value equals: 1
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testMultiply [
	| a b |
	a := PMDecimalFloatingNumber new: 0.10101.
	b := PMDecimalFloatingNumber new: 0.2.
	self assert: (a * b isKindOf: PMDecimalFloatingNumber).
	self assert: (a * b) value asFloat equals: 0.020202.
	self assert: (b * b) value equals: 1 / 25.
	self assert: (b * b) value asFloat equals: 0.04
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testRoundingErrors [
	| a b |
	a := PMDecimalFloatingNumber new: (2 raisedTo: 64).
	b := PMDecimalFloatingNumber new: 300.
	self assert: (a + b) value equals: a value
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testSqrt [
	| a aSqrt |
	a := PMDecimalFloatingNumber new: 0.01.
	aSqrt := a sqrt.
	self assert: aSqrt value asFloat equals: a value asFloat sqrt.
	self assert: aSqrt value equals: 1 / 10
]

{ #category : #tests }
PMDecimalFloatingNumberTest >> testSubtract [
	| a b difference |
	a := PMDecimalFloatingNumber new: 0.1.
	b := PMDecimalFloatingNumber new: 0.2.
	difference := b - a.
	self assert: (difference isKindOf: PMDecimalFloatingNumber).

	" this errors raised by ln (domain is x > 0)"
	self should: [ difference value ~= (a - b) value ] raise: Error.
	self
		should: [ difference value = (a - b) value negated ]
		raise: Error.
	self assert: (difference value isKindOf: Fraction).
	self assert: difference value asFloat equals: 0.1
]
