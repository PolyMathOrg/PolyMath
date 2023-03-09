"
[[[
| histogram valueStream |
	valueStream := #(3 3 5 6 7 7 7 72  1 3  5 7 8 20) readStream.
      histogram := PMHistogram new.
      [ valueStream atEnd ]
		whileFalse: [ histogram accumulate: valueStream next ].
histogram			
]]]
"
Class {
	#name : #PMHistogram,
	#superclass : #Object,
	#instVars : [
		'minimum',
		'binWidth',
		'overflow',
		'underflow',
		'moments',
		'contents',
		'freeExtent',
		'cacheSize',
		'desiredNumberOfBins'
	],
	#category : #'Math-StatisticalMoments'
}

{ #category : #information }
PMHistogram class >> defaultCacheSize [
		"Private - Answer the default cache size."
	^100
]

{ #category : #information }
PMHistogram class >> defaultNumberOfBins [
	"Private - Defines the default number of bins for instances of the receiver. "
	^ 50
]

{ #category : #information }
PMHistogram class >> integerScales [
	"Private - Scales for strict integers"
	^#( 2 4 5 8 10)
]

{ #category : #creation }
PMHistogram class >> new [
		"Create a standard new instance of the receiver."
	^super new initialize
]

{ #category : #information }
PMHistogram class >> scales [
	"Private - Scales for any number"
	^#( 1.25 2 2.5 4 5 7.5 8 10)
]

{ #category : #information }
PMHistogram class >> semiIntegerScales [
	"Private - Scales for large integers"
	^#( 2 2.5 4 5 7.5 8 10)
]

{ #category : #transformation }
PMHistogram >> accumulate: aNumber [
	"Accumulate aNumber into the receiver. "

	| bin |
	self isCached
		ifTrue: [ ^ self accumulateInCache: aNumber ].
	bin := self binIndex: aNumber.
	(bin between: 1 and: contents size)
		ifTrue: [ 
			contents at: bin put: (contents at: bin) + 1.
			moments accumulate: aNumber ]
		ifFalse: [ self processOverflows: bin for: aNumber ]
]

{ #category : #private }
PMHistogram >> accumulateInCache: aNumber [
	"Private - Accumulate aNumber inside a cache "

	contents add: aNumber.
	contents size > cacheSize
		ifTrue: [ self flushCache ]
]

{ #category : #private }
PMHistogram >> adjustDimensionUpTo: aNumber [
	"Private - Compute an adequate bin width and adjust the minimum and number of bins accordingly.
	aNumber is the maximum value to accumulate. The minimum value has already been assigned. "

	| maximum |
	binWidth := self roundToScale: (aNumber - minimum) / desiredNumberOfBins.
	minimum := (minimum / binWidth) floor * binWidth.
	maximum := (aNumber / binWidth) asFloat successor ceiling * binWidth.	
	contents := Array new: ((maximum - minimum) / binWidth) ceiling.
	contents atAllPut: 0
]

{ #category : #information }
PMHistogram >> average [
	"Answer the average of the recevier
		"
	^ self moments average
]

{ #category : #information }
PMHistogram >> binIndex: aNumber [
	"Answers the index of the bin corresponding to aNumber."
	
	^ ((aNumber - minimum) / binWidth) floor + 1
]

{ #category : #information }
PMHistogram >> binWidth [
	"Answer the bin width for the receiver."

	self isCached
		ifTrue: [ self flushCache ].
	^ binWidth
]

{ #category : #information }
PMHistogram >> chi2Against: aScaledDistribution [

	| chi2 |
	chi2 := 0.
	self pointsAndErrorsDo: [ :each | chi2 := (each chi2Contribution: aScaledDistribution) + chi2 ].
	^ chi2
]

{ #category : #information }
PMHistogram >> chi2ConfidenceLevelAgainst: aScaledDistribution [

	^ (PMChiSquareDistribution degreeOfFreedom: contents size - aScaledDistribution parameters size)
		confidenceLevel: (self chi2Against: aScaledDistribution)
]

{ #category : #information }
PMHistogram >> collectIntegralPoints: aBlock [
	"Collects the points needed to display the receiver as an integral. 
	Needed to use polymorphic behavior when plotting the receiver."

	| answer bin integral norm x |
	self isCached
		ifTrue: [ self flushCache ].
	answer := OrderedCollection new: contents size * 2 + 1.
	bin := self minimum.
	answer add: (aBlock value: bin @ 0).
	integral := self underflow.
	norm := self totalCount.
	contents
		do: [ :each | 
			integral := integral + each.
			x := integral / norm.
			answer add: (aBlock value: bin @ x).
			bin := bin + binWidth.
			answer add: (aBlock value: bin @ x) ].
	answer add: (aBlock value: bin @ 0).
	^ answer asArray
]

{ #category : #information }
PMHistogram >> collectPoints: aBlock [
	"Collects the points needed to display the receiver.
	Needed to use polymorphic behavior when plotting the receiver."

	| answer bin |
	self isCached
		ifTrue: [ self flushCache ].
	answer := OrderedCollection new: contents size * 2 + 1.
	bin := self minimum.
	answer add: (aBlock value: bin @ 0).
	contents
		do: [ :each | 
			answer add: (aBlock value: bin @ each).
			bin := bin + binWidth.
			answer add: (aBlock value: bin @ each) ].
	answer add: (aBlock value: bin @ 0).
	^ answer asArray
]

{ #category : #information }
PMHistogram >> count [
	"Answer the count of the recevier"

	^ self moments count
]

{ #category : #information }
PMHistogram >> countAt: aNumber [
		"Answer the count in the bin corresponding to aNumber or 0 if outside the limits."
	| n |
	self isCached 				
		ifTrue: [ self flushCache].
	n := self binIndex: aNumber.
	^( n between: 1 and: contents size)
			ifTrue: [ contents at: n]
			ifFalse:[ 0]
]

{ #category : #transformation }
PMHistogram >> countOverflows: anInteger [

	anInteger > 0
		ifTrue: [ overflow := overflow + 1 ]
		ifFalse: [ underflow := underflow + 1 ]
]

{ #category : #information }
PMHistogram >> countsBetween: aNumber1 and: aNumber2 [
	"Computes the events located between aNumber1 and aNumber2.
	NOTE: This method assumes the two numbers are within the limits of the receiver."

	"there was a little bug that just seems to be one of the authors typical slips of the pen"

	| n1 n2 answer |
	self isCached
		ifTrue: [ self flushCache ].
	n1 := self binIndex: aNumber1.
	n2 := self binIndex: aNumber2.
	answer := (contents at: n1) * (binWidth * (n1 - 1) + minimum - aNumber1) / binWidth.
	n2 > contents size
		ifTrue: [ n2 := contents size + 1 ]
		ifFalse: [ answer := answer + ((contents at: n2) * (aNumber2 - (binWidth * (n2 - 1) + self minimum)) / binWidth) ].
	n1 to: n2 - 1 do: [ :n | answer := answer + (contents at: n) ].
	^ answer
]

{ #category : #information }
PMHistogram >> countsUpTo: aNumber [
	"Computes the events located up to aNumber.
	NOTE: This method assumes aNumber is within the limits of the receiver."

	| n answer |
	self isCached
		ifTrue: [ self flushCache ].
	n := self binIndex: aNumber.
	n > contents size
		ifTrue: [ ^ self count ].
	answer := (contents at: n) * (aNumber - (binWidth * (n - 1) + minimum)) / binWidth.
	1 to: n - 1 do: [ :m | answer := answer + (contents at: m) ].
	^ answer + underflow
]

{ #category : #information }
PMHistogram >> errorOnAverage [
	"Answer the error on the average of the receiver."

	^ self moments errorOnAverage
]

{ #category : #testing }
PMHistogram >> fConfidenceLevel: aStatisticalMomentsOrHistogram [

	^ self moments fConfidenceLevel: aStatisticalMomentsOrHistogram
]

{ #category : #private }
PMHistogram >> flushCache [
	"Private"

	| maximum values |
	minimum ifNil: [ minimum := contents ifEmpty: [ 0 ] ifNotEmpty: [ contents first ] ].
	maximum := minimum.
	contents do: [ :each |
		each < minimum
			ifTrue: [ minimum := each ]
			ifFalse: [ each > maximum ifTrue: [ maximum := each ] ] ].
	maximum = minimum ifTrue: [ maximum := minimum + desiredNumberOfBins ].
	values := contents.
	self adjustDimensionUpTo: maximum.
	values do: [ :each | self accumulate: each ]
]

{ #category : #initialization }
PMHistogram >> freeExtent: aBoolean [
	"Defines the range of the receiver to be freely adjustable."

	(underflow = 0 and: [ overflow = 0 ])
		ifFalse: [ self error: 'Histogram extent cannot be redefined' ].
	freeExtent := aBoolean
]

{ #category : #private }
PMHistogram >> growContents: anInteger [
	"Private "
	anInteger > 0
		ifTrue: [ self growPositiveContents: anInteger ]
		ifFalse: [ self growNegativeContents: anInteger ]
]

{ #category : #private }
PMHistogram >> growNegativeContents: anInteger [
	"Private"

	| n newSize newContents |
	n := 1 - anInteger.
	newSize := contents size + n.
	newContents := Array new: newSize.
	newContents at: 1 put: 1.
	2 to: n do: [ :i | newContents at: i put: 0 ].
	newContents
		replaceFrom: n + 1
		to: newSize
		with: contents
		startingAt: 1.
	contents := newContents.
	minimum := (anInteger - 1) * binWidth + minimum
]

{ #category : #private }
PMHistogram >> growPositiveContents: anInteger [
	"Private"

	| n newContents |
	n := contents size.
	newContents := Array new: anInteger.
	newContents
		replaceFrom: 1
		to: n
		with: contents
		startingAt: 1.
	n + 1 to: anInteger - 1 do: [ :i | newContents at: i put: 0 ].
	newContents at: anInteger put: 1.
	contents := newContents
]

{ #category : #initialization }
PMHistogram >> initialize [
	"Private - initializes the receiver with standard settings."

	freeExtent := false.
	cacheSize := self class defaultCacheSize.
	desiredNumberOfBins := self class defaultNumberOfBins.
	contents := OrderedCollection new: cacheSize.
	moments := PMFixedStatisticalMoments new.
	overflow := 0.
	underflow := 0.
	^ self
]

{ #category : #information }
PMHistogram >> inverseDistributionValue: aNumber [
	"Private - Compute the value which corresponds to a integrated count of aNumber. NOTE: aNumber is assumed to be between 0 and 1."

	| count x integral |
	count := self count * aNumber.
	x := minimum.
	integral := 0.
	contents
		do: [ :each | 
			| delta |
			delta := count - integral.
			each > delta
				ifTrue: [ ^ binWidth * delta / each + x ].
			integral := integral + each.
			x := binWidth + x ].
	^ self maximum
]

{ #category : #testing }
PMHistogram >> isCached [
	"Private - Answer true if the content of the receiver is cached."

	^ binWidth isNil
]

{ #category : #testing }
PMHistogram >> isEmpty [
	"Always false. 
	 Needed to use polymorphic behavior when plotting the receiver. "

	^ false
]

{ #category : #information }
PMHistogram >> kurtosis [
		"Answer the kurtosis of the receiver."
	^self moments kurtosis
]

{ #category : #information }
PMHistogram >> lowBinLimitAt: anInteger [

	self isCached 				
		ifTrue: [ self flushCache].
	^( anInteger - 1) * binWidth + minimum
]

{ #category : #information }
PMHistogram >> maximum [
		"Answer the minimum for the receiver."
	self isCached
		ifTrue: [ self flushCache].
	^contents size * binWidth + minimum
]

{ #category : #information }
PMHistogram >> maximumCount [
	"Answer the maximum count of the receiver."

	self isCached ifTrue: [ self flushCache ].
	^ contents inject: (contents ifEmpty: [ 1 ] ifNotEmpty: [ contents at: 1 ]) into: [ :max :each | max max: each ]
]

{ #category : #information }
PMHistogram >> minimum [
		"Answer the minimum for the receiver."
	self isCached
		ifTrue: [ self flushCache].
	^minimum
]

{ #category : #information }
PMHistogram >> moments [
self isCached
	ifTrue: [ self flushCache].
^moments
]

{ #category : #information }
PMHistogram >> overflow [
		"Answer the overflow of the receiver"
	^overflow
]

{ #category : #iterators }
PMHistogram >> pointsAndErrorsDo: aBlock [

	| x |
	x := self minimum - (binWidth / 2).
	contents
		do: [ :each | 
			x := x + binWidth.
			aBlock value: (PMWeightedPoint point: x count: each) ]
]

{ #category : #private }
PMHistogram >> processOverflows: anInteger for: aNumber [
	"Private"

	freeExtent
		ifTrue: [ 
			self growContents: anInteger.
			moments accumulate: aNumber ]
		ifFalse: [ self countOverflows: anInteger ]
]

{ #category : #information }
PMHistogram >> roundToScale: aNumber [
	"Private - Adjust aNumber of the lowest upper scale"
	| orderOfMagnitude norm scales rValue |
	orderOfMagnitude := ( aNumber log: 10) floor.
	scales := self class scales.
	aNumber isInteger
		ifTrue: [ orderOfMagnitude < 1
						ifTrue: [ orderOfMagnitude := 1].
					  orderOfMagnitude = 1
						ifTrue: [ scales := self class integerScales].
					  orderOfMagnitude = 2
						ifTrue: [ scales := self class semiIntegerScales].
				    ].
	norm := 10 raisedToInteger: orderOfMagnitude.
	rValue := aNumber / norm.
	^( scales detect: [ :each | rValue <= each]) * norm
]

{ #category : #initialization }
PMHistogram >> setDesiredNumberOfBins: anInteger [
	"Defines the desired number of bins. It may be adjusted to a few units later on. "

	anInteger > 0
		ifFalse: [ self error: 'Desired number of bins must be positive' ].
	desiredNumberOfBins := anInteger
]

{ #category : #initialization }
PMHistogram >> setRangeFrom: aNumber1 to: aNumber2 bins: anInteger [
	"Defines the range of the receiver by specifying the minimum, maximum and number of bins. Values are adjusted to correspond to a reasonable value for the bin width and the limits."

	self isCached
		ifFalse: [ self error: 'Histogram limits cannot be redefined' ].
	minimum := aNumber1.
	self
		setDesiredNumberOfBins: anInteger;
		adjustDimensionUpTo: aNumber2
]

{ #category : #initialization }
PMHistogram >> setWidth: aNumber1 from: aNumber2 bins: anInteger [
		"Defines the range of the receiver by specifying the minimum, bin width and number of bins.
		 Values are adjusted to correspond to a reasonable value for the bin width and the limits."
	self isCached
		ifFalse: [ self error: 'Histogram limits cannot be redefined'].
	minimum := aNumber2.
	self setDesiredNumberOfBins: anInteger;
		   adjustDimensionUpTo: ( aNumber1 * anInteger + aNumber2).
]

{ #category : #information }
PMHistogram >> skewness [
	"Answer the skewness of the receiver"

	^ self moments skewness
]

{ #category : #information }
PMHistogram >> standardDeviation [
	"Answer the standardDeviation of the recevier"

	^ self moments standardDeviation
]

{ #category : #testing }
PMHistogram >> tConfidenceLevel: aStatisticalMomentsOrHistogram [

	^ self moments tConfidenceLevel: aStatisticalMomentsOrHistogram
]

{ #category : #information }
PMHistogram >> totalCount [
	"Answer the count of the recevier, inclusing underflow and overflow"

	^ self moments count + underflow + overflow
]

{ #category : #information }
PMHistogram >> underflow [
	"Answer the underflow of the receiver"

	^ underflow
]

{ #category : #information }
PMHistogram >> unnormalizedVariance [

	^ self moments unnormalizedVariance
]

{ #category : #information }
PMHistogram >> variance [
	"Answer the variance of the recevier "

	^ self moments variance
]
