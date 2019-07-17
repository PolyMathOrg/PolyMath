"
used for tests. if you want to see how to subclass Accuracy, you only need to look at initialize, initializeXXX and checkXXX, the rest is only for AccuracyTest.
if you want to see its output, just 'print it':
AccuracyTestExample new run.

"
Class {
	#name : #PMAccuracyTestExample,
	#superclass : #PMAccuracy,
	#instVars : [
		'count'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #tests }
PMAccuracyTestExample >> checkAaa [
self argument first ifTrue:[^#(1 1)].
^{4 +(0.4 * Random new next) . 2}
]

{ #category : #tests }
PMAccuracyTestExample >> checkBbb [
^self argument first size +self parameter first 
]

{ #category : #tests }
PMAccuracyTestExample >> checkCcc [
^self argument first +(0.01*self parameter first).
]

{ #category : #tests }
PMAccuracyTestExample >> checkDdd [
^{2 .3 }asOrderedCollection 
]

{ #category : #tests }
PMAccuracyTestExample >> checkEee [
^{self parameter first .3 }
]

{ #category : #tests }
PMAccuracyTestExample >> checkFff [
^{0. 0. 1. 0. Float nan}
]

{ #category : #private }
PMAccuracyTestExample >> count [
^count
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initialize [ 
"this is always necessarily the first thing:"
super initialize .
"this is only for testSetup:"
count:=0.
"now you can set defaults:"
self result: #(#(2)#(3)).
self argument: #(#('a') #('AG')).
self parameter: #(#(1) #(3))

]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeAaa [
"this overrides defaults in #initialize:"
self result: #(#(5 3) #(4 4)).
self argument: #(#(false) #(true)).
self parameter: #(#(1 2) #(3 2.8888))
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeCcc [
"this overrides defaults in initialize"
self result: #((1)(1)(1)).
self argument: #((1)(1.1)(0.9)).
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeDdd [
"this overrides defaults in initialize"
self result: #(1.1 2.2).
self argument: #()."necessary since otherwise the default values defined in #initialize would be used"
self parameter: #().
]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeEee [
"this overrides defaults in initialize"
self result: #(#(1.1 2.2) #(1 3)).

]

{ #category : #'initialize-release' }
PMAccuracyTestExample >> initializeFff [
"this overrides defaults in initialize"
self result: #(0 1 0 -2 3).
self argument: nil.
self parameter:nil.
]

{ #category : #running }
PMAccuracyTestExample >> setUp [ 
count :=count+1.
]

{ #category : #running }
PMAccuracyTestExample >> tearDown [
count :=count-(1/5).
]

{ #category : #private }
PMAccuracyTestExample >> testGetterAaa [
^{ self parameter .self argument.self resultsAt: 'Aaa'.self numberOfDifferentParametersAt: 'Aaa'.self numberOfDifferentResultsAt:'Aaa'}
]

{ #category : #private }
PMAccuracyTestExample >> testGetterBbb [
^{ self parameter .self argument.self resultsAt: 'Bbb'.self numberOfDifferentParametersAt: 'Bbb'.self numberOfDifferentResultsAt:'Bbb'}
]
