"
abstract class, use KolmogorovSmirnov1Sample or KolmogorovSmirnov2Sample
"
Class {
	#name : #PMKolmogorovSmirnov,
	#superclass : #Object,
	#instVars : [
		'data',
		'compareWith'
	],
	#category : 'Math-KolmogorovSmirnov'
}

{ #category : #accessing }
PMKolmogorovSmirnov >> data: aCollection [
^self subclassResponsibility 
]

{ #category : #accessing }
PMKolmogorovSmirnov >> ksStatistic [
"the kolmogorov-smirnov statistic D"
^self subclassResponsibility 
]

{ #category : #accessing }
PMKolmogorovSmirnov >> pValue [
"the probability of getting a ksStatistic <= the actual one"
^self subclassResponsibility 
]

{ #category : #printing }
PMKolmogorovSmirnov >> print1On: aStream [ 
	super printOn: aStream .
	aStream nextPutAll: '(dataSize: '.
	data ifNil:[aStream nextPut: $-]ifNotNil:[data size printOn: aStream].

]

{ #category : #printing }
PMKolmogorovSmirnov >> print2On: aStream [ 
^self subclassResponsibility 
]

{ #category : #printing }
PMKolmogorovSmirnov >> printOn: aStream [ 
	self print1On: aStream .
	self print2On: aStream .

]

{ #category : #accessing }
PMKolmogorovSmirnov >> rejectEqualityHypothesisWithAlpha: aFloat [
^self pValue > (1-aFloat) 

]

{ #category : #private }
PMKolmogorovSmirnov >> testDataComplete [
(data isNil or:[compareWith isNil ]) ifTrue: [ self error:'data not completely set' ].

]
