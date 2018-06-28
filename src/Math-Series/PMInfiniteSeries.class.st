Class {
	#name : #PMInfiniteSeries,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'termServer'
	],
	#category : 'Math-Series'
}

{ #category : #creation }
PMInfiniteSeries class >> server: aTermServer [
	^ self new initialize: aTermServer
]

{ #category : #operation }
PMInfiniteSeries >> evaluateIteration [
	"Perform one iteration."

	| delta |
	delta := termServer termAt: iterations.
	result := result + delta.
	^ self precisionOf: delta abs relativeTo: result abs
]

{ #category : #initialization }
PMInfiniteSeries >> initialize: aTermServer [
	"Private - Assigns the object responsible to compute each term."

	termServer := aTermServer.
	^ self
]

{ #category : #operation }
PMInfiniteSeries >> initializeIterations [
	"Initialize the series."

	result := termServer initialTerm
]
