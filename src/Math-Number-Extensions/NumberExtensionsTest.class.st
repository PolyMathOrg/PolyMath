Class {
	#name : #NumberExtensionsTest,
	#superclass : #TestCase,
	#category : #'Math-Number-Extensions'
}

{ #category : #tests }
NumberExtensionsTest >> testArTanh [
	self assert: 0 arTanh = 0.0 arTanh.
	self assert: 1 arTanh isFloat.
	self assert: 1 arTanh equals: 1.0 arTanh
]

{ #category : #tests }
NumberExtensionsTest >> testSinc [
	"test cardinal sine"

	self assert: 0 sinc equals: 1.
	self assert: 0 sinc isInteger.
	self assert: 0.0 sinc isFloat.
	self assert: (Float pi sinc equalsTo: 0.0)
]
