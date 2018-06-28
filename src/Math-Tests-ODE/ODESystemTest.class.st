"
An ODESystemTest is a test class for testing the behavior of ODESystem
"
Class {
	#name : #ODESystemTest,
	#superclass : #TestCase,
	#instVars : [
		'sys'
	],
	#category : 'Math-Tests-ODE'
}

{ #category : #initialization }
ODESystemTest >> setUp [
	"create a dummy system"
	sys := ODESystem new
]

{ #category : #tests }
ODESystemTest >> testBlock [
	| aBlock |
	aBlock := [ :x :t | t ].
	sys block: aBlock.
	self assert: sys block equals: aBlock
]

{ #category : #tests }
ODESystemTest >> testVectorBlock [
	"this illustrates using a block that operates on a collection"

	| aBlock |
	aBlock := [ :x :t | x collect: [ :ea | t ] ].
	sys block: aBlock.
	self assert: sys block equals: aBlock
]

{ #category : #tests }
ODESystemTest >> testVectorXT [
	"a simple example of using a collection as state"

	| aBlock |
	aBlock := [ :x :t | x collect: [ :ea | t ] ].
	sys block: aBlock.
	self assert: (sys state: #(1 2 3) time: 2) equals: #(2 2 2).
	self assert: (sys state: #(0 0) time: 2) equals: #(2 2)
]

{ #category : #tests }
ODESystemTest >> testXT [
	| aBlock |
	aBlock := [ :x :t | t ].
	sys block: aBlock.
	self assert: (sys state: 1 time: 2) equals: 2.
	self assert: (sys state: 0 time: 2) equals: 2
]
