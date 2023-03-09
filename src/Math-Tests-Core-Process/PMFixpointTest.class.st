Class {
	#name : #PMFixpointTest,
	#superclass : #TestCase,
	#instVars : [
		'fp'
	],
	#category : #'Math-Tests-Core-Process'
}

{ #category : #running }
PMFixpointTest >> setUp [
fp:=PMFixpoint new.
fp verbose: false
]

{ #category : #tests }
PMFixpointTest >> testBug [
	fp
		block: [ :x |
			x < 64
				ifTrue: [ x bitShift: 2 ]
				ifFalse: [ 1 ] ];
		value: 70.
	fp evaluate.
	self assert: fp cycleLength equals: 4.
	self assert: fp cycle equals: #(1 4 16 64).
	self assert: fp iterations equals: 5.
	self assert: fp hasConverged.
	fp value: 3.
	fp evaluate.
	"results begin this way: 3 12 48 192 1 4 16 64 1 4 ...."
	self assert: fp cycleLength equals: 4.
	self assert: fp cycle equals: #(1 4 16 64).
	self assert: fp iterations equals: 8.
	self assert: fp hasConverged
]

{ #category : #tests }
PMFixpointTest >> testCheckForLongerCycles [
	fp := PMFixpoint
		block: [ :x |
			| d |
			d := x - 1.
			d < -2
				ifTrue: [ d := 0.0 ].
			d ]
		value: 20.0.
	self assert: fp cycleLength isNil.
	self assert: fp evaluate equals: 0.
	self assert: fp iterations equals: 23.
	self assert: fp hasConverged.
	self assert: fp cycleLength equals: 3.
	self assert: fp cycle equals: #(0 -1 -2).
	fp maximumIterations: 10.
	fp value: 11.0.
	fp evaluate.
	self deny: fp hasConverged.
	self assert: fp cycleLength isNil.
	self assert: fp cycle equals: #()
]

{ #category : #tests }
PMFixpointTest >> testCheckStrongEquality [
	fp
		block: [ :x |
			| d |
			d := x - 1.
			d < -2
				ifTrue: [ d := 2 ].
			d ].	"can return an Integer!"
	fp value: 2.0.	"aFloat"
	fp evaluate.
	self assert: fp iterations equals: 10.	"first 4 Floats, then 5 integers, the a repeat"
	self assert: fp hasConverged.
	self assert: fp cycleLength equals: 5
]

{ #category : #tests }
PMFixpointTest >> testEqualityTest [
	fp
		block: [ :x |
			| d |
			d := x - 1.
			d < -2
				ifTrue: [ d := 2 ].
			d ].	"can return an Integer!"
	fp equalityTest: [ :x :y | x = y ].
	fp value: 2.0.
	fp evaluate.
	self assert: fp cycleLength equals: 5.
	fp equalityTest: [ :x :y | x = 0 or: [ y = 0 ] ].
	fp value: 2.0.
	fp evaluate.
	self assert: fp iterations equals: 2.
	self assert: fp cycleLength equals: 1
]

{ #category : #tests }
PMFixpointTest >> testRest [

	fp := PMFixpoint block: [ :x | 1 / (1 + x) ] value: 20.0.
	self assert: fp cycle equals: #(  ).
	self assert: (fp evaluate closeTo: 0.6180339887).
	fp verbose: false.
	self assert: fp cycle size equals: 1.
	self assert: fp hasConverged.
	self assert: fp cycleLength equals: 1.
	fp evaluate.
	self assert: fp iterations equals: 1.
	self assert: fp hasConverged.
	fp block: [ :x | x asString ].
	self assert: (fp evaluate beginsWith: '0.618').
	self assert: fp iterations equals: 2.
	self assert: fp hasConverged
]

{ #category : #tests }
PMFixpointTest >> testTooShortCalc [
	fp block: [ :x | 1 / (1 + x) ].
	fp value: 60.0.
	fp maximumIterations: 10.
	fp evaluate.
	self assert: fp cycle equals: #().
	self assert: fp cycleLength isNil.
	self assert: fp iterations equals: 10.
	self deny: fp hasConverged
]
