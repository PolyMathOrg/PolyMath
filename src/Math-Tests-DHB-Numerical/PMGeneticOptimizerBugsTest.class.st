Class {
	#name : #PMGeneticOptimizerBugsTest,
	#superclass : #TestCase,
	#instVars : [
		'manager',
		'function',
		'optimizer'
	],
	#category : #'Math-Tests-DHB-Numerical'
}

{ #category : #running }
PMGeneticOptimizerBugsTest >> setUp [
manager:= PMChromosomeManager new.
manager populationSize:3.
function:=[:x| (x*x)sum].
optimizer:= PMGeneticOptimizer minimizingFunction: function.
optimizer chromosomeManager: manager.
]

{ #category : #tests }
PMGeneticOptimizerBugsTest >> testBug1 [
| r |
optimizer addPointAt: #(2 3).
optimizer addPointAt: #(2 3).
self shouldnt: [r:=optimizer randomScale] raise: Error.
self assert: ( r first equalsTo: (1/2) ).
self assert: ( r last equalsTo: 1).
]

{ #category : #tests }
PMGeneticOptimizerBugsTest >> testBug2 [
| r |
optimizer addPointAt: #(2 3).
"i add a nan by hand here,which in a way doesnt make sense, just to get a nan result for function, but with a more complicated function it is perfectly possible for the optimizer to produce nan's by itself!"
optimizer addPointAt: {Float nan. 3}.
"if you inspect r here you will see that a _single nan result can _completely throw off the ga calculations"
r:=optimizer randomScale.
self deny: r first isNaN.
]
