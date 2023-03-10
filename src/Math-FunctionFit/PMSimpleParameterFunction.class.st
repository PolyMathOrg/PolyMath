"
SimpleParameterFunction is used internally by FunctionFit . it is essentially a wrapper around a block, which is used as a function with parameters. the independent variable has to be declared first in the block, then the parameters.
"
Class {
	#name : #PMSimpleParameterFunction,
	#superclass : #Object,
	#instVars : [
		'usedVars',
		'function',
		'varArray'
	],
	#category : #'Math-FunctionFit'
}

{ #category : #'instance creation' }
PMSimpleParameterFunction class >> function: aBlock [
^self new function: aBlock
]

{ #category : #'instance creation' }
PMSimpleParameterFunction class >> function: aBlock parameters: anArray [
^self new function: aBlock; parameters: anArray; yourself
]

{ #category : #accessing }
PMSimpleParameterFunction >> changeParametersBy: aVector [
2 to: (usedVars+1) do:[:n| varArray at: n put: ((varArray at: n)+ ( aVector at: n-1)).]
]

{ #category : #initialization }
PMSimpleParameterFunction >> function: aBlock [
"also initializes the parameters"
function:=aBlock.
usedVars :=aBlock numArgs .
self initializeVarArray: 2.
usedVars :=usedVars -1
]

{ #category : #initialization }
PMSimpleParameterFunction >> initializeVarArray: aStart [
varArray :=Array new: usedVars  withAll: 0.937.
(1 + aStart) to: (usedVars min: (aStart +4)) do:[:i| varArray at: i put: ( #(0.929 0.919 0.911 0.907) at: (i - aStart ) )]
]

{ #category : #accessing }
PMSimpleParameterFunction >> parameterNames [
^(function argumentNames collect:[:s| s asString ])allButFirst
]

{ #category : #accessing }
PMSimpleParameterFunction >> parameterSize [
^usedVars
]

{ #category : #accessing }
PMSimpleParameterFunction >> parameters [
^varArray allButFirst
]

{ #category : #accessing }
PMSimpleParameterFunction >> parameters: indexableCollection [
1 to: usedVars do:[:n| varArray at: n+1 put: ( indexableCollection at: n)].
^indexableCollection
]

{ #category : #printing }
PMSimpleParameterFunction >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '( '; print: function .
	varArray ifNotNil:[ self parameterNames with: self parameters do:
		[:n :p|aStream nextPutAll: ' '; nextPutAll: n; nextPutAll:': ';print: p. ]] .
	aStream nextPut: $).
]

{ #category : #evaluating }
PMSimpleParameterFunction >> value: aNumber [
varArray at:1 put: aNumber .
^[function valueWithArguments: varArray ]on: Error do: [ Float nan ]
]

{ #category : #evaluating }
PMSimpleParameterFunction >> valueAndGradient: aNumber [
"the original unchanged approximatedValueAndGradient: "
	| delta parameters dp gradient n |
	parameters := self parameters.
	n := parameters size.
	dp := self value: aNumber.
	delta := Array new: n.
	delta atAllPut: 0.
	gradient := PMVector new: n.
	1 to: n do:
		[ :k |
		  delta at: k put: ( parameters at: k) * 0.0001.
		  self changeParametersBy: delta.
		  gradient at: k put: ( ( ( self value: aNumber) - dp) / ( delta at: k)).
		  delta at: k put: ( delta at: k ) negated.
		  k > 1
			ifTrue: [ delta at: ( k - 1) put: 0].
		].
	self changeParametersBy: delta.
	^Array with: dp with: gradient
]
