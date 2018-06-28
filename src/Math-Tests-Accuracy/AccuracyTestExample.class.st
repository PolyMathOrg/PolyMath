"
used for tests. if you want to see how to subclass Accuracy, you only need to look at initialize, initializeXXX and checkXXX, the rest is only for AccuracyTest.
if you want to see its output, just 'print it':
AccuracyTestExample new run.

"
Class {
	#name : #AccuracyTestExample,
	#superclass : #PMAccuracy,
	#instVars : [
		'count'
	],
	#category : 'Math-Tests-Accuracy'
}

{ #category : #tests }
AccuracyTestExample >> checkAaa [
self argument first ifTrue:[^#(1 1)].
^{4 +(0.4 * Random new next) . 2}
]

{ #category : #tests }
AccuracyTestExample >> checkBbb [
^self argument first size +self parameter first 
]

{ #category : #tests }
AccuracyTestExample >> checkCcc [
^self argument first +(0.01*self parameter first).
]

{ #category : #tests }
AccuracyTestExample >> checkDdd [
^{2 .3 }asOrderedCollection 
]

{ #category : #tests }
AccuracyTestExample >> checkEee [
^{self parameter first .3 }
]

{ #category : #tests }
AccuracyTestExample >> checkFff [
^{0. 0. 1. 0. Float nan}
]

{ #category : #private }
AccuracyTestExample >> count [
^count
]

{ #category : #'initialize-release' }
AccuracyTestExample >> initialize [ 
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
AccuracyTestExample >> initializeAaa [
"this overrides defaults in #initialize:"
self result: #(#(5 3) #(4 4)).
self argument: #(#(false) #(true)).
self parameter: #(#(1 2) #(3 2.8888))
]

{ #category : #'initialize-release' }
AccuracyTestExample >> initializeCcc [
"this overrides defaults in initialize"
self result: #((1)(1)(1)).
self argument: #((1)(1.1)(0.9)).
]

{ #category : #'initialize-release' }
AccuracyTestExample >> initializeDdd [
"this overrides defaults in initialize"
self result: #(1.1 2.2).
self argument: #()."necessary since otherwise the default values defined in #initialize would be used"
self parameter: #().
]

{ #category : #'initialize-release' }
AccuracyTestExample >> initializeEee [
"this overrides defaults in initialize"
self result: #(#(1.1 2.2) #(1 3)).

]

{ #category : #'initialize-release' }
AccuracyTestExample >> initializeFff [
"this overrides defaults in initialize"
self result: #(0 1 0 -2 3).
self argument: nil.
self parameter:nil.
]

{ #category : #running }
AccuracyTestExample >> setUp [ 
count :=count+1.
]

{ #category : #running }
AccuracyTestExample >> tearDown [
count :=count-(1/5).
]

{ #category : #private }
AccuracyTestExample >> testArgumentError [
self argument: #(#(1) #(2)).
]

{ #category : #private }
AccuracyTestExample >> testGetterAaa [
^{ self parameter .self argument.self resultsAt: 'Aaa'.self numberOfDifferentParametersAt: 'Aaa'.self numberOfDifferentResultsAt:'Aaa'}
]

{ #category : #private }
AccuracyTestExample >> testGetterBbb [
^{ self parameter .self argument.self resultsAt: 'Bbb'.self numberOfDifferentParametersAt: 'Bbb'.self numberOfDifferentResultsAt:'Bbb'}
]

{ #category : #private }
AccuracyTestExample >> testParameterError [
self parameter:  #(#(1) #(2)).
]

{ #category : #private }
AccuracyTestExample >> testResultError [
self result:#(1).
]
