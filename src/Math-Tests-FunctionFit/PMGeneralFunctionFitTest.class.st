Class {
	#name : #PMGeneralFunctionFitTest,
	#superclass : #TestCase,
	#instVars : [
		'f',
		'col',
		'fit'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMGeneralFunctionFitTest >> setUp [
	"Reset the seed of the random numbers (to get consistent results)"

	super setUp.

	PMMitchellMooreGenerator reset: 0.
	f := [ :x :a :b | (a * x) sin / (b + x squared) ].
	col := (-4 to: 4 by: 0.1) collect: [ :i | i @ (f cull: i cull: 0.1 cull: 0.4) ].
	fit := PMGeneralFunctionFit
		       function: f
		       data: col
		       minimumValues: 0
		       maximumValues: 5.

	fit manager randomGenerator: (Random seed: 42)
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testBasic [

	| d |
	self assert: fit evaluate closeTo: #( 0.1 0.4 ).
	(fit result - #( 0.1 0.4 )) abs with: (fit secondaryResult - #( 0.1 0.4 )) abs do: [ :e :s | self assert: s - e > 0 ].
	d := fit error: fit secondaryResult.
	self assert: d < 1e-5.
	self assert: fit error < d
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testFunction [

	| y |
	y := fit function value: 3 value: 0.1 value: 0.4.
	fit evaluate.
	self assert: (fit function value: 3) closeTo: y
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testManager [

	self assert: fit manager class equals: PMAnotherChromosomeManager.
	self assert: fit manager range equals: #( 5 5 )
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testMaximumIterationsProbabilistic [

	| r correct |
	correct := 0.
	fit populationSize: 20.
	7 timesRepeat: [
		fit resetBestPoints.
		fit maximumIterations: 200.
		r := (fit evaluate - #( 0.1 0.4 )) abs.
		fit resetBestPoints.
		fit maximumIterations: 2.
		r := (fit evaluate - #( 0.1 0.4 )) abs - r.
		correct := ((r at: 1) > 0 or: [ (r at: 2) > 0 ])
			           ifTrue: [ correct + 1 ]
			           ifFalse: [ correct - 1 ] ].
	self assert: correct > 0
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testPopulationSize [

	self assert: fit manager populationSize equals: 50.
	fit populationSize: 100.
	self assert: fit manager populationSize equals: 100
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testPrecision [

	self assert: fit precision isNil.
	fit evaluate.
	self assert: fit precision < 1e-6
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testPrint [

	| aStream s |
	aStream := ReadWriteStream with: ''.
	fit printOn: aStream.
	s := aStream contents.
	self assert: (s includesSubstring: '(a * x) sin / (b + x squared)').
	self assert: (s includesSubstring: '#squared').
	self assert: (s includesSubstring: '81').
	self deny: (s includesSubstring: '#(0.').
	fit evaluate.
	aStream := ReadWriteStream with: ''.
	fit printOn: aStream.
	s := aStream contents.
	self assert: (s includesSubstring: '#(0.')
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testRelativeError [

	| r |
	f := [ :x :a | a ].
	col := Array with: 1 @ 2 with: 2 @ 6.
	fit := PMGeneralFunctionFit
		       function: f
		       data: col
		       minimumValues: -6
		       maximumValues: 6.

	fit manager randomGenerator: (Random seed: 42).
	fit populationSize: 10.
	r := fit evaluate first.
	self assert: r closeTo: 4.
	fit errorType: #abs.
	fit relativeError: true.
	r := fit evaluate first.
	self assert: (r - (2 * 6) sqrt) abs < 1e-5.
	fit errorType: #squared.
	r := fit evaluate first.
	self assert: r > (2 * 6) sqrt.
	self assert: r < 4
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testResetBestPoints [

	fit evaluate.
	fit resetBestPoints.
	self assertEmpty: fit optimizer bestPoints
]

{ #category : #tests }
PMGeneralFunctionFitTest >> testTruncate [

	col at: 1 put: -4 @ -0.2.
	col at: 81 put: 4.000000000000004 @ 0.2.
	col at: 10 put: -3.099999999999999 @ 2.
	fit := PMGeneralFunctionFit
		       function: f
		       data: col
		       minimumValues: 0
		       maximumValues: 5.

	fit manager randomGenerator: (Random seed: 42).
	fit errorType: #quartile.
	self assert: fit findQuartile closeTo: #( 0.1 0.4 ).
	self assert: fit quartile < (79 / 81).
	self assert: fit quartile > (75 / 81).
	self deny: fit dataTruncated.
	fit truncateData.
	self assert: fit dataTruncated.
	self assert: fit optimizer functionBlock data size equals: fit quartile * col size.
	fit errorType: #abs.
	self assert: fit errorType equals: #abs.
	self assert: fit evaluate closeTo: #( 0.1 0.4 ).
	fit resetData.
	self assert: fit optimizer functionBlock data size equals: col size
]
