Class {
	#name : #NumbersExtensionsTest,
	#superclass : #TestCase,
	#category : 'Math-Numbers-Extensions'
}

{ #category : #tests }
NumbersExtensionsTest >> testArTanh [
	self assert: 0 arTanh equals: 0.0 arTanh.
	self assert: 1 arTanh isFloat.
	self assert: 1 arTanh = 1.0 arTanh
]

{ #category : #tests }
NumbersExtensionsTest >> testSinc [
	"test cardinal sine"

	self assert: 0 sinc equals: 1.
	self assert: 0 sinc isInteger.
	self assert: 0.0 sinc isFloat.
	self assert: (Float pi sinc equalsTo: 0.0)
]
