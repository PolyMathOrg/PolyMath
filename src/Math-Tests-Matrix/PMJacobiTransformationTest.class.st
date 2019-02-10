Class {
	#name : #PMJacobiTransformationTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #tests }
PMJacobiTransformationTest >> testEigenvalueOfIdentityMatrixIsOne [
	"The eigenvalue of I is 1"

	| jacobiTransformation identityMatrix expected |
	identityMatrix := PMMatrix rows: #(#(1 0) #(0 1)).
	
	jacobiTransformation := PMJacobiTransformation matrix: identityMatrix.
	
	expected := #(1 1).
	self assert: jacobiTransformation evaluate equals: expected
]

{ #category : #tests }
PMJacobiTransformationTest >> testEigenvectorsOfIdentityMatrixAreTheUnitVectors [
	"The eigenvectors of I are (1 0) and (0 1), the unit basis vectors"

	| identityMatrix jacobiTransform matrixOfEigenvectors expected |
	identityMatrix := PMMatrix rows: #(#(1 0) #(0 1)).
	jacobiTransform := PMJacobiTransformation matrix: identityMatrix.
	
	matrixOfEigenvectors := jacobiTransform transform.
	
	expected := PMSymmetricMatrix identity: 2.
	self assert: matrixOfEigenvectors equals: expected.
]
