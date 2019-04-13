Class {
	#name : #PMPrincipalComponentAnalyserTest,
	#superclass : #TestCase,
	#instVars : [
		'average',
		'covarianceMatrix',
		'accumulator',
		'server'
	],
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testPCAwithPCAandJacobiTransformationReturnSame [
	| m pca1 pca2 |
	m := PMMatrix rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	pca1 := PMPrincipalComponentAnalyserSVD new componentsNumber: 2.
	pca1 fit: m.
	pca2 := PMPrincipalComponentAnalyserJacobiTransformation new componentsNumber: 2.
	pca2 fit: m.
	
	self assert: pca1 transformMatrix abs closeTo: pca2 transformMatrix abs
]

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testTransformMatrixWithJacobiTransformation [
	| m pca expected |
	m := PMMatrix
		rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	pca := PMPrincipalComponentAnalyserJacobiTransformation new
		componentsNumber: 2.
	
	pca fit: m.
	
	expected := (PMMatrix
		rows: #(#(-0.83849224 -0.54491354) #(0.54491354 -0.83849224))) abs.
	self assert: pca transformMatrix abs closeTo: expected
]

{ #category : #tests }
PMPrincipalComponentAnalyserTest >> testTransformMatrixWithSVD [
	| m pca expected |
	m := PMMatrix
		rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	pca := PMPrincipalComponentAnalyserSVD new componentsNumber: 2.
	
	pca fit: m.
	
	expected := (PMMatrix
		rows: #(#(-0.83849224 -0.54491354) #(0.54491354 -0.83849224))) abs.
	self assert: pca transformMatrix abs closeTo: expected
]
