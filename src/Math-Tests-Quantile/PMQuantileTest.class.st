"
QuantileTest tests mainly '#quantile: method:' by calculating quartiles with every method on SortedCollections of size 4, 5, 6 and 11.
"
Class {
	#name : #PMQuantileTest,
	#superclass : #TestCase,
	#instVars : [
		'a',
		'b',
		'q',
		'c',
		'd'
	],
	#category : #'Math-Tests-Quantile'
}

{ #category : #running }
PMQuantileTest >> resultCollect: aSortedColl method: aMethod [
	^ q collect: [ :x | aSortedColl quantile: x method: aMethod ]
]

{ #category : #running }
PMQuantileTest >> resultCollect: aSortedColl withProbs: aMethod [
	^ q collect: [ :x | aSortedColl quantile: x withProbs: aMethod ]
]

{ #category : #running }
PMQuantileTest >> setUp [
	a := #(1 3 2 4) asSortedCollection.
	c := #(1 3 2 4 5) asSortedCollection.
	d := #(1 3 2 4 5 6) asSortedCollection.
	b := #(2 4 5 7 8 9 10 12 15 16 18) asSortedCollection.
	q := Array with: 0 with: (1 / 4) with: (1 / 2) with: (3 / 4) with: 1
]

{ #category : #tests }
PMQuantileTest >> testError [
	self
		should: [ a quantile: 0.5 withProbs: #(1 -1 0) ]
		raise: Error
		whoseDescriptionIncludes: 'SubscriptOutOfBounds'
		description: 'Wrong error message'

]

{ #category : #tests }
PMQuantileTest >> testExtremeCase [
	self assert: #(2) asSortedCollection interQuartileRange equals: 0.
	self assert: #(2 2) asSortedCollection interQuartileRange equals: 0.
	self
		assert: #(2 2 2 2 2 2.2) asSortedCollection interQuartileRange
		equals: 0.
	self
		assert:
			(a
				quantile: 0
				withProbs: (Array with: 0.5 with: 0.5 with: (1 / 2) with: (1 / 2)))
		equals: 1
]

{ #category : #tests }
PMQuantileTest >> testFloatProbability [
	"tests that input quantile probabilities can be a float"	
			
	self assert: (c quantile: 0.25) equals: 2.
	
	self assert: (c quantile: 0.27) equals: 2.08
]

{ #category : #tests }
PMQuantileTest >> testQuantileA [
	self
		assert: (self resultCollect: a method: #modeBased)
		equals: (Array with: 1 with: (7 / 4) with: (5 / 2) with: (13 / 4) with: 4).
	self
		assert: (self resultCollect: a method: #inverseCDF)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #closestObservation)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #california)
		equals: #(1 1 2 3 4).
	self
		assert: (self resultCollect: a method: #hydrologist)
		equals: (Array with: 1 with: (3 / 2) with: (5 / 2) with: (7 / 2) with:  4).
	self
		assert: (self resultCollect: a method: #weibull)
		equals: (Array with: 1 with: (5 / 4) with: (5 / 2) with: (15 / 4) with:  4).
	self
		assert: (self resultCollect: a method: #medianBased)
		equals: (Array with: 1 with: (17 / 12) with: (5 / 2) with: (43 / 12) with:  4).
	self
		assert: (self resultCollect: a method: #normalDistribution)
		equals: (Array with: 1 with: (23 / 16) with: (5 / 2) with: (57 / 16) with: 4).
	self assert: (a quantile: 1 / 4) equals: 7 / 4.
	self assert: a interQuartileRange equals: 2
]

{ #category : #tests }
PMQuantileTest >> testQuantileB [
	"tests #(2 4 5 7 8 9 10 12 15 16 18)"

	self
		assert: (self resultCollect: b method: #modeBased)
		equals: (Array with: 2 with: 6 with: 9 with: (27 / 2) with: 18).
	self
		assert: (self resultCollect: b method: #inverseCDF)
		equals: #(2 5 9 15 18).
	self
		assert: (self resultCollect: b method: #closestObservation)
		equals: #(2 5 9 12 18).
	self
		assert: (self resultCollect: b method: #california)
		equals: (Array with: 2 with: (19 / 4) with: (17 / 2) with: (51 / 4) with: 18).
	self
		assert: (self resultCollect: b method: #hydrologist)
		equals: (Array with: 2 with: (11 / 2) with: 9 with: (57 / 4) with: 18).
	self
		assert: (self resultCollect: b method: #weibull)
		equals: #(2 5 9 15 18).
	self
		assert: (self resultCollect: b method: #medianBased)
		equals: (Array with: 2 with: (16 / 3) with: 9 with: (29 / 2) with: 18).
	self
		assert: (self resultCollect: b method: #normalDistribution)
		equals: (Array with: 2 with: (43 / 8) with: 9 with: (231 / 16) with: 18).
	self assert: (b quantile: 1 / 4) equals: 6.
	self assert: b interQuartileRange equals: 35 / 4
]

{ #category : #tests }
PMQuantileTest >> testQuantileC [
	"tests #(1 3 2 4 5)"

	| r |
	self
		assert: (self resultCollect: c method: #modeBased)
		equals: #(1 2 3 4 5).
	self
		assert: (self resultCollect: c method: #inverseCDF)
		equals: #(1 2 3 4 5).
	self
		assert: (self resultCollect: c method: #closestObservation)
		equals: #(1 1 3 4 5).
	self
		assert: (self resultCollect: c method: #california)
		equals: (Array with: 1 with: (5 / 4) with: (5 / 2) with: (15 / 4) with: 5).
	self
		assert: (self resultCollect: c method: #hydrologist)
		equals: (Array with: 1 with: (7 / 4) with: 3 with: (17 / 4) with: 5).
	self
		assert: (self resultCollect: c method: #weibull)
		equals: (Array with: 1 with: (3 / 2) with: 3 with: (9 / 2) with: 5).
	self
		assert: (self resultCollect: c method: #medianBased)
		equals: (Array with: 1 with: (5 / 3) with: 3 with: (13 / 3) with: 5).
	r := Array with: 1 with: (27 / 16) with: 3 with: (69 / 16) with: 5.
	self
		assert: (self resultCollect: c method: #normalDistribution)
		equals: r.
	self
		assert:
			(self
				resultCollect: c
				withProbs: (Array with: (3 / 8) with: (1 / 4) with: 0 with: 1))
		equals: r.
	self assert: c interQuartileRange equals: 5 / 2
]

{ #category : #tests }
PMQuantileTest >> testQuantileD [
	"tests #(1 3 2 4 5 6)"

	self
		assert: (self resultCollect: d method: #modeBased)
		equals: (Array with: 1 with: (9 / 4) with: (7 / 2) with: (19 / 4) with: 6).
	self
		assert: (self resultCollect: d method: #inverseCDF)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #closestObservation)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #california)
		equals: (Array with: 1 with: (3 / 2) with: 3 with: (9 / 2) with: 6).
	self
		assert: (self resultCollect: d method: #hydrologist)
		equals: (Array with: 1 with: 2 with: (7 / 2) with: 5 with: 6).
	self
		assert: (self resultCollect: d method: #weibull)
		equals: (Array with: 1 with: (7 / 4) with: (7 / 2) with: (21 / 4) with: 6).
	self
		assert: (self resultCollect: d method: #medianBased)
		equals: (Array with: 1 with: (23 / 12) with: (7 / 2) with: (61 / 12) with: 6).
	self
		assert: (self resultCollect: d method: #normalDistribution)
		equals: (Array with: 1 with: (31 / 16) with: (7 / 2) with: (81 / 16) with: 6).
	self assert: d interQuartileRange equals: 3
]
