"
FunctionFit fits a function to some data. the data has to be a collection of points x@f(x). the fitting minimizes the squared error.
f:=[:x :a :b|a*x / (b+x)].
col:=(1 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].
fit:= FunctionFit function: f data: col .
fit evaluate . 
fit result parameters .   --->  #(1.9999999999999998 0.39999999999999863)
"
Class {
	#name : #PMFunctionFit,
	#superclass : #PMLeastSquareFit,
	#category : 'Math-FunctionFit'
}

{ #category : #creation }
PMFunctionFit class >> function: aBlock data: aDataHolder [ 
^super points: aDataHolder  function:  (PMSimpleParameterFunction function: aBlock)
]

{ #category : #creation }
PMFunctionFit class >> histogram: aHistogram distributionClass: aProbabilityDensityFunctionClass [ 
^self shouldNotImplement
]

{ #category : #creation }
PMFunctionFit class >> points: aDataHolder function: aBlock [ 
^self shouldNotImplement
]

{ #category : #operation }
PMFunctionFit >> accumulate: aWeightedPoint [
	| f g |
	f := result valueAndGradient: aWeightedPoint xValue.
	g := f last.
	f := f first.
	f isNaN ifTrue:[^self].
	constants accumulate: g * ( ( aWeightedPoint yValue - f) * aWeightedPoint weight).
	1 to: g size do:
		[ :k |
		  ( equations at: k) accumulate: g * ( ( g at: k) * aWeightedPoint weight).
		].
]

{ #category : #operation }
PMFunctionFit >> computeChanges [
	^[super computeChanges]on: PMSingularMatrixError  do:[:signal|signal messageText: 'singular error matrix, set better parameters'.signal pass]
]

{ #category : #information }
PMFunctionFit >> computeChiSquare [
"does not make much sense to use in most cases, but then, the superclass has it and if its here, the calculation should be correct and the superclass's way does not work here eg because of the way DataHolder>>pointsAndErrorsDo: works"
	chiSquare := 0.
	degreeOfFreedom := self numberOfFreeParameters negated.
	dataHolder pointsAndErrorsDo:
		[ :each | |y| 
		  y :=result value: each xValue .
		  (y closeTo: 0) ifFalse:
		  	[chiSquare := (each yValue - y) squared / y abs +chiSquare  .
		  	degreeOfFreedom := degreeOfFreedom + 1].
		].
]

{ #category : #initialization }
PMFunctionFit >> initialize: aDataHolder data: aParametricFunction [
	(aDataHolder isCollection and: [aDataHolder allSatisfy: [:aPoint| aPoint isPoint]])
			ifTrue:  [dataHolder:= aDataHolder as: PMDataHolder ]
			ifFalse: [self error: 'DataHolder must be a Collection of Points'].
	dataHolder size < aParametricFunction parameterSize ifTrue:[self error: 'Problem is underdeterminated. aDataHolders size to small'].
	result := aParametricFunction.
	self finalizeIterations.
	^self
]

{ #category : #information }
PMFunctionFit >> parameters [ 
^result parameters 
]

{ #category : #initialization }
PMFunctionFit >> parameters: indexableCollection [
indexableCollection do:[ :e|(e equalsTo: 0.0)ifTrue: [ self error:'parameters shouldnt be set to practically zero' ] ].
result parameters: indexableCollection.
self finalizeIterations .
]

{ #category : #printing }
PMFunctionFit >> printOn: aStream [
	super printOn: aStream.  
	aStream nextPutAll: ' for '.
	result printOn: aStream .
	aStream nextPutAll: ' with data of size: '; print: dataHolder size.
]
