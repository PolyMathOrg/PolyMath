Class {
	#name : #SimpleParameterFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'f'
	],
	#category : 'Math-Tests-FunctionFit'
}

{ #category : #running }
SimpleParameterFunctionTest >> setUp [
	f:=[:a :x :cc :b|x].
]

{ #category : #tests }
SimpleParameterFunctionTest >> testChangeParametersBy [
	| s |
	s := PMSimpleParameterFunction function: f parameters: #(1 1 2).
	s changeParametersBy: #(3 2 1).
	self assert: s parameters equals: #(4 3 3)
]

{ #category : #tests }
SimpleParameterFunctionTest >> testParameterNames [
	| s |
	s := PMSimpleParameterFunction function: f.
	self assert: s parameterNames asArray equals: #('x' 'cc' 'b')
]

{ #category : #tests }
SimpleParameterFunctionTest >> testPrint [
|aStream s|
aStream :=ReadWriteStream with:''.
s:=PMSimpleParameterFunction function:f parameters: #(1 2 3).
s printOn: aStream .
s :=aStream contents .
self assert: ((s beginsWith: 'a PMSimpleParameterFunction')).
self assert: (s includesSubstring: '1').
self assert: (s includesSubstring: ' 2').
self assert: (s includesSubstring: ' 3').

]

{ #category : #tests }
SimpleParameterFunctionTest >> testRest [
	| s vg |
	s := PMSimpleParameterFunction function: f.
	self assert: s parameters size equals: 3.
	vg := s valueAndGradient: 2.
	self assert: s parameters first equals: vg first.
	self assert: (vg second equalsTo: #(1 0 0)).
	s parameters: #(2 0 0).
	self assert: (s value: 0) equals: 2.
	self assert: s parameters equals: #(2 0 0).
	self assert: s parameterSize equals: 3
]
