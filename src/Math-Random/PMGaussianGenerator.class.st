"
A GaussianGenerator uses a Normal Distribution.

"
Class {
	#name : #PMGaussianGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'mean',
		'standardDeviation',
		'nextGaussian'
	],
	#category : 'Math-Random'
}

{ #category : #testing }
PMGaussianGenerator >> hasNextGaussian [
	^nextGaussian notNil
]

{ #category : #initialization }
PMGaussianGenerator >> initialize [
	super initialize.
	self mean: 0.
	self standardDeviation: 1
]

{ #category : #accessing }
PMGaussianGenerator >> mean: aMeanValue [
	mean := aMeanValue
]

{ #category : #'stream access' }
PMGaussianGenerator >> next [
	^ self nextGaussianNormalized * standardDeviation + mean
]

{ #category : #'stream access' }
PMGaussianGenerator >> nextGaussianNormalized [
	| x1 x2 w y1 y2 |
	self hasNextGaussian
		ifTrue: [ 
			[^ nextGaussian] ensure: [ nextGaussian := nil ] ].
	[ 
	x1 := 2.0 * randomNumberGenerator nextFloat - 1.0.
	x2 := 2.0 * randomNumberGenerator nextFloat - 1.0.
	w := x1 * x1 + (x2 * x2).
	w >= 1.0 ] whileTrue.
	w := (-2.0 * w ln / w) sqrt.
	y1 := x1 * w.
	y2 := x2 * w.
	nextGaussian := y2.
	^ y1
]

{ #category : #accessing }
PMGaussianGenerator >> standardDeviation: aStandardDeviation [
	standardDeviation := aStandardDeviation
]
