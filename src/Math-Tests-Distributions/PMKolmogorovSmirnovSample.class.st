"
abstract class, use KolmogorovSmirnov1Sample or KolmogorovSmirnov2Sample
"
Class {
	#name : 'PMKolmogorovSmirnovSample',
	#superclass : 'Object',
	#instVars : [
		'data',
		'compareWith'
	],
	#category : 'Math-Tests-Distributions-KolmogorovSmirnov',
	#package : 'Math-Tests-Distributions',
	#tag : 'KolmogorovSmirnov'
}

{ #category : 'accessing' }
PMKolmogorovSmirnovSample >> data: aCollection [
^self subclassResponsibility
]

{ #category : 'accessing' }
PMKolmogorovSmirnovSample >> ksStatistic [
"the kolmogorov-smirnov statistic D"
^self subclassResponsibility
]

{ #category : 'accessing' }
PMKolmogorovSmirnovSample >> pValue [
"the probability of getting a ksStatistic <= the actual one"
^self subclassResponsibility
]

{ #category : 'printing' }
PMKolmogorovSmirnovSample >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '(dataSize: '.
	data
		ifNil: [ aStream nextPut: $- ]
		ifNotNil: [ data size printOn: aStream ]
]

{ #category : 'accessing' }
PMKolmogorovSmirnovSample >> rejectEqualityHypothesisWithAlpha: aFloat [
^self pValue > (1-aFloat)
]

{ #category : 'private' }
PMKolmogorovSmirnovSample >> testDataComplete [
(data isNil or:[compareWith isNil ]) ifTrue: [ self error:'data not completely set' ]
]
