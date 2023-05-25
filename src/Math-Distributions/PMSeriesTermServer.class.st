Class {
	#name : #PMSeriesTermServer,
	#superclass : #Object,
	#instVars : [
		'x',
		'lastTerm'
	],
	#category : #'Math-Distributions-Gamma'
}

{ #category : #initialization }
PMSeriesTermServer >> setArgument: aNumber [
	x := aNumber asFloat
]
