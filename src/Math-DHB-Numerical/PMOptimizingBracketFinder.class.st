Class {
	#name : #PMOptimizingBracketFinder,
	#superclass : #PMOneVariableFunctionOptimizer,
	#category : 'Math-DHB-Numerical'
}

{ #category : #creation }
PMOptimizingBracketFinder class >> initialPoints: aSortedCollection function: aFunction [
		"Private"
	^super new setInitialPoints: aSortedCollection; setFunction: aFunction
]

{ #category : #operation }
PMOptimizingBracketFinder >> computeInitialValues [
	[bestPoints size < 2] whileTrue: [self addPointAt: Number random]
]

{ #category : #operation }
PMOptimizingBracketFinder >> evaluateIteration [
	| x1 x2 |
	x1 := ( bestPoints at: 1) position.
	x2 := ( bestPoints at: 2) position.
	self addPointAt: ( x1 * 3 - ( x2 * 2)).
	precision := ( x2 - x1) * ( ( bestPoints at: 3) position - x1).
	self hasConverged
		ifFalse:[ bestPoints removeLast].
	^precision
]

{ #category : #operation }
PMOptimizingBracketFinder >> finalizeIterations [
	result := bestPoints
]

{ #category : #initialization }
PMOptimizingBracketFinder >> initializeForOptimizer: aFunctionOptimizer [
		"Private"
	super initializeForOptimizer: aFunctionOptimizer.
	bestPoints := aFunctionOptimizer bestPoints
]

{ #category : #initialization }
PMOptimizingBracketFinder >> setInitialPoints: aSortedCollection [
		"Private"
	bestPoints := aSortedCollection
]
