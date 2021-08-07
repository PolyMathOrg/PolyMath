Class {
	#name : #PMErrorAsParameterFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'f'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMErrorAsParameterFunctionTest >> setUp [

	| col |
	f := PMErrorOfParameterFunction new function: [ :x :a :b | 
		     a * x / (b + x) ].
	col := (1 to: 3) collect: [ :i | 
		       i @ (f function cull: i cull: 1 cull: 1) ].
	f data: col.
	f := PMErrorAsParameterFunction new function: f
]

{ #category : #tests }
PMErrorAsParameterFunctionTest >> testMaxFunction [
self assert: (f parameters size < f maxFunction ).

]

{ #category : #tests }
PMErrorAsParameterFunctionTest >> testPrint [

	| aStream s |
	aStream := ReadWriteStream with: ''.
	f printOn: aStream.
	s := aStream contents.
	self assert: (s includesSubstring: 'a * x / (b + x)').
	self assert: (s includesSubstring: '#squared').
	self assert:
		(s includesSubstring: 'maxFunction: ' , f maxFunction asString)
]

{ #category : #tests }
PMErrorAsParameterFunctionTest >> testparameters [
	f parameters: #(1 1).
	f changeParametersBy: #(1 1).
	self assert: f parameters equals: #(2 2)
]

{ #category : #tests }
PMErrorAsParameterFunctionTest >> testvalue [
	f parameters: #(2 2).
	self assert: (f value: 2) equals: 1 / 9
]
