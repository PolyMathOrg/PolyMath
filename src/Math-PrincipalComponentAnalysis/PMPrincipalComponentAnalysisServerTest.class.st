Class {
	#name : #PMPrincipalComponentAnalysisServerTest,
	#superclass : #TestCase,
	#category : 'Math-PrincipalComponentAnalysis'
}

{ #category : #tests }
PMPrincipalComponentAnalysisServerTest >> testNext [
	| server |
	server := PMPrincipalComponentAnalysisServer new.
	self assert: server next equals: #(1 -1 3 -2 -2).
	self assert: server next equals: #(2 -2 6 -4 -8)
]
