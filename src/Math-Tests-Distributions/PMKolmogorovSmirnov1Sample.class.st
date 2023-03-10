"
does a two-sided Kolmogorov-Smirnow test and checks whether sample data are from a population with a given distribution. you have to set the data that can be any collection of numbers and the cumulative distribution function. you can do the last one in two ways, either  by specifying a block via #cdf: or by specifying a distribution with concrete parameters via #populationDistribution: .
#ksStatistic returns kolmogorovs D, calculated as the maximum of D+ and D- , iow it does not (!) use D = max( | F(y(i)) - i/n| ) . (see eg http://www.itl.nist.gov/div898/handbook/eda/section3/eda35g.htm  why this would be wrong.)
#pValue returns the probability of getting a D <= ksStatistic .
#rejectEqualityHypothesisWithAlpha: does what its name says of course.
example:
nd:= DhbNormalDistribution new.""--> Normal distribution( 0, 1)""
ks :=KolmogorovSmirnov  compareData: ((1 to:100) collect:[:i|nd random]) withDistribution: nd.""--> 
a KolmogorovSmirnov(dataSize: 100 cdf: distributionValue of Normal distribution( 0, 1))""
ks rejectEqualityHypothesisWithAlpha: 0.05.""--> false""



"
Class {
	#name : #PMKolmogorovSmirnov1Sample,
	#superclass : #PMKolmogorovSmirnovSample,
	#instVars : [
		'distribution',
		'popDistribution'
	],
	#category : #'Math-Tests-Distributions-KolmogorovSmirnov'
}

{ #category : #'instance creation' }
PMKolmogorovSmirnov1Sample class >> compareData: aCollection withDistribution: aDistribution [
^self new data: aCollection ;populationDistribution: aDistribution ;yourself
]

{ #category : #'instance creation' }
PMKolmogorovSmirnov1Sample class >> data: aCollection [
^self new data: aCollection ;yourself
]

{ #category : #accessing }
PMKolmogorovSmirnov1Sample >> data: aCollection [
	distribution := PMKolmogorovsDistribution
		exampleSize: aCollection size.
	^ data := aCollection asSortedCollection
]

{ #category : #accessing }
PMKolmogorovSmirnov1Sample >> ksStatistic [
	"the kolmogorov-smirnov statistic D"

	| s d |
	s := data size.
	d := (1 to: s)
		collect: [ :i |
			| f |
			f := compareWith value: (data at: i).
			f - ((i - 1) / s) max: i / s - f ].
	^ d max
]

{ #category : #accessing }
PMKolmogorovSmirnov1Sample >> pValue [
	"the probability of getting a ksStatistic <= the actual one"

	^ distribution distributionValue: self ksStatistic
]

{ #category : #accessing }
PMKolmogorovSmirnov1Sample >> populationDistribution: aDistribution [
	"utility, a simple alternative method to set cdf."

	popDistribution := aDistribution.
	popDistribution distributionValue: 0.95.	"just a test whether it understands #distributionValue:, to raise a dnu early enough because of this block:"
	compareWith := [ :x | popDistribution distributionValue: x ]
]

{ #category : #printing }
PMKolmogorovSmirnov1Sample >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' cdf: '.
	compareWith
		ifNil: [ aStream nextPut: $- ]
		ifNotNil: [ popDistribution
				ifNil: [ compareWith printOn: aStream ]
				ifNotNil: [ aStream nextPutAll: 'distributionValue of '.
					popDistribution printOn: aStream ] ].
	aStream nextPut: $)
]
