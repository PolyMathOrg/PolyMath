Class {
	#name : 'PMPrincipalComponentAnalyser',
	#superclass : 'Object',
	#instVars : [
		'componentsNumber'
	],
	#category : 'Math-PrincipalComponentAnalysis',
	#package : 'Math-PrincipalComponentAnalysis'
}

{ #category : 'accessing' }
PMPrincipalComponentAnalyser >> componentsNumber [
	^ componentsNumber
]

{ #category : 'accessing' }
PMPrincipalComponentAnalyser >> componentsNumber: anInteger [
	componentsNumber := anInteger
]

{ #category : 'accessing' }
PMPrincipalComponentAnalyser >> fit: aPMMatrix [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
PMPrincipalComponentAnalyser >> fitAndTransform: aPMMatrix [
	^ (self fit: aPMMatrix) transform: aPMMatrix
]

{ #category : 'accessing' }
PMPrincipalComponentAnalyser >> transform: aPMMatrix [
	^ self subclassResponsibility
]
