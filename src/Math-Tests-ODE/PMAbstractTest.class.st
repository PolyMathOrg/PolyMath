Class {
	#name : 'PMAbstractTest',
	#superclass : 'TestCase',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'testing' }
PMAbstractTest class >> isAbstract [

    ^ self name == #PMAbstractTest
]

{ #category : 'asserting' }
PMAbstractTest >> assert: actualNumber closeTo: expectedNumber [

    self assert: actualNumber closeTo: expectedNumber precision: 0.001
]
