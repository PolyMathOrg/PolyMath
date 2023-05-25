"
GAAccuracy tests standard problems
"
Class {
	#name : #PMGAAccuracy,
	#superclass : #PMAccuracy,
	#instVars : [
		'fast'
	],
	#category : #'Math-FunctionFit'
}

{ #category : #tests }
PMGAAccuracy >> checkDamavandi [
	| g origin range optimizer  |
	g := [:x| |x1 x2|
				x1:=x at:1.
				x2:=x at:2.
				( 1 - ( ( ((x1 - 2)* Float pi)sin * ((x2 - 2) * Float pi)sin /(Float pi squared *(x1 - 2)*(x2 - 2)) )abs raisedToInteger: 5)) *(2 + (x1 - 7) squared + (2 * (x2 -7)squared)) ].
	origin := #(0 0 ).
	range :=#(  14    14 ).
	optimizer:= PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range.
	optimizer chromosomeManager populationSize: 570.
	self setManager: optimizer chromosomeManager with: self parameter.
	^g value: optimizer evaluate
]

{ #category : #tests }
PMGAAccuracy >> checkDeVilliersGlasser2 [
	| ti yi g origin range optimizer |
	ti := [ :x | (x - 1) / 10 ].
	yi := [ :i |
	53.81 * (1.27 raisedTo: (ti value: i)) * (3.012 * (ti value: i) + (2.13 * (ti value: i)) sin) tanh
		* (0.507 exp * (ti value: i)) cos ].
	g := [ :x |
	| xc |
	xc := x
		collect: [ :i |
			i < 0
				ifTrue: [ i negated ]
				ifFalse: [ i ] ].
	((1 to: 24)
		collect: [ :i |
			(((xc at: 2) raisedTo: (ti value: i)) * (xc at: 1)
				* ((xc at: 3) * (ti value: i) + ((xc at: 4) * (ti value: i)) sin) tanh * ((xc at: 5) exp * (ti value: i)) cos
				- (yi value: i)) squared ]) sum ].
	origin := #(0 0 0 0 0).
	range := #(60 60 60 60 60).
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range.
	optimizer chromosomeManager populationSize: 600.
	fast
		ifFalse: [ optimizer maximumIterations: 350 ].
	self setManager: optimizer chromosomeManager with: self parameter.
	^ g value: optimizer evaluate
]

{ #category : #tests }
PMGAAccuracy >> checkF1 [
	| f origin optimizer |
	f := [ :x |
	| v |
	v := x asPMVector.
	v * v ].
	origin := Array new: self argument first withAll: -5.
	optimizer := PMAnotherGeneticOptimizer function: f minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [
			optimizer chromosomeManager populationSize: 50.
			optimizer maximumIterations: 50 ].
	^ f value: optimizer evaluate
]

{ #category : #tests }
PMGAAccuracy >> checkF2 [
	| g origin optimizer r |
	g := [ :x | (x overlappingPairsCollect: [ :f :s | (s - f squared) squared * 100 + (1 - f) squared ]) sum ].
	r := #(2 3 4)
		collect: [ :i |
			origin := Array new: i withAll: -2.048.
			optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
			self setManager: optimizer chromosomeManager with: self parameter.
			fast
				ifTrue: [
					optimizer chromosomeManager populationSize: 60.
					optimizer maximumIterations: 70 ].
			g value: optimizer evaluate ].
	^ r
]

{ #category : #tests }
PMGAAccuracy >> checkF3 [
	| g origin optimizer |
	g := [ :x | (x floor + 0.5) squared sum ].
	origin := Array new: self argument first withAll: -5.
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [
			optimizer chromosomeManager populationSize: 20.
			optimizer maximumIterations: 70 ]
		ifFalse: [
			optimizer chromosomeManager populationSize: 30.
			optimizer maximumIterations: 90 ].
	^ g value: optimizer evaluate
]

{ #category : #tests }
PMGAAccuracy >> checkF5 [
	| g origin optimizer |
	g := [ :x |
	| x1 x2 |
	x1 := x at: 1.
	x2 := x at: 2.
	1
		/
			(((-2 to: 2)
				collect: [ :i |
					((-2 to: 2)
						collect: [ :j | 1 / ((i + 2) * 5 + j + 3 + (x1 - (16 * j) raisedToInteger: 6) + (x2 - (16 * i) raisedToInteger: 6)) ])
						sum ]) sum + 0.002) ].
	origin := #(-65.536 -65.536).
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [ optimizer maximumIterations: 70 ].
	^ g value: optimizer evaluate
]

{ #category : #tests }
PMGAAccuracy >> checkGriewank [
	| g origin range optimizer |
	g := [ :x | x squared sum / 4000 - ((x withIndexCollect: [ :xi :i | (xi / i sqrt) cos ]) reduce: [ :a :b | a * b ]) + 1 ].
	origin := #(-600 -600).
	range := #(600 600).
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifFalse: [ optimizer maximumIterations: 350 ].
	^ g value: optimizer evaluate
]

{ #category : #accessing }
PMGAAccuracy >> fast [
	^fast
]

{ #category : #accessing }
PMGAAccuracy >> fast: aBoolean [
	"default is false"
	fast := aBoolean
]

{ #category : #initialization }
PMGAAccuracy >> initialize [
	super initialize.
	fast :=false.
	self iterations: 10.
	self parameter: #(#(0.4 0.15 0.29 0.16) #(0.40 0.15 0.28 0.17))
]

{ #category : #initialization }
PMGAAccuracy >> initializeDamavandi [
	self result: 0
]

{ #category : #initialization }
PMGAAccuracy >> initializeDeVilliersGlasser2 [
	self result: 0
]

{ #category : #initialization }
PMGAAccuracy >> initializeF1 [
	self result: #((0) (0) (0)).
	self argument: #((4) (8) (12))
]

{ #category : #initialization }
PMGAAccuracy >> initializeF2 [
	self result: #(0 0 0)
]

{ #category : #initialization }
PMGAAccuracy >> initializeF3 [
	self argument: #(#(16) #(20)).
	self result: #(#(4) #(5))
]

{ #category : #initialization }
PMGAAccuracy >> initializeF5 [
	self result: 0.99800383779444
]

{ #category : #initialization }
PMGAAccuracy >> initializeGriewank [
	self result: 0
]

{ #category : #running }
PMGAAccuracy >> runFast [
	"fast is an euphemism here, but at least its fast to type"
	fast := true.
	^ self run: #('F1' 'F2' 'F3' 'F5' 'Griewank')
]

{ #category : #running }
PMGAAccuracy >> setManager:aManager with: rates [
	"set everything to zero first, so that you dont get warnings"
	aManager
		rateOfMutation: 0;
		rateOfCrossover: 0;
		rateOfLC: 0;
		rateOfEir: 0;
		rateOfMutation: rates first;
		rateOfCrossover: (rates at:2);
		rateOfLC: (rates at:3);
		rateOfEir: (rates at:4).
]
