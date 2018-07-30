"
PMDataTransformer is the abstract root class of transformers. All data transformers should implemen a fit and a method method.

"
Class {
	#name : #PMDataTransformer,
	#superclass : #Object,
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'as yet unclassified' }
PMDataTransformer >> fit: aCollection [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PMDataTransformer >> fitAndTransform: aCollection [
	^ (self fit: aCollection) transform: aCollection
]

{ #category : #transforming }
PMDataTransformer >> transform: aCollection [
	^ self subclassResponsibility
]
