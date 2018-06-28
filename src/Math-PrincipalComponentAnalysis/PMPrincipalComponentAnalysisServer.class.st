"
Just a simple server data class for the tests
"
Class {
	#name : #PMPrincipalComponentAnalysisServer,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : 'Math-PrincipalComponentAnalysis'
}

{ #category : #initialization }
PMPrincipalComponentAnalysisServer >> initialize [
	super initialize.
	x := 0.
	y := 0
]

{ #category : #accessing }
PMPrincipalComponentAnalysisServer >> next [
	"Return a five elements array"
	
	x := x + 1.
	y := y - 2.
   ^ { x . y + x . x - y . y . x * y} 

	
]
