"
This test checks that the Jacobi transform based PCA meets the acceptance requirements defined in PMPrincipalComponentAnalysisTest
"
Class {
	#name : #PMPCAJacobiTransformationTest,
	#superclass : #PMPrincipalComponentAnalyserTest,
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #running }
PMPCAJacobiTransformationTest >> setUp [
	pca := PMPrincipalComponentAnalyserJacobiTransformation new
		componentsNumber: 2
]
