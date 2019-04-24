"
This test checks that the SVD transform based PCA meets the acceptance requirements defined in PMPrincipalComponentAnalysisTest
"
Class {
	#name : #PMPCASingularValueDecompositionTest,
	#superclass : #PMPrincipalComponentAnalyserTest,
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #running }
PMPCASingularValueDecompositionTest >> setUp [
	pca := PMPrincipalComponentAnalyserSVD new componentsNumber: 2
]

{ #category : #'scikit-learn-example' }
PMPCASingularValueDecompositionTest >> testPCAwithPCAandJacobiTransformationReturnSame [
	| m pca1 pca2 |
	m := PMMatrix rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	pca1 := PMPrincipalComponentAnalyserSVD new componentsNumber: 2.
	pca1 fit: m.
	pca2 := PMPrincipalComponentAnalyserJacobiTransformation new componentsNumber: 2.
	pca2 fit: m.
	
	self assert: pca1 transformMatrix abs closeTo: pca2 transformMatrix abs
]
