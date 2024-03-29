Class {
	#name : #PMNevilleInterpolator,
	#superclass : #PMLagrangeInterpolator,
	#instVars : [
		'leftErrors',
		'rightErrors'
	],
	#category : #'Math-Numerical-Math-Interpolator'
}

{ #category : #private }
PMNevilleInterpolator >> computeDifference: aNumber at: anInteger1 order: anInteger2 [

	| leftDist rightDist ratio |
	leftDist := ( self xPointAt: anInteger1) - aNumber.
	rightDist := (  self xPointAt: ( anInteger1 + anInteger2)) - aNumber.
	ratio := ( ( leftErrors at: ( anInteger1 + 1)) - ( rightErrors at: anInteger1)) / ( leftDist - rightDist).
	leftErrors at: anInteger1 put: ratio * leftDist.
	rightErrors at: anInteger1 put: ratio * rightDist
]

{ #category : #information }
PMNevilleInterpolator >> defaultSamplePoints [

	^SortedCollection sortBlock: [ :a :b | a x < b x]
]

{ #category : #initialization }
PMNevilleInterpolator >> initialize [

	super initialize.
	leftErrors := Array new.
	rightErrors := Array new
]

{ #category : #initialization }
PMNevilleInterpolator >> initializeDifferences: aNumber [

	| size nearestIndex dist minDist |
	size := pointCollection size.
	leftErrors size = size
		ifFalse:[ leftErrors := Array new: size.
				  rightErrors := Array new: size.
				].
	minDist := ( ( self xPointAt: 1) - aNumber) abs.
	nearestIndex := 1.
	leftErrors at: 1 put: ( self yPointAt: 1).
	rightErrors at: 1 put: leftErrors first.
	2 to: size do:
		[ :n |
		  dist := ( ( self xPointAt: n) - aNumber) abs.
		  dist < minDist
			ifTrue: [ dist = 0
						ifTrue: [ ^n negated].
					  nearestIndex := n.
					  minDist := dist.
					].
		 leftErrors at: n put: ( self yPointAt: n).
		 rightErrors at: n put: ( leftErrors at: n).
		].
	^nearestIndex
]

{ #category : #information }
PMNevilleInterpolator >> value: aNumber [
	"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber."
	^(self valueAndError: aNumber) first
]

{ #category : #information }
PMNevilleInterpolator >> valueAndError: aNumber [
	"Compute and return the interpolated value of the interpolation Lagranage polynomial and its estimated error."
	| size nearestIndex answer error |
	nearestIndex := self initializeDifferences: aNumber.
	nearestIndex < 0
		ifTrue: [ ^Array with: ( self yPointAt: nearestIndex negated) with: 0].
	answer := leftErrors at: nearestIndex.
	nearestIndex := nearestIndex - 1.
	size := pointCollection size.
	1 to: ( size - 1) do:
		[ :m |
		  1 to: ( size - m) do:
			[ :n | self computeDifference: aNumber at: n order: m].
		  size - m > ( 2 * nearestIndex)
				ifTrue: [ error := leftErrors at: ( nearestIndex + 1) ]
				ifFalse:[ error := rightErrors at: ( nearestIndex).
							  nearestIndex := nearestIndex - 1.
							].
		  answer := answer + error.
		].
	^Array with: answer with: error abs
]
