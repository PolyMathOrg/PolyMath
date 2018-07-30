"
PMDataTransformer is the abstract root class of transformers. All data transformers should implemen a fit and a method method.

"
Class {
	#name : #PMDataTransformer,
	#superclass : #Object,
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'as yet unclassified' }
PMDataTransformer >> fit: aPMMatrix [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PMDataTransformer >> fitAndTransform: aPMMatrix [
	^ (self fit: aPMMatrix) transform: aPMMatrix
]

{ #category : #transforming }
PMDataTransformer >> transform: aPMMatrix [
	^ self subclassResponsibility
]
