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
	q := {0.
	(1 / 4).
	(1 / 2).
	(3 / 4).
	1}
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
				withProbs:
					{0.5.
					0.5.
					(1 / 2).
					(1 / 2)})
		equals: 1
]

{ #category : #tests }
PMQuantileTest >> testQuantileA [
	self
		assert: (self resultCollect: a method: #modeBased)
		equals:
			{1.
			(7 / 4).
			(5 / 2).
			(13 / 4).
			4}.
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
		equals:
			{1.
			(3 / 2).
			(5 / 2).
			(7 / 2).
			4}.
	self
		assert: (self resultCollect: a method: #weibull)
		equals:
			{1.
			(5 / 4).
			(5 / 2).
			(15 / 4).
			4}.
	self
		assert: (self resultCollect: a method: #medianBased)
		equals:
			{1.
			(17 / 12).
			(5 / 2).
			(43 / 12).
			4}.
	self
		assert: (self resultCollect: a method: #normalDistribution)
		equals:
			{1.
			(23 / 16).
			(5 / 2).
			(57 / 16).
			4}.
	self assert: (a quantile: 1 / 4) equals: 7 / 4.
	self assert: a interQuartileRange equals: 2
]

{ #category : #tests }
PMQuantileTest >> testQuantileB [
	"tests #(2 4 5 7 8 9 10 12 15 16 18)"

	self
		assert: (self resultCollect: b method: #modeBased)
		equals:
			{2.
			6.
			9.
			(27 / 2).
			18}.
	self
		assert: (self resultCollect: b method: #inverseCDF)
		equals: #(2 5 9 15 18).
	self
		assert: (self resultCollect: b method: #closestObservation)
		equals: #(2 5 9 12 18).
	self
		assert: (self resultCollect: b method: #california)
		equals:
			{2.
			(19 / 4).
			(17 / 2).
			(51 / 4).
			18}.
	self
		assert: (self resultCollect: b method: #hydrologist)
		equals:
			{2.
			(11 / 2).
			9.
			(57 / 4).
			18}.
	self
		assert: (self resultCollect: b method: #weibull)
		equals: #(2 5 9 15 18).
	self
		assert: (self resultCollect: b method: #medianBased)
		equals:
			{2.
			(16 / 3).
			9.
			(29 / 2).
			18}.
	self
		assert: (self resultCollect: b method: #normalDistribution)
		equals:
			{2.
			(43 / 8).
			9.
			(231 / 16).
			18}.
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
		equals:
			{1.
			(5 / 4).
			(5 / 2).
			(15 / 4).
			5}.
	self
		assert: (self resultCollect: c method: #hydrologist)
		equals:
			{1.
			(7 / 4).
			3.
			(17 / 4).
			5}.
	self
		assert: (self resultCollect: c method: #weibull)
		equals:
			{1.
			(3 / 2).
			3.
			(9 / 2).
			5}.
	self
		assert: (self resultCollect: c method: #medianBased)
		equals:
			{1.
			(5 / 3).
			3.
			(13 / 3).
			5}.
	r := {1.
	(27 / 16).
	3.
	(69 / 16).
	5}.
	self
		assert: (self resultCollect: c method: #normalDistribution)
		equals: r.
	self
		assert:
			(self
				resultCollect: c
				withProbs:
					{(3 / 8).
					(1 / 4).
					0.
					1})
		equals: r.
	self assert: c interQuartileRange equals: 5 / 2
]

{ #category : #tests }
PMQuantileTest >> testQuantileD [
	"tests #(1 3 2 4 5 6)"

	self
		assert: (self resultCollect: d method: #modeBased)
		equals:
			{1.
			(9 / 4).
			(7 / 2).
			(19 / 4).
			6}.
	self
		assert: (self resultCollect: d method: #inverseCDF)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #closestObservation)
		equals: #(1 2 3 5 6).
	self
		assert: (self resultCollect: d method: #california)
		equals:
			{1.
			(3 / 2).
			3.
			(9 / 2).
			6}.
	self
		assert: (self resultCollect: d method: #hydrologist)
		equals:
			{1.
			2.
			(7 / 2).
			5.
			6}.
	self
		assert: (self resultCollect: d method: #weibull)
		equals:
			{1.
			(7 / 4).
			(7 / 2).
			(21 / 4).
			6}.
	self
		assert: (self resultCollect: d method: #medianBased)
		equals:
			{1.
			(23 / 12).
			(7 / 2).
			(61 / 12).
			6}.
	self
		assert: (self resultCollect: d method: #normalDistribution)
		equals:
			{1.
			(31 / 16).
			(7 / 2).
			(81 / 16).
			6}.
	self assert: d interQuartileRange equals: 3
]
