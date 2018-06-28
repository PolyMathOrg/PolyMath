Class {
	#name : #PMPrincipalComponentAnalyserTest,
	#superclass : #TestCase,
	#instVars : [
		'average',
		'covarianceMatrix',
		'accumulator',
		'server'
	],
	#category : 'Math-PrincipalComponentAnalysis'
}

{ #category : #initialization }
PMPrincipalComponentAnalyserTest >> setUp [
	accumulator := PMCovarianceAccumulator new: 5.
	server := PMPrincipalComponentAnalysisServer new.
	100 timesRepeat: [ accumulator accumulate: server next ].
	average := accumulator average.
	covarianceMatrix := accumulator covarianceMatrix
]

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testCanCreateCovarianceMatrix [

	self assert: average asArray equals:{ (101/2) . (-101/2) . (303/2) .  -101 . -6767}.
	self assert: covarianceMatrix rows size equals: 5.
	self assert: covarianceMatrix isSymmetric
]

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testEigenvalues [
	| actual expected analyser |
	analyser := PMPrincipalComponentAnalyser new: 5.
	100 timesRepeat: [ analyser accumulate: server next ].
	actual := analyser components.
	expected := #(3.623277676214216e7 766.1878578405343 -8.608930577556605e-13 2.1213150252733508e-13 -1.9556315119125588e-13) asPMVector.
	(actual - expected) allButFirst allButFirst do: [ :each | self assert: each < 10e-8 ]
]

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testLowEigenvalues [
	"this is a test without using the class API."

	| jacobi actual expected |
	jacobi := PMJacobiTransformation matrix: covarianceMatrix.
	actual := jacobi evaluate.
	expected := #(3.623277676214216e7 766.1878578405343 -8.608930577556605e-13 2.1213150252733508e-13 -1.9556315119125588e-13) asPMVector.
	actual - expected do: [ :each | self assert: each < 10e-8 ]
]
