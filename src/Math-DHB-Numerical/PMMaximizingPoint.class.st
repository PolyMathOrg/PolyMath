Class {
	#name : #PMMaximizingPoint,
	#superclass : #PMMinimizingPoint,
	#category : 'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMMaximizingPoint >> better: anOptimizingPoint [
	^ value >= anOptimizingPoint value
]

{ #category : #information }
PMMaximizingPoint >> betterThan: anOptimizingPoint [
	^value > anOptimizingPoint value
]
