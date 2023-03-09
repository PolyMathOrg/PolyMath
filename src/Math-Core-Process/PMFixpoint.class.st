"
`PMFixpoint` is just a little utility. It calculates the fixpoint of a block with one variable. A starting value for the variable is necessary. The variable does not need to be numerical, it can be anything the block can eat and spit out.

Example:

```
| a |
a := PMFixpoint block: [:x| 1/(1+x)] value: 20.0.
a evaluate
```
"
Class {
	#name : #PMFixpoint,
	#superclass : #PMIterativeProcess,
	#instVars : [
		'cycleFlag',
		'result2',
		'result1',
		'results',
		'block',
		'verbose',
		'equalityTest'
	],
	#category : #'Math-Core-Process'
}

{ #category : #'instance creation' }
PMFixpoint class >> block: aBlock value: anObject [
^self new block: aBlock ;value: anObject; yourself
]

{ #category : #information }
PMFixpoint class >> defaultMaximumIterations [
	^200
]

{ #category : #information }
PMFixpoint class >> defaultVerbose [
	^true
]

{ #category : #private }
PMFixpoint >> adjustIteratorFor: aCycleLength [
1 to: results size do:[:i| |last| last:=i + aCycleLength.
	(equalityTest
		ifNil: [(results at:i)literalEqual:(results at:last)]
		ifNotNil:[:t|(t value: (results at:i) value: (results at:last))])
			ifTrue: [	result1 :=result.
						^iterations :=last - 1]]
]

{ #category : #accessing }
PMFixpoint >> block: aBlock [
^block := aBlock
]

{ #category : #accessing }
PMFixpoint >> cycle [
	| length |
	length := self cycleLength ifNil: [ ^ #() ].
	^ (results copyFrom: iterations + 1 - length to: iterations) asArray
]

{ #category : #printing }
PMFixpoint >> cycleInfo: cycleLength [
verbose ifFalse: [ ^self ].
GrowlMorph
			openWithLabel: 'Info'
			contents: ('{1} iterations used.
warning: {2}-cycle detected' format: (Array with: iterations with: cycleLength))
			color: Color gray muchDarker
]

{ #category : #private }
PMFixpoint >> cycleLength [
"returns nil - not zero -, if no cycle exists"
|c|
results ifNil:[^nil].
c:=(results copyFrom: 1 to: results size -1)reversed.
c withIndexDo:[:r :i|(equalityTest
	ifNil: [(result literalEqual: r)]
	ifNotNil:[:t|(t value: result value: r)])
		ifTrue:[^i]].
^nil
]

{ #category : #accessing }
PMFixpoint >> equalityTest: aBlock [
"you can set your own equality test to decide when the fixpoint is reached"
self assert: aBlock argumentCount=2.
^equalityTest:=aBlock
]

{ #category : #operation }
PMFixpoint >> evaluateIteration [
cycleFlag 	ifTrue: [result1:=result]
				ifFalse:[result2:=result].
cycleFlag :=cycleFlag not.
result := block value: result copy .
^results add:result
]

{ #category : #operation }
PMFixpoint >> finalizeIterations [
	self hasConverged
		ifTrue: [ (cycleFlag
				ifTrue: [ result = result1 and: [ result ~= result2 ] ]
				ifFalse: [ result = result2 and: [ result ~= result1 ] ])
				ifTrue: [ self cycleInfo: 2 ]
				ifFalse: [ self simpleInfo ] ]
		ifFalse: [ self cycleLength
				ifNil: [ self unfinishedInfo ]
				ifNotNil: [ :x |
					self adjustIteratorFor: x.
					self cycleInfo: x ] ]
]

{ #category : #information }
PMFixpoint >> hasConverged [
^equalityTest
	ifNil: [(result literalEqual: result1) or: [result literalEqual: result2]]
	ifNotNil: [:t|(t value: result value: result1)or:[t value: result value: result2]]
]

{ #category : #initialization }
PMFixpoint >> initialize [
verbose := self class defaultVerbose .
^super initialize
]

{ #category : #operation }
PMFixpoint >> initializeIterations [
	"cycleFlag & result1 & result2 are used, so that 2-cycles are immediately found (with correct iteration number!)"

	cycleFlag := true.
	result1 := result.
	result2 := result.
	(results := OrderedCollection new: maximumIterations + 1) add: result
]

{ #category : #printing }
PMFixpoint >> printOn: aStream [
	super printOn: aStream .
	aStream nextPut: $(.
	block printOn: aStream .
	aStream nextPutAll: ' value: ' .
	result printOn: aStream.
	aStream nextPut: $)
]

{ #category : #printing }
PMFixpoint >> simpleInfo [
verbose ifFalse: [ ^self ].
GrowlMorph
			openWithLabel: 'Info'
			contents: ('{1} iterations needed.' format: (Array with: iterations))
			color: Color green muchDarker
]

{ #category : #printing }
PMFixpoint >> unfinishedInfo [
verbose ifFalse: [ ^self ].
GrowlMorph
			openWithLabel: 'Warning'
			contents: ('maximumIterations ({1}) reached.
you can run evaluate a second time' format: (Array with: maximumIterations))
			color: Color orange darker
]

{ #category : #accessing }
PMFixpoint >> value: aStartingValue [
"the value, that will be fed at first to the block when evaluating"
^result:=aStartingValue
]

{ #category : #accessing }
PMFixpoint >> verbose: aBoolean [
"decides whether info should be delivered via GrowlMorphs. by default true"
^verbose:=aBoolean
]
