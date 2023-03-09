Class {
	#name : #PMLinearRegression,
	#superclass : #Object,
	#instVars : [
		'sum1',
		'sumX',
		'sumY',
		'sumXX',
		'sumYY',
		'sumXY',
		'slope',
		'intercept',
		'correlationCoefficient'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMLinearRegression class >> new [
		"Create a new instance of the receiver."
	^( super new) reset; yourself
]

{ #category : #transformation }
PMLinearRegression >> add: aPoint [
		"Accumulate aPoint into of the receiver."
	self add: aPoint weight: 1
]

{ #category : #transformation }
PMLinearRegression >> add: aPoint weight: aNumber [
	"Accumulate aPoint into of the receiver."

	sum1 := sum1 + aNumber.
	sumX := sumX + (aPoint x * aNumber).
	sumY := sumY + (aPoint y * aNumber).
	sumXX := sumXX + (aPoint x squared * aNumber).
	sumYY := sumYY + (aPoint y squared * aNumber).
	sumXY := sumXY + (aPoint x * aPoint y * aNumber).
	self resetResults
]

{ #category : #information }
PMLinearRegression >> asEstimatedPolynomial [
		"Answer the resulting linear dependence found by the receiver in the form of a polynomial
		 with embedded error matrix."
	^( PMEstimatedPolynomial coefficients: self coefficients)
			errorMatrix: self errorMatrix;
			yourself
]

{ #category : #information }
PMLinearRegression >> asPolynomial [
		"Answer the resulting linear dependence found by the receiver in the form of a polynomial."
	^PMPolynomial coefficients: self coefficients
]

{ #category : #information }
PMLinearRegression >> coefficients [
		"Private"
	^Array with: self intercept with: self slope
]

{ #category : #transformation }
PMLinearRegression >> computeResults [
	"Private - Compute the results of the receiver."

	| xNorm xyNorm |
	xNorm := sumXX * sum1 - (sumX * sumX).
	xyNorm := sumXY * sum1 - (sumX * sumY).
	slope := xyNorm / xNorm.
	intercept := (sumXX * sumY - (sumXY * sumX)) / xNorm.
	correlationCoefficient := xyNorm
				/ (xNorm * (sumYY * sum1 - (sumY * sumY))) sqrt
]

{ #category : #information }
PMLinearRegression >> correlationCoefficient [
	"Answers the correlation coefficient of the receiver."

	correlationCoefficient ifNil: [ self computeResults ].
	^ correlationCoefficient
]

{ #category : #information }
PMLinearRegression >> errorMatrix [
	"Answer the resulting linear dependence found by the receiver in the form of a polynomial
		 with embedded error matrix."

	| c1 cx cxx |
	c1 := 1.0 / (sumXX * sum1 - sumX squared).
	cx := sumX negated * c1.
	cxx := sumXX * c1.
	c1 := sum1 * c1.
	^PMSymmetricMatrix rows: (Array with: (Array with: cxx with: cx)
				with: (Array with: cx with: c1))
]

{ #category : #information }
PMLinearRegression >> errorOnIntercept [
	^(sumXX / (sumXX * sum1 - sumX squared)) sqrt
]

{ #category : #information }
PMLinearRegression >> errorOnSlope [
	^(sum1 / (sumXX * sum1 - sumX squared)) sqrt
]

{ #category : #information }
PMLinearRegression >> intercept [
	"Answers the intercept of the receiver."

	intercept ifNil: [ self computeResults ].
	^ intercept
]

{ #category : #transformation }
PMLinearRegression >> remove: aPoint [
	"Remove aPoint which was accumulated into of the receiver."

	sum1 := sum1 - 1.
	sumX := sumX - aPoint x.
	sumY := sumY - aPoint y.
	sumXX := sumXX - aPoint x squared.
	sumYY := sumYY - aPoint y squared.
	sumXY := sumXY - (aPoint x * aPoint y).
	self resetResults
]

{ #category : #transformation }
PMLinearRegression >> reset [
	"Set all accumulators of the receiver to zero and reset its results."

	sum1 := 0.
	sumX := 0.
	sumY := 0.
	sumXX := 0.
	sumYY := 0.
	sumXY := 0.
	self resetResults
]

{ #category : #transformation }
PMLinearRegression >> resetResults [
		"Private - Reset the results of the receiver."
	slope := nil.
	intercept := nil.
	correlationCoefficient := nil
]

{ #category : #information }
PMLinearRegression >> slope [
	"Answers the slope of the receiver."

	slope ifNil: [ self computeResults ].
	^ slope
]

{ #category : #information }
PMLinearRegression >> value: aNumber [
		"Answer the value interpolated at aNumber by the receiver."
	^aNumber * self slope + self intercept
]
