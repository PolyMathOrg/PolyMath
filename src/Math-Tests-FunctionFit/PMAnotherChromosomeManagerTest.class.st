Class {
	#name : #PMAnotherChromosomeManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'chromosomeManager'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMAnotherChromosomeManagerTest >> setHammersleyTest: aBoolean [
	chromosomeManager useHammersley: aBoolean.
	chromosomeManager randomizePopulation.
	self assert: chromosomeManager isFullyPopulated.
	self assert: (chromosomeManager population anySatisfy: [ :g | g first > 1 ]).
	self assert: (chromosomeManager population anySatisfy: [ :g | g first < 1 ]).
	self assert: (chromosomeManager population anySatisfy: [ :g | g second < 2 ]).
	self assert: (chromosomeManager population anySatisfy: [ :g | g second > 3 ]).
	chromosomeManager population
		do: [ :i |
			self assert: i size equals: 2.
			self assert: (i first between: 0 and: 2).
			self assert: (i second between: 1 and: 4) ]
]

{ #category : #running }
PMAnotherChromosomeManagerTest >> setUp [

	super setUp.
	chromosomeManager := PMAnotherChromosomeManager origin: #( 0 1 ) range: #( 2 3 ).
	chromosomeManager randomGenerator: (Random seed: 42)
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testAccessing [
	self assert: chromosomeManager range equals: #(2 3).
	self assert: chromosomeManager populationSize equals: 100.
	self deny: chromosomeManager isFullyPopulated
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testCrossOver [

	| a |
	1 to: 20 do: [ :i |
		a := chromosomeManager crossover: #( 1 2 3 ) and: #( 4 5 6 ).
		1 to: 2 do: [ :index |
			self assert: (#( 1 4 ) includes: (a at: index) first).
			self assert: (#( 2 5 ) includes: ((a at: index) at: 2)).
			self assert: (#( 3 6 ) includes: ((a at: index) at: 3)) ].
		self deny: ((a at: 1) at: 2) equals: ((a at: 2) at: 2).
		self deny: ((a at: 1) at: 1) equals: ((a at: 2) at: 1).
		self deny: ((a at: 1) at: 3) equals: ((a at: 2) at: 3).
		a ].
	a := a collect: [ :g | g first ].
	self assert: (a occurrencesOf: #( 1 2 3 )) < 20
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testEirCrossOver [
|a|
a :=(1 to: 200)collect: [:i| a:=chromosomeManager eirCrossover: #(1.0 3.0) and: #(5.0 1.0).
		self assert: (((a at: 1)at:1) between: -1 and: 7).
		self assert: (((a at: 1)at:2) between: 0 and: 4).
		self assert: (((a at: 2)at:1) between: -1 and: 3).
		self assert: (((a at: 2)at:2) between: 2 and: 4).
		a].
self assert: (a anySatisfy: [:g|((g at: 1)at:1)<0]).
self assert: (a anySatisfy: [:g|((g at: 1)at:1)>6]).
self assert: (a anySatisfy: [:g|((g at: 1)at:2)<1]).
self assert: (a anySatisfy: [:g|((g at: 1)at:2)>3]).
self assert: (a anySatisfy: [:g|((g at: 2)at:1)<0]).
self assert: (a anySatisfy: [:g|((g at: 2)at:1)>2]).
self assert: (a anySatisfy: [:g|((g at: 2)at:2)<3]).
self assert: (a anySatisfy: [:g|((g at: 2)at:2)>3]).
self shouldnt: [a:=chromosomeManager eirCrossover: #(1 -3) and: #(1 -3)] raise: Error.
(1 to: 20)do: [:i| a:=chromosomeManager eirCrossover: #(-1.0 -1) and: #(1 1.0).
		self assert: (((a at: 1)at:1) between: -2 and: 2).
		self assert: (((a at: 1)at:2) between: -2 and: 2).
		self assert: (((a at: 2)at:1) between: -2 and: 0).
		self assert: (((a at: 2)at:2) between: -2 and: 0).
		].
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testIntegerDigits [
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 0 base: 2)
		equals: #(0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 1 base: 3)
		equals: #(1).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 12 base: 2)
		equals: #(1 1 0 0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 12 base: 4)
		equals: #(3 0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 49 base: 5)
		equals: #(1 4 4)
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testLineCrossOver [
	| a |
	1 to: 10 do: [ :i |
		a := chromosomeManager lineCrossOver: #(-2 2) and: #(-4 4).
		self assert: ((a at: 1) at: 2) equals: ((a at: 1) at: 1) negated.
		self assert: ((a at: 2) at: 2) equals: ((a at: 2) at: 1) negated ]
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testMutateProbabilistic [

	| a f s |
	a := (1 to: 100) collect: [ :i | chromosomeManager mutate: #( -4 4 ) ].
	f := a collect: [ :i | i first ].
	s := f select: [ :i | i > -4 ].
	self assert: (s size between: 15 and: 60).
	s := f select: [ :i | i = -4 ].
	self assert: s size > 20.
	s := f select: [ :i | i > -3.8 or: [ i < -4.2 ] ].
	self assert: (s size between: 3 and: 20).
	s := f select: [ :i | i > -3.9 or: [ i < -4.1 ] ].
	self assert: (s size between: 6 and: 50).

	f := a collect: [ :i | i second ].
	s := f select: [ :i | i > 4 ].
	self assert: (s size between: 15 and: 60).
	s := f select: [ :i | i = 4 ].
	self assert: s size > 20.
	s := f select: [ :i | i < 3.8 or: [ i > 4.2 ] ].
	self assert: (s size between: 3 and: 20)
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testNumberOfHamersleyPoints [

	| rand |
	self
		assert: (PMAnotherChromosomeManager numberOfHamersleyPoints: 9 dimension: 1 randomGenerator: nil)
		equals: ((1 to: 9) collect: [ :i | Array with: i * (1 / 9) ]).
	self assert: (PMAnotherChromosomeManager numberOfHamersleyPoints: 9 dimension: 4 randomGenerator: nil) equals: (OrderedCollection new
			 add: (Array
					  with: 1 / 9
					  with: 1 / 2
					  with: 1 / 3
					  with: 1 / 5);
			 add: (Array
					  with: 2 / 9
					  with: 1 / 4
					  with: 2 / 3
					  with: 2 / 5);
			 add: (Array
					  with: 1 / 3
					  with: 3 / 4
					  with: 1 / 9
					  with: 3 / 5);
			 add: (Array
					  with: 4 / 9
					  with: 1 / 8
					  with: 4 / 9
					  with: 4 / 5);
			 add: (Array
					  with: 5 / 9
					  with: 5 / 8
					  with: 7 / 9
					  with: 1 / 25);
			 add: (Array
					  with: 2 / 3
					  with: 3 / 8
					  with: 2 / 9
					  with: 6 / 25);
			 add: (Array
					  with: 7 / 9
					  with: 7 / 8
					  with: 5 / 9
					  with: 11 / 25);
			 add: (Array
					  with: 8 / 9
					  with: 1 / 16
					  with: 8 / 9
					  with: 16 / 25);
			 add: (Array
					  with: 1
					  with: 9 / 16
					  with: 1 / 27
					  with: 21 / 25);
			 asArray).
	rand := (PMAnotherChromosomeManager numberOfHamersleyPoints: 3 dimension: 4 randomGenerator: nil)
	        - (PMAnotherChromosomeManager numberOfHamersleyPoints: 3 dimension: 4 randomGenerator: (Random seed: 42)).
	rand do: [ :i |
		self assert: i first >= 0.
		self assert: (i at: 2) < 0.
		self assert: (i at: 3) < 0 ].
	rand do: [ :i | i do: [ :j | j < (1 / 3) ] ]
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testPrint [
|aStream  s|
aStream :=ReadWriteStream with:''.
chromosomeManager printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: '#(0 1)').
self assert: (s includesSubstring: '#(2 3)')
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testProcessand [
	chromosomeManager reset.
	1 to: 60 do: [ :i | chromosomeManager process: #(0 0) and: #(1 1) ].
	self assert: (chromosomeManager population select: [ :i | i = #(0 0) ]) size < 15.
	self assert: (chromosomeManager population select: [ :i | i = #(1 1) ]) size < 15.
	self assert: (chromosomeManager population select: [ :i | i = #(0 1) ]) size > 0.
	self assert: (chromosomeManager population select: [ :i | i = #(1 0) ]) size > 0.
	self assert: chromosomeManager population size equals: 120
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testRandomizePopulation [

	| g |
	self setHammersleyTest: true.
	g := chromosomeManager population first.
	self setHammersleyTest: false.
	self deny: chromosomeManager population first equals: g.
	g := chromosomeManager population first.
	self setHammersleyTest: false.
	self deny: chromosomeManager population first equals: g
]

{ #category : #tests }
PMAnotherChromosomeManagerTest >> testRateSetting [
self should: [chromosomeManager rateOfLC: 1.3] raise:  DomainError .
self should: [chromosomeManager rateOfEir: -0.3] raise:  DomainError .
self should: [chromosomeManager rateOfMutation:  1.0000003] raise:  DomainError .
self should: [chromosomeManager rateOfCrossover:  -0.0000003] raise:  DomainError .
self shouldnt: [chromosomeManager rateOfLC: 0] raise:  Error .
self should: [chromosomeManager rateOfLC: 0.33] raise:  Warning  .
chromosomeManager rateOfLC: 0.2.
self shouldnt: [chromosomeManager rateOfEir: 0.25] raise:  Error  .
self should: [chromosomeManager rateOfEir: 0.26] raise:  Warning    .
self should: [chromosomeManager rateOfMutation: 1] raise:  Warning .
"usual floating point inaccuracies should be accepted:"
self shouldnt: [chromosomeManager rateOfCrossover:  0.15000000000000001 ] raise:  Warning .
self should: [chromosomeManager rateOfCrossover:  0.1500001] raise:  Warning
]
