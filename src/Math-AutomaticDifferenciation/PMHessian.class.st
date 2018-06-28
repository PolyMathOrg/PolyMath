"
PMHessian calculates the hessian of a function of a SequentialCollection of Numbers as a PMSymmetricMatrix.  As a byproduct it also calculates the gradient.

Example: f(x,y)=x^2 * y
	h := PMHessian of:[:x|x first squared * x second].
	h value:#(3 2). ""-->
	a PMVector(4 6)
	a PMVector(6 0) ""
	h gradient ."" -->#(12 9)""
"
Class {
	#name : #PMHessian,
	#superclass : #Object,
	#instVars : [
		'function',
		'result',
		'gradient'
	],
	#category : 'Math-AutomaticDifferenciation'
}

{ #category : #'instance creation' }
PMHessian class >> of: aNumericalBlock [
^self new function: aNumericalBlock
]

{ #category : #accessing }
PMHessian >> function: aBlock [
"aBlock must accept an Array as argument"
	function := aBlock
]

{ #category : #accessing }
PMHessian >> gradient [
	^gradient
]

{ #category : #printing }
PMHessian >> printOn: aStream [ 
	aStream
		nextPutAll: self class name;
		nextPutAll: ' of: ' ;
		print: function 
]

{ #category : #accessing }
PMHessian >> result [
	^ result
]

{ #category : #accessing }
PMHessian >> value: anArray [
	| hDualValueTemplate hDualValue |
	gradient := Array new: anArray size.
	hDualValueTemplate := anArray collect: [ :i | PMHyperDualNumber value: i ].
	^ result := PMSymmetricMatrix
		new: anArray size
		function: [ :x :y | 
			| r |
			hDualValue := hDualValueTemplate deepCopy.
			x = y
				ifTrue: [ 
					(hDualValue at: x)
						eps: 1;
						eps2: 1 ]
				ifFalse: [ 
					(hDualValue at: x) eps: 1.
					(hDualValue at: y) eps2: 1 ].
			r := function value: hDualValue.
			x = y
				ifTrue: [ gradient at: x put: r eps ].
			r eps1eps2 ]
]
