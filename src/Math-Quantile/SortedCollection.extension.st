Extension { #name : #SortedCollection }

{ #category : #'*Math-Quantile' }
SortedCollection >> california [
	^ Array with: 0 with: 0 with: 0 with: 1
]

{ #category : #'*Math-Quantile' }
SortedCollection >> closestObservation [
	^ Array with: 1/2 with: 0 with: 0 with: 0
]

{ #category : #'*Math-Quantile' }
SortedCollection class >> example1 [
	<gtExample>
	<description: 'Find the halfway value (median) of a sorted collection'>
	^ #(1 2 3 4 5 6 7) asSortedCollection quantile: 1 / 2
]

{ #category : #'*Math-Quantile' }
SortedCollection class >> example2 [
	<gtExample>
	<description: 'Find the quarter-way value (lower quartile) of a sorted collection'>
	^ #(1 2 3 4 5 6 7) asSortedCollection quantile: 1 / 4
]

{ #category : #'*Math-Quantile' }
SortedCollection >> hydrologist [
	^ Array with: 1/2 with: 0 with: 0 with: 1
]

{ #category : #'*Math-Quantile' }
SortedCollection >> interQuartileRange [
	"if I use my standard sortBlock, then this returns the usual interQuartileRange (IQR)"

	^ (self quantile: 3 / 4 method: #hydrologist) - (self quantile: 1 / 4 method: #hydrologist)
]

{ #category : #'*Math-Quantile' }
SortedCollection >> inverseCDF [
	^ Array with: 0 with: 0 with: 1 with: 0
]

{ #category : #'*Math-Quantile' }
SortedCollection >> medianBased [
	^ Array with: 1/3 with: 1/3 with: 0 with: 1
]

{ #category : #'*Math-Quantile' }
SortedCollection >> modeBased [
	^ Array with: 1 with: -1 with: 0 with: 1
]

{ #category : #'*Math-Quantile' }
SortedCollection >> normalDistribution [
	^ Array with: 3/8 with: 1/4 with: 0 with: 1
]

{ #category : #'*Math-Quantile' }
SortedCollection >> quantile: aProbability [
	"returns the expected quantile only, if I use my standard sortBlock"

	^ self quantile: aProbability method: #modeBased
]

{ #category : #'*Math-Quantile' }
SortedCollection >> quantile: aProbability method: aMethodName [
	"returns the expected quantile only, if I use my standard sortBlock."

	"the possible methods are #modeBased, #inverseCDF, #closestObservation, #California (the California Department of Public Works method), #hydrologist (Hazen's model used in hydrology), #Weibull, #medianBased', #normalDistribution (occasionaly used for q-q plots). the generally most useful methods imo are #hydrologist, #inverseCDF and #modeBased, which is used as a default in '#quantile:'"

	| probs |
	aProbability > 1 | (aProbability < 0)
		ifTrue: [ ^ DomainError signal: 'aProbability must be between 0 and 1' ].
	probs := self perform: aMethodName.
	^ self quantile: aProbability withProbs: probs
]

{ #category : #'*Math-Quantile' }
SortedCollection >> quantile: aProbability withProbs: anArray [
	| a b c d p f |
	a := anArray at: 1.
	b := anArray at: 2.
	c := anArray at: 3.
	d := anArray at: 4.
	p := (self size + b) * aProbability + a.
	p := p < 1
		ifTrue: [ 1 ]
		ifFalse: [ p min: self size ].
	^ p truncated = p
		ifTrue: [ self at: p ]
		ifFalse: [ (f := self at: p floor)
				+ (((self at: p ceiling) - f) * (p fractionPart * d + c)) ]
]

{ #category : #'*Math-Quantile' }
SortedCollection >> weibull [
	^ Array with: 0 with: 1 with: 0 with: 1
]
