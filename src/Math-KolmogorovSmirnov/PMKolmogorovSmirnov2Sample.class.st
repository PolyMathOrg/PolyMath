"
does a two-sided Kolmogorov-Smirnow test and checks whether two sample data are from the same population, which is assumed to be a continous distribution (iow  ties occur with probability zero ). 
#ksStatistic returns kolmogorovs D.
#pValue returns the probability of getting a D < ksStatistic .
#rejectEqualityHypothesisWithAlpha: does what its name says of course.
example:
nd:= DhbNormalDistribution new.
ks :=KolmogorovSmirnov2Sample  
	compareData: ((1 to:100) collect:[:i|nd random]) 
	withData: ((1 to:100) collect:[:i|nd random]). ""-->
a KolmogorovSmirnov2Sample(dataSize: 100 otherDataSize: 100)""
k ksStatistic . ""-->(9/100)""
k pValue asFloat .""-->0.18458528753386905""
ks rejectEqualityHypothesisWithAlpha: 0.05. ""-->false""

the pValue is directly (no SmirnovDistribution implemented at the moment) and exactly calculated as explained in:
Kim, P. J. & Jennrich, R. I. 
'Tables of the exact sampling distribution of the two-sample Kolmogorov–Smirnov criterion...'
in 'Selected Tables in Mathematical Statistics Volume I' (1973).

no aproximation is at the moment used for bigger datasizes, hence calcs will be too slow in that case.
"
Class {
	#name : #PMKolmogorovSmirnov2Sample,
	#superclass : #PMKolmogorovSmirnovSample,
	#instVars : [
		'uCalcBlock',
		'smallSize',
		'bigSize',
		'ksStatistic'
	],
	#category : #'Math-KolmogorovSmirnov'
}

{ #category : #'instance creation' }
PMKolmogorovSmirnov2Sample class >> compareData: aCollection withData: anotherCollection [
^self new data: aCollection ;otherData: anotherCollection ;yourself 
]

{ #category : #private }
PMKolmogorovSmirnov2Sample >> cFrom: i and: j [
	"needs ksStatistic!"

	^ (i / smallSize - (j / bigSize)) abs < ksStatistic
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
PMKolmogorovSmirnov2Sample >> data: aCollection [
	ksStatistic := nil.
	^ self makeCDFOf: aCollection intoFirst: true
]

{ #category : #initialization }
PMKolmogorovSmirnov2Sample >> initCachedUCalculation [
	"recursive calc, slow without memoization"

	uCalcBlock := [ :iandj | 
	| cij i j |
	i := iandj first.
	j := iandj second.
	cij := self cFrom: i and: j.
	i * j = 0
		ifTrue: [ cij ]
		ifFalse: [ cij * (
			(uCalcBlock value: (Array with: i with: j - 1))
			+
			(uCalcBlock value: (Array with: i - 1 with: j))
		) ] ] memoized
]

{ #category : #initialization }
PMKolmogorovSmirnov2Sample >> initKSStatistic [
	| t |
	ksStatistic := 0.
	self initCachedUCalculation.	"needs to be set lately, iow here"
	smallSize := data size.
	bigSize := compareWith size.
	smallSize > bigSize
		ifFalse: [ ^ self ].
	t := smallSize.
	smallSize := bigSize.
	bigSize := t
]

{ #category : #accessing }
PMKolmogorovSmirnov2Sample >> ksStatistic [
	"the kolmogorov-smirnov statistic D"

	| c1 c2 cdfs s |
	self testDataComplete.
	self initKSStatistic.
	c1 := 0.
	c2 := 0.
	s := smallSize + bigSize.
	cdfs := (SortedCollection new: s)
		addAll: data;
		addAll: compareWith;
		yourself.
	cdfs
		withIndexDo: [ :a :i | 
			(i < s and: [ (cdfs at: i + 1) key = a key ])
				ifTrue: [ a value second
						ifTrue: [ c2 := (cdfs at: i + 1) value first ]
						ifFalse: [ c1 := (cdfs at: i + 1) value first ] ].
			ksStatistic := ksStatistic
				max:
					(a value second
						ifTrue: [ c1 := a value first.
							c1 - c2 ]
						ifFalse: [ c2 := a value first.
							c2 - c1 ]) ].
	^ ksStatistic
]

{ #category : #private }
PMKolmogorovSmirnov2Sample >> makeCDFOf: aCollection intoFirst: aBoolean [
	"if aCollection consists of numbers, 
it returns a sorted array of (number-> (Array with: cdf with: aBoolean))"

	| cd s result |
	cd := 0.
	s := aCollection size.
	result := aCollection asBag sortedElements
		do: [ :a | 
			cd := a value / s + cd.
			a value: (Array with: cd with: aBoolean) ].
	^ aBoolean
		ifTrue: [ data := result ]
		ifFalse: [ compareWith := result ]
]

{ #category : #accessing }
PMKolmogorovSmirnov2Sample >> otherData: aCollection [
	ksStatistic := nil.
	^ self makeCDFOf: aCollection intoFirst: false
]

{ #category : #accessing }
PMKolmogorovSmirnov2Sample >> pValue [
	"uses procedure explained in:
Kim, P. J. & Jennrich, R. I. 
'Tables of the exact sampling distribution of the two-sample Kolmogorov–Smirnov criterion...'
in 'Selected Tables in Mathematical Statistics Volume I' (1973)."

	ksStatistic ifNil: [ self ksStatistic ].
	^ (uCalcBlock value: (Array with: smallSize with: bigSize))
		/ (smallSize + bigSize take: smallSize)
]

{ #category : #printing }
PMKolmogorovSmirnov2Sample >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' otherDataSize: '.
	compareWith
		ifNil: [ aStream nextPut: $- ]
		ifNotNil: [ compareWith size printOn: aStream ].
	aStream nextPut: $)
]
