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
