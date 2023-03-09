Class {
	#name : #PMSimplexOptimizer,
	#superclass : #PMFunctionOptimizer,
	#instVars : [
		'worstVector'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMSimplexOptimizer class >> defaultPrecision [
	"Private"

	^ Float machineEpsilon * 1000
]

{ #category : #operation }
PMSimplexOptimizer >> buildInitialSimplex [
	"Private"

	| projectedFunction finder partialResult |
	projectedFunction := PMProjectedOneVariableFunction 
				function: functionBlock.
	finder := PMOneVariableFunctionOptimizer forOptimizer: self.
	finder setFunction: projectedFunction.
	[bestPoints size < (result size + 1)] whileTrue: 
			[projectedFunction
				setArgument: result;
				bumpIndex.
			partialResult := finder
						reset;
						evaluate.
			bestPoints add: (optimizingPointClass 
						vector: (projectedFunction argumentWith: partialResult)
						function: functionBlock)]
]

{ #category : #initialization }
PMSimplexOptimizer >> computeInitialValues [
	bestPoints 
		add: (optimizingPointClass vector: result function: functionBlock).
	self buildInitialSimplex.
	worstVector := bestPoints removeLast position
]

{ #category : #operation }
PMSimplexOptimizer >> computePrecision [
		"Private"
	| functionValues bestFunctionValue |
	functionValues := bestPoints collect: [ :each | each value].
	bestFunctionValue := functionValues removeFirst.
	^functionValues inject: 0
					into: [ :max :each | ( self precisionOf: ( each - bestFunctionValue) abs relativeTo: bestFunctionValue abs) max: max]
]

{ #category : #operation }
PMSimplexOptimizer >> contract [
	"Private"

	| bestVector oldVectors |
	bestVector := bestPoints first position.
	oldVectors := OrderedCollection with: worstVector.
	[bestPoints size > 1] whileTrue: [oldVectors add: bestPoints removeLast position].
	oldVectors do: [:each | self contract: each around: bestVector].
	worstVector := bestPoints removeLast position.
	^self computePrecision
]

{ #category : #operation }
PMSimplexOptimizer >> contract: aVector around: bestVector [ 
	"Private"

	bestPoints 
		add: (optimizingPointClass vector: bestVector * 0.5 + (aVector * 0.5)
				function: functionBlock)
]

{ #category : #operation }
PMSimplexOptimizer >> evaluateIteration [
	| centerOfGravity newPoint nextPoint |
	centerOfGravity := (bestPoints inject: ((worstVector copy)
						atAllPut: 0;
						yourself)
				into: [:sum :each | each position + sum]) * (1 / bestPoints size).
	newPoint := optimizingPointClass vector: 2 * centerOfGravity - worstVector
				function: functionBlock.
	(newPoint betterThan: bestPoints first) 
		ifTrue: 
			[nextPoint := optimizingPointClass 
						vector: newPoint position * 2 - centerOfGravity
						function: functionBlock.
			(nextPoint betterThan: newPoint) ifTrue: [newPoint := nextPoint]]
		ifFalse: 
			[newPoint := optimizingPointClass 
						vector: centerOfGravity * 0.666667 + (worstVector * 0.333333)
						function: functionBlock.
			(newPoint betterThan: bestPoints first) ifFalse: [^self contract]].
	worstVector := bestPoints removeLast position.
	bestPoints add: newPoint.
	result := bestPoints first position.
	^self computePrecision
]

{ #category : #display }
PMSimplexOptimizer >> printOn: aStream [
	super printOn: aStream.
	aStream cr. 
	worstVector printOn: aStream
]
