"
This is the test class that exercises scikit-learn Eigenvector Flip Algorithm

"
Class {
	#name : #SciKitLearnEigenvectorFlipAlgorithmTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testFlipEigenvectorsSign [
	"The purpose is to compare the output from fligEigenVectorsSign in
	PolyMath with scikit-learn
	"

	| m u v flipAlgorithm svd expected signs |
	m := PMMatrix rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	svd := PMSingularValueDecomposition new initialize: m.
	u := svd leftSingularForm.
	v := svd rightSingularForm.
	flipAlgorithm := SciKitLearnEigenvectorFlipAlgorithm u: u v: v.
	
	signs := flipAlgorithm computeSigns .
	
	expected := #(-1 -1 -1 1 1 -1) asPMVector.
	self assert: signs equals: expected
]
