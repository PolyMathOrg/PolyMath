"
beta approximation according to Jin Zhang & Yuehua Wu :
http://www.ism.ac.jp/editsec/aism/pdf/054_3_0577.pdf
results for the distributionValue are generally accurate up to two digits after the decimal point, better for higher p-values (the interesting case in practice) .
"
Class {
	#name : #PMKolmogorovsDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'a',
		'b',
		'distribution',
		'n'
	],
	#category : #'Math-KolmogorovSmirnov'
}

{ #category : #information }
PMKolmogorovsDistribution class >> distributionName [
	^ 'Kolmogorovs Distribution'
]

{ #category : #'instance creation' }
PMKolmogorovsDistribution class >> exampleSize: anInteger [
	^ self new
		exampleSize: anInteger;
		yourself
]

{ #category : #information }
PMKolmogorovsDistribution >> average [
	^ distribution average * a + b
]

{ #category : #information }
PMKolmogorovsDistribution >> distributionValue: aFloat [
	"returns the probability of getting a value <= aFloat"

	| i |
	i := (aFloat - b) / a.
	i <= 0
		ifTrue: [ ^ 0 ].
	i >= 1
		ifTrue: [ ^ 1 ].
	^ distribution distributionValue: (aFloat - b) / a
]

{ #category : #initialization }
PMKolmogorovsDistribution >> exampleSize: anInteger [
	"initializes a new distribution"

	| p q |
	a := 0.003326 - (6.012 / anInteger) + (5.52 / (anInteger raisedTo: 0.53)).
	b := -0.0004245 - (0.003397 / anInteger) + (0.3204 / (anInteger raisedTo: 0.48)).
	p := 3.258 - (3.727 / anInteger) + (4.607 / (anInteger raisedTo: 1.6)).
	q := 25 - (161.2 / anInteger) + (162.2 / (anInteger raisedTo: 1.3)).
	distribution := PMBetaDistribution shape: p shape: q.
	^ n := anInteger
]

{ #category : #information }
PMKolmogorovsDistribution >> kurtosis [
	| p s |
	p := distribution parameters.
	s := p sum.
	^ (s + 1) * 3 / (s + 3) * ((p second - p first) squared * 2 / ((s + 2) * p first * p second) + 1)
]

{ #category : #information }
PMKolmogorovsDistribution >> parameters [
	^ Array with: n
]

{ #category : #information }
PMKolmogorovsDistribution >> skewness [
	| p s |
	p := distribution parameters.
	s := p sum.
	^ (p second - p first) * 2 / (s + 2) * ((s + 1) / (p first * p second)) sqrt
]

{ #category : #information }
PMKolmogorovsDistribution >> standardDeviation [
	| p s |
	p := distribution parameters.
	s := p sum.
	^ a / s * (p first * p second / (s + 1)) sqrt
]

{ #category : #information }
PMKolmogorovsDistribution >> value: aFloat [
	^ (distribution value: (aFloat - b) / a) / a
]
