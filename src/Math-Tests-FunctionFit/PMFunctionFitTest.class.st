Class {
	#name : #PMFunctionFitTest,
	#superclass : #TestCase,
	#instVars : [
		'f',
		'd'
	],
	#category : #'Math-Tests-FunctionFit'
}

{ #category : #running }
PMFunctionFitTest >> setUp [ 
f:=[:x :a :b|a*x / (b+x)].
d:=(1 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].
]

{ #category : #tests }
PMFunctionFitTest >> testFunctionFit [
	| ff ar p |
	ff := PMFunctionFit function: f data: d.
	ar := ff parameters.
	ar
		do: [ :i | 
			self assert: i isNumber.
			self assert: i ~= 0 ].
	ff parameters: #(1 2).
	self assert: ff parameters equals: #(1 2).
	p := PMWeightedPoint point: -2 @ 1.
	self shouldnt: [ ff accumulate: p ] raise: Error.	"function result will be NaN and should be ignored in the following calculations"
	ff parameters: ar.
	ff evaluate.
	self assert: (ff parameters equalsTo: #(2 0.4))
]

{ #category : #tests }
PMFunctionFitTest >> testPrint [
|aStream ff s|
aStream :=ReadWriteStream with:''.
ff:=  PMFunctionFit function: f data: d .
ff printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'a * x / (b + x)').
self assert: (s includesSubstring: '20').


]
