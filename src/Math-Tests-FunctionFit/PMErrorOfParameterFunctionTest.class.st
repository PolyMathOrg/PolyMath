Class {
	#name : #PMErrorOfParameterFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'f',
		'col'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMErrorOfParameterFunctionTest >> setUp [
f:=PMErrorOfParameterFunction new function: [:x :a :b|a*x / (b+x)].
col:=(1 to: 3)collect: [:i|i@(f function cull: i cull: 1 cull: 1) ].

]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testArgumentsString [
	self assert: f parameterNames asOrderedCollection equals: #('a' 'b') asOrderedCollection
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testErrorCollection [
	f data: col.
	f errorType: #squared.
	self
		assert: (f errorCollection: #(0 1))
		equals:(Array with: (1 / 4) with: (4 / 9) with: (9 / 16)).
	f errorType: #abs.
	self
		assert: (f errorCollection: #(0 1))
		equals:(Array with: (1 / 2) with: (2 / 3) with: (3 / 4)).
	f errorType: #median.
	self assert: (f errorCollection: #(1 1)) equals: #(0 0 0)
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testErrorType [
	self assert: f errorType equals: #squared.
	f errorType: #abs.
	self assert: f errorType equals: #abs.
	self should: [ f errorType: #square ] raise: MessageNotUnderstood.
	self should: [ f errorType: 'squared' ] raise: MessageNotUnderstood.
	f quartile: 1 / 4.
	f errorType: #median.
	self assert: f errorType equals: #quartile.
	self assert: f quartile equals: 1 / 2
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testFunction [
	self assert: (f function cull: 1 cull: 2 cull: 3) equals: 1 / 2.
	self assert: f parameterSize equals: 2
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testPrint [
|aStream  s|
aStream :=ReadWriteStream with:''.
f data:(Array with: (1@(1/2)) with: (2@(2/3)) with: (3@(3/4))).
f printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'a * x / (b + x)').
self assert: (s includesSubstring: 'squared').
self assert: (s includesSubstring: 'false').


]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testQuartile [
	self assert: f quartile equals: 1 / 2.
	f quartile: 1.
	self assert: f quartile equals: 1.
	self should: [ f quartile: 2 ] raise: DomainError.
	self should: [ f quartile: -0.1 ] raise: DomainError
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testRealValue [
	f := PMErrorOfParameterFunction
		function: [ :i :a | i + a ]
		data: (Array with: 1 @ 1 with: 2 @ 2).
	f errorType: #squared.
	self assert: (f realValue: #(-2)) equals: 2.
	f errorType: #abs.
	self assert: (f realValue: #(-2)) equals: 2.
	f errorType: #median.
	self assert: (f realValue: #(-2)) equals: 2.
	f relativeError: true.
	f errorType: #squared.
	self assert: (f realValue: #(-2)) equals: (5 / 2) sqrt.
	f errorType: #abs.
	self assert: (f realValue: #(-2)) equals: 3 / 2.
	f errorType: #median.
	self assert: (f realValue: #(-2)) equals: 1
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testdata [
	self assert: f data isNil.
	f data: col.
	self assert: f data equals: col
]

{ #category : #tests }
PMErrorOfParameterFunctionTest >> testvalue [
	f data: col.
	f errorType: #squared.
	self assert: (f value: #(0 1)) equals: 181 / 144.
	f errorType: #abs.
	self assert: (f value: #(0 1)) equals: 23 / 12.
	f errorType: #median.
	self assert: (f value: #(0 1)) equals: 2 / 3.
	f data: (col copyFrom: 1 to: 2).
	self assert: (f value: #(0 1)) equals: 1 / 2.
	f quartile: 1.
	self assert: (f value: #(0 1)) equals: 2 / 3.
	f quartile: 0.
	self assert: (f value: #(0 1)) equals: 1 / 2.
	f errorType: #squared.
	self assert: (f realValue: #(0 0)) equals: (25 / 72) sqrt
]
