"
ErrorOfParameterFunction wants a function with parameters as a block and a Collection of x@f(x) points. The independent variable has to be declared first in the block, then the parameters.
ErrorOfParameterFunction>>value: anArrayOfParameters returns a sum of squared errors or similar error measures. it can be used in MultiVariableOptimizers to calculate parameters.
"
Class {
	#name : #PMErrorOfParameterFunction,
	#superclass : #Object,
	#instVars : [
		'data',
		'function',
		'errorType',
		'varArray',
		'quartile',
		'qPosition',
		'relative'
	],
	#category : #'Math-FunctionFit'
}

{ #category : #'instance creation' }
PMErrorOfParameterFunction class >> function: aBlock data: aCollectionOfPoints [
^self new function: aBlock; data: aCollectionOfPoints; yourself
]

{ #category : #accessing }
PMErrorOfParameterFunction >> data [
^data
]

{ #category : #accessing }
PMErrorOfParameterFunction >> data: aCollectionOfPoints [
"a collection of points x@f(x)"
(aCollectionOfPoints isCollection and: [aCollectionOfPoints allSatisfy: [:aPoint| aPoint isPoint]]) ifFalse:
	[self error: 'data must be a Collection of Points'].
aCollectionOfPoints ifEmpty: [CollectionIsEmpty signalWith: aCollectionOfPoints].
data := aCollectionOfPoints .
quartile ifNotNil:[ self quartile: quartile] .
^data
]

{ #category : #accessing }
PMErrorOfParameterFunction >> errorCollection: parameters [
"returns a collection of squared errors or of abs errors"
"this is used often and should and could be a bit optimized"
	|y y1|
	parameters withIndexDo: [ :p :i | varArray at: i + 1 put: p ].
	^data
		collect: [ :point |
			| err|
			varArray at: 1 put: point x.
			y := point y.
			y1 :=function valueWithArguments: varArray.
			err :=y1-y.
			relative
				ifTrue: [
					err := ((y1 = 0)or:[y=0])
						ifTrue: [ (y=y1) ifTrue: [0] ifFalse: [1]]
						ifFalse: [ errorType = #squared
							ifTrue: [ err squared / y1 abs  + (err squared  /y abs) / 2] 	"this looks even more stupid than the rest of the 'relative ifTrue:' code, but it is necessary to do it this way because of the possible bias"
							ifFalse: [(err / y)abs +(err /y1)abs /2 ] ] ]
				ifFalse:[ errorType = #squared
					ifTrue: [ err squared ]
					ifFalse: [ err abs ] ]]
]

{ #category : #accessing }
PMErrorOfParameterFunction >> errorType [
^errorType
]

{ #category : #accessing }
PMErrorOfParameterFunction >> errorType: aSymbol [
"valid errorTypes are: #squared, #abs, #insensitive, #quartile, #median. Default is #squared"
(aSymbol isSymbol and:[#(#squared #abs #insensitive #quartile #median) includes: aSymbol]) ifFalse:
	[^MessageNotUnderstood signal: 'errorType must be one of the following Symbols: #squared, #abs, #insensitive, #quartile, #median'].
(#(#quartile #insensitive) includes: aSymbol)ifFalse: [self quartile: 1/2].	"reset quartile to default, if it is not used"
aSymbol =#median ifTrue: [^errorType :=#quartile] .
^errorType :=aSymbol
]

{ #category : #accessing }
PMErrorOfParameterFunction >> function [
^function
]

{ #category : #accessing }
PMErrorOfParameterFunction >> function: aBlock [
function :=aBlock .
varArray :=Array new: aBlock numArgs
]

{ #category : #initialization }
PMErrorOfParameterFunction >> initialize [
super initialize .
relative :=false.
errorType :=#squared.
quartile:= 1/2
]

{ #category : #accessing }
PMErrorOfParameterFunction >> parameterNames [
^(function argumentNames collect:[:s| s asString ])allButFirst
]

{ #category : #accessing }
PMErrorOfParameterFunction >> parameterSize [
^varArray size -1
]

{ #category : #printing }
PMErrorOfParameterFunction >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( function: '; print: function;
		nextPutAll: ' relativeError: '; print: relative;
		nextPutAll: ' errorType: '; print: errorType.
	(#(#quartile #insensitive) includes: errorType)ifTrue:[
		aStream nextPutAll: ' withQuartile: '; print: quartile].
	aStream nextPut: $).
]

{ #category : #accessing }
PMErrorOfParameterFunction >> quartile [
^quartile
]

{ #category : #accessing }
PMErrorOfParameterFunction >> quartile: aFloat [
"quartile: is used by errortypes #quartile and #insensitive."
aFloat >1 | (aFloat <0) ifTrue:[^DomainError signal:'quartile must be between 0 and 1'].
data ifNotNil: [qPosition :=(data size -1.00001 * aFloat )rounded+1]. "-1.00001 because x.5 is rounded up to x+1 and pharos median rounds the position down"
^quartile := aFloat
]

{ #category : #evaluating }
PMErrorOfParameterFunction >> realValue: parameters [
"returns the sqrt of the mean of the sum of squared errors, or the mean abs error, or the quartile error, or the insensitive error"
|e|
e:=self value: parameters .
(#(#insensitive #quartile) includes: errorType) ifFalse: [e :=e / data size] .
errorType = #squared ifTrue: [e := e sqrt]  . "if relativeError=true this is not really correct at the moment because of the way value: is calculated, but value: cant be changed! if anything, the calc here could be changed."
^e
]

{ #category : #accessing }
PMErrorOfParameterFunction >> relativeError: aBoolean [
" default is false"
^relative :=aBoolean
]

{ #category : #evaluating }
PMErrorOfParameterFunction >> value: parameters [
	"returns the sum of squared errors, or the sum of abs errors, or the quartile error. insensitive is an experimental quartile error that centers a tube around its quartile and returns the (estimated) radius of the tube like quartile"

	| e|
	e := self errorCollection: parameters .
	errorType = #quartile
		ifTrue: [ ^ e asSortedCollection at: qPosition ]
		ifFalse: [
			errorType = #insensitive
				ifTrue: [
					e := e asSortedCollection copyFrom: 1 to: (qPosition + 1 min: e size).
					e := e asOrderedCollection reverse withIndexCollect: [ :v :i | v / (2 raisedToInteger: i) ] ] ].
	^ e sum
]
