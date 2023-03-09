Class {
	#name : #PMODEBenchmark,
	#superclass : #SMarkSuite,
	#instVars : [
		'dt',
		'function',
		'startState',
		'startTime',
		'endTime'
	],
	#category : #'Math-Benchmarks-ODE'
}

{ #category : #'as yet unclassified' }
PMODEBenchmark class >> defaultProblemSize [
	^200
]

{ #category : #'as yet unclassified' }
PMODEBenchmark class >> runAll: numOfIterations [
	^ ((self withAllSubclasses collect: [ :suite |
		suite run: numOfIterations]) do: [ :suiteResult |
			suiteResult  results removeKey: #baseBenchmark ]) reject: [ :runner |
				runner results isEmpty ]
]

{ #category : #'as yet unclassified' }
PMODEBenchmark class >> runAllToString: numOfIterations [
	^ (self runAll: numOfIterations) joinUsing: Character cr
]

{ #category : #'as yet unclassified' }
PMODEBenchmark class >> runAllToXML: numOfIterations [
	| writer |
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml.
	writer tag: 'smark' with: [
		(self runAll: numOfIterations) do: [ :runner |
			writer tag: 'suite' attributes: (Dictionary with: #name -> runner suite class name asString) with: [
				runner results keysAndValuesDo: [ :key :value |
					writer tag: key with: ((value inject: 0 into: [ :subTotal :result |
								subTotal + result total ]) / value size) asFloat asString] ] ] ].

	^ writer
]

{ #category : #running }
PMODEBenchmark >> baseBenchmark [
	1 to: self problemSize do: [ :i |
		self nil ]
]

{ #category : #running }
PMODEBenchmark >> nil [
]

{ #category : #running }
PMODEBenchmark >> setUp [
	dt := 0.09.
	function :=  [:x :t | (t ** 4) * (t sin ** (2 * t cos)) * ( (2 * t negated) * (2 * t sin) * (t sin log) +
		t * (2 * t cos) * (t tan reciprocal) + 5)].
	startState := 0.
	startTime := 0.3 .
	endTime := Float halfPi
]
