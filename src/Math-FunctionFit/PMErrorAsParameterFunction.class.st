"
ErrorAsParameterFunction is used internally by ErrorMinimizer. it is essentially a wrapper around an ErrorOfParameterFunction .
"
Class {
	#name : #PMErrorAsParameterFunction,
	#superclass : #PMSimpleParameterFunction,
	#category : #'Math-FunctionFit'
}

{ #category : #accessing }
PMErrorAsParameterFunction >> changeParametersBy: aVector [
varArray :=varArray + aVector .
]

{ #category : #initialization }
PMErrorAsParameterFunction >> function: anErrorOfParameterFunction [
|d f size steps|
d :=anErrorOfParameterFunction data.
usedVars :=anErrorOfParameterFunction parameterSize .
self initializeVarArray: 1.
size:=d size sqrt ceiling .
steps:=d size // (usedVars +1).
size :=size +steps //2.
size := size min: steps.
steps :=d size //size -1.
steps <usedVars ifTrue:[self error: 'dataSize too small for the parameterSize'].
function := (0 to: steps)collect: [:i| 
	f:=anErrorOfParameterFunction copy.
	f data: (d copyFrom:( i *size+1) to:( i=steps ifTrue: [d size] ifFalse: [(i+1) *size])).
	f]
]

{ #category : #accessing }
PMErrorAsParameterFunction >> maxFunction [
	"The number of data partitions used. The highest number that can be send to #value:"

	^ function ifNil: [ 0 ] ifNotNil: [ :f | f size ]
]

{ #category : #accessing }
PMErrorAsParameterFunction >> parameters [
^varArray 
]

{ #category : #accessing }
PMErrorAsParameterFunction >> parameters: indexableCollection [
^varArray :=indexableCollection copy.

]

{ #category : #printing }
PMErrorAsParameterFunction >> printOn: aStream [

	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name;
		nextPutAll: '( function: ';
		print: (function ifNotNil: [ :f | f first ]);
		nextPutAll: ' maxFunction: ';
		print: self maxFunction.
	varArray ifNotNil: [
		aStream
			nextPutAll: ' parameters: ';
			print: self parameters ].
	aStream nextPut: $)
]

{ #category : #evaluating }
PMErrorAsParameterFunction >> value: aNumber [
"aNumber chooses the data partition. it can run from 1 to maxFunction."
^(function at: aNumber) value: varArray 
]
