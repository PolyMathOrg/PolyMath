Class {
	#name : #PMHillClimbingOptimizer,
	#superclass : #PMFunctionOptimizer,
	#instVars : [
		'unidimensionalFinder'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #initialization }
PMHillClimbingOptimizer >> computeInitialValues [
	unidimensionalFinder := PMOneVariableFunctionOptimizer forOptimizer: self.
	unidimensionalFinder desiredPrecision: desiredPrecision.
	bestPoints := ( 1 to: result size)
							collect: [ :n |
									   ( PMVectorProjectedFunction function: functionBlock)
											direction: ( ( PMVector new: result size)
															atAllPut: 0;
															at: n put: 1;
															yourself);
											yourself
									 ].
]

{ #category : #operation }
PMHillClimbingOptimizer >> evaluateIteration [
	| oldResult |
	precision := 1.0.
	bestPoints inject: result
				 into: [ :prev :each | ( self minimizeDirection: each from: prev)].
	self shiftDirections.
	self minimizeDirection: bestPoints last.
	oldResult := result.
	result := bestPoints last origin.
	precision := 0.0.
	result with: oldResult do:
		[ :x0 :x1 |
		  precision := ( self precisionOf: (x0 - x1) abs relativeTo: x0 abs) max: precision.
		].
	^precision
]

{ #category : #operation }
PMHillClimbingOptimizer >> finalizeIterations [

]

{ #category : #operation }
PMHillClimbingOptimizer >> minimizeDirection: aVectorFunction [ 
	"Private"
	^unidimensionalFinder
		reset;
		setFunction: aVectorFunction;
		addPointAt: 0;
		addPointAt: precision;
		addPointAt: precision negated;
		evaluate
]

{ #category : #operation }
PMHillClimbingOptimizer >> minimizeDirection: aVectorFunction from: aVector [ 
	"Private"

	^aVectorFunction
		origin: aVector;
		argumentWith: ( self minimizeDirection: aVectorFunction)
]

{ #category : #operation }
PMHillClimbingOptimizer >> shiftDirections [
		"Private"
	| position delta firstDirection |
	firstDirection := bestPoints first direction.
	bestPoints inject: nil
					into: [ :prev :each |
							position isNil
								ifTrue: [ position := each origin]
								ifFalse:[ prev direction: each direction].
							each
							].
	position := bestPoints last origin - position.
	delta := position norm.
	delta > desiredPrecision
		ifTrue: [ bestPoints last direction: (position scaleBy: (1 / delta))]
		ifFalse:[ bestPoints last direction: firstDirection]
]
