Class {
	#name : #PMLeastSquareFit,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'dataHolder',
		'errorMatrix',
		'chiSquare',
		'equations',
		'constants',
		'degreeOfFreedom'
	],
	#category : 'Math-DHB-Numerical'
}

{ #category : #creation }
PMLeastSquareFit class >> histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass [ 
	^self points: aHistogram
		function: (PMScaledProbabilityDensityFunction histogram: aHistogram
				distributionClass: aProbabilityDensityFunctionClass)
]

{ #category : #creation }
PMLeastSquareFit class >> points: aDataHolder function: aParametricFunction [
	^aParametricFunction isNil
		ifTrue: [nil]
		ifFalse: [self new initialize: aDataHolder data: aParametricFunction]
]

{ #category : #operation }
PMLeastSquareFit >> accumulate: aWeightedPoint [
		"Private"
	| f g |
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last.
	f := f first.
	constants accumulate: g * ( ( aWeightedPoint yValue - f) * aWeightedPoint weight).
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * aWeightedPoint weight).
		]
]

{ #category : #operation }
PMLeastSquareFit >> accumulateEquationSystem [
		"Private"
	dataHolder pointsAndErrorsDo: [ :each | self accumulate: each]
]

{ #category : #information }
PMLeastSquareFit >> chiSquare [
	chiSquare isNil
		ifTrue: [ self computeChiSquare].
	^chiSquare
]

{ #category : #operation }
PMLeastSquareFit >> computeChanges [
		"Private"
	errorMatrix := PMLUPDecomposition direct: equations.
	^(errorMatrix solve: constants)ifNil:[PMSingularMatrixError new signal:'singular Errormatrix']
]

{ #category : #information }
PMLeastSquareFit >> computeChiSquare [
		"Private"
	chiSquare := 0.
	degreeOfFreedom := self numberOfFreeParameters negated.
	dataHolder pointsAndErrorsDo:
		[ :each |
		  chiSquare := ( each chi2Contribution: result) + chiSquare.
		  degreeOfFreedom := degreeOfFreedom + 1.
		].
]

{ #category : #operation }
PMLeastSquareFit >> computeEquationSystem [
		"Private"
	constants atAllPut: 0.
	equations do: [ :each | each atAllPut: 0].
	self accumulateEquationSystem.
]

{ #category : #information }
PMLeastSquareFit >> confidenceLevel [
	^( PMChiSquareDistribution degreeOfFreedom: self degreeOfFreedom) confidenceLevel: self chiSquare
]

{ #category : #information }
PMLeastSquareFit >> degreeOfFreedom [
	degreeOfFreedom isNil
		ifTrue: [ self computeChiSquare].
	^degreeOfFreedom
]

{ #category : #information }
PMLeastSquareFit >> errorMatrix [
	errorMatrix inverseMatrixComponents
		ifNil: [ PMSingularMatrixError new signal: 'singular Errormatrix' ]
		ifNotNil: [ :i | ^ PMSymmetricMatrix rows: i ]
]

{ #category : #operation }
PMLeastSquareFit >> evaluateIteration [
		"Dummy method (must be implemented by subclass)."
	| changes maxChange|
	self computeEquationSystem.
	changes := self computeChanges.
	result changeParametersBy: changes.
	maxChange := 0.
	result parameters with: changes do: 
		[ :r :d | maxChange := ( d / r) abs max: maxChange].
	^maxChange
]

{ #category : #operation }
PMLeastSquareFit >> finalizeIterations [
	equations := nil.
	constants := nil.
	degreeOfFreedom := nil.
	chiSquare := nil
]

{ #category : #information }
PMLeastSquareFit >> fitType [
	^ 'Least square fit'
]

{ #category : #initialization }
PMLeastSquareFit >> initialize: aDataHolder data: aParametricFunction [
		"Private"
	dataHolder := aDataHolder.
	result := aParametricFunction
]

{ #category : #operation }
PMLeastSquareFit >> initializeIterations [

	| n |
	n := self numberOfParameters.
	constants := (PMVector new: n)
				atAllPut: 0;
				yourself.
	equations := (1 to: n) collect: 
					[:k | 
					(PMVector new: n)
						atAllPut: 0;
						yourself]
]

{ #category : #information }
PMLeastSquareFit >> numberOfFreeParameters [
	"Private"

	^ self numberOfParameters
]

{ #category : #information }
PMLeastSquareFit >> numberOfParameters [
		"Private"
	^result parameters size
]

{ #category : #information }
PMLeastSquareFit >> value: aNumber [
	^result value: aNumber
]

{ #category : #information }
PMLeastSquareFit >> valueAndError: aNumber [
	| valueGradient |
	valueGradient := result valueAndGradient: aNumber.
	^Array with: valueGradient first
		   with: ( valueGradient last * ( self errorMatrix * valueGradient last)) sqrt
]
