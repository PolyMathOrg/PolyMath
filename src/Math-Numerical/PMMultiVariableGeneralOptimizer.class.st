Class {
	#name : #PMMultiVariableGeneralOptimizer,
	#superclass : #PMFunctionOptimizer,
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #operation }
PMMultiVariableGeneralOptimizer >> computeInitialValues [
	self range notNil
		ifTrue: [ self performGeneticOptimization].
	self performSimplexOptimization
]

{ #category : #operation }
PMMultiVariableGeneralOptimizer >> evaluateIteration [
	| optimizer |
	optimizer := PMHillClimbingOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision;
			  maximumIterations: maximumIterations;
			  initialValue: result.
	result := optimizer evaluate.
	^optimizer precision
]

{ #category : #operation }
PMMultiVariableGeneralOptimizer >> finalizeIterations [
]

{ #category : #initialization }
PMMultiVariableGeneralOptimizer >> origin [
	^result
]

{ #category : #initialization }
PMMultiVariableGeneralOptimizer >> origin: anArrayOrVector [
	result := anArrayOrVector.
]

{ #category : #operation }
PMMultiVariableGeneralOptimizer >> performGeneticOptimization [
		"Private"
	| optimizer manager |
	optimizer := PMGeneticOptimizer forOptimizer: self.
	manager := PMVectorChromosomeManager new: 100 mutation: 0.1 crossover: 0.1.
	manager origin: self origin asPMVector; range: self range asPMVector.
	optimizer chromosomeManager: manager.
	result := optimizer evaluate.
]

{ #category : #operation }
PMMultiVariableGeneralOptimizer >> performSimplexOptimization [
	"Private"

	| optimizer |
	optimizer := PMSimplexOptimizer forOptimizer: self.
	optimizer desiredPrecision: desiredPrecision sqrt; maximumIterations: maximumIterations; initialValue: result asPMVector.
	result := optimizer evaluate
]

{ #category : #initialization }
PMMultiVariableGeneralOptimizer >> range [
	^self bestPoints
]

{ #category : #initialization }
PMMultiVariableGeneralOptimizer >> range: anArrayOrVector [
	bestPoints := anArrayOrVector
]
