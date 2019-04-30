Class {
	#name : #PMSeriesTermServer,
	#superclass : #Object,
	#instVars : [
		'x',
		'lastTerm'
	],
	#category : #'Math-Numerical'
}

{ #category : #initialization }
PMSeriesTermServer >> setArgument: aNumber [
	x := aNumber asFloat
]
