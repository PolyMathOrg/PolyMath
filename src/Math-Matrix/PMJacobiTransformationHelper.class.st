"
I store eigenvalues and eigenvectors of a symmetric matrix computed with PMJacobiTransformation
"
Class {
	#name : #PMJacobiTransformationHelper,
	#superclass : #Object,
	#instVars : [
		'eigenvalues',
		'eigenvectors'
	],
	#category : #'Math-Matrix'
}

{ #category : #creation }
PMJacobiTransformationHelper class >> matrix: aSymmetricMatrix [
	^ super new initialize: aSymmetricMatrix
]

{ #category : #creation }
PMJacobiTransformationHelper class >> new [
	"Prevent using this message to create instances."

	^ self error: 'Illegal creation message for this class'
]

{ #category : #initialization }
PMJacobiTransformationHelper >> initialize: aSymmetricMatrix [

	| jacobi |
	jacobi := PMJacobiTransformation matrix: aSymmetricMatrix.
	eigenvalues := jacobi evaluate.
	eigenvectors := jacobi transform columnsCollect: [ :each | each].
]

{ #category : #accessing }
PMJacobiTransformationHelper >> values [

	^ eigenvalues
]

{ #category : #accessing }
PMJacobiTransformationHelper >> vectors [

	^ eigenvectors
]
