"
PMHillClimbingOptimizer is a class implementing the Powell's algorithm. Powell's algorithm is one of many hill climbing algorithms.
The idea underlying Powell’s algorithm is that once an optimum has been found in one direction, the chance for the biggest improvement lies in the direction perpendicular to that direction.

It has only one additional instance variable, unidimensionalFinder to hold the one-dimensional
optimizer used to find an optimum of the goal function along a given direction.
"
Class {
	#name : #PMHillClimbingOptimizer,
	#superclass : #PMFunctionOptimizer,
	#instVars : [
		'unidimensionalFinder'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #examples }
PMHillClimbingOptimizer class >> example1 [
	| fBlock educatedGuess hillClimber result |
	fBlock := [ :v | 
	| x y |
	x := v at: 1.
	y := v at: 2.
	((2 - x) * (2 - x)) negated + ((2 - y) * (2 - y)) negated ].
	educatedGuess := #(100 100) asPMVector.
	hillClimber := self maximizingFunction: fBlock.
	hillClimber initialValue: educatedGuess.
	result := hillClimber evaluate.
	^ result inspect
]

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

	^aVectorFunction
		origin: aVector;
		argumentWith: ( self minimizeDirection: aVectorFunction)
]

{ #category : #operation }
PMHillClimbingOptimizer >> shiftDirections [
	| position delta firstDirection |
	firstDirection := bestPoints first direction.
	bestPoints
		inject: nil
		into: [ :prev :each | 
			position
				ifNil: [ position := each origin ]
				ifNotNil: [ prev direction: each direction ].
			each ].
	position := bestPoints last origin - position.
	delta := position norm.
	delta > desiredPrecision
		ifTrue: [ bestPoints last direction: (position scaleBy: 1 / delta) ]
		ifFalse: [ bestPoints last direction: firstDirection ]
]
