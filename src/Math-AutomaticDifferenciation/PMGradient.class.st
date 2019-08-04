"
Computes the gradient of a function of a Collection of Numbers.

Example: f(x,y)=x^2 * y
g := PMGradient of:[:x|x first squared * x second].
g value:#(3 2). ""-->#(12 9)"" 
g value:#(1 1). ""-->#(2 1)"" 

"
Class {
	#name : #PMGradient,
	#superclass : #Object,
	#instVars : [
		'function'
	],
	#category : #'Math-AutomaticDifferenciation'
}

{ #category : #'instance creation' }
PMGradient class >> of: aNumericalBlock [
^self new function: aNumericalBlock
]

{ #category : #accessing }
PMGradient >> function: aBlock [
	"aBlock must accept an Array as argument"
	function := aBlock
]

{ #category : #printing }
PMGradient >> printOn: aStream [ 
	aStream
		nextPutAll: self class name;
		nextPutAll: ' of: ' ;
		print: function 
]

{ #category : #accessing }
PMGradient >> value: anArray [
	| dualValueTemplate dualValue |
	dualValueTemplate := anArray collect: [ :i | PMDualNumber value: i ].
	^ (1 to: anArray size)
		collect: [ :i | 
			dualValue := dualValueTemplate deepCopy.
			(dualValue at: i) eps: 1.
			(function value: dualValue) eps ]
		as: anArray class
]
