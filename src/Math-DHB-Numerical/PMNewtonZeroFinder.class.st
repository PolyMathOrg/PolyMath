"
I implement Globally Convergent Newton Method to solve scalar nonlinear equations f(x)=0.

As Newton step (especially started far from actual root) may lead to divergence, I use Line Search (PMLineSearch) to extend the convergence region.

Each iteration of the method finds next approximation according to the formula:

x(new) = x(old) + step; step = - f(x) / f'(x)

step might be adjusted by line search.

Usage

         (PMNewtonZeroFinder function: funBlock derivaitve: derBlock) initValue: x0; evaluate.

Or

         (PMNewtonZeroFinder function: funBlock) initValue: x0; evaluate.

If derivative is not provided, it will be approximated, but this leads to very inefficient process!
"
Class {
	#name : #PMNewtonZeroFinder,
	#superclass : #PMFunctionalIterator,
	#instVars : [
		'derivativeBlock',
		'searchStep',
		'lastFunctionValue',
		'newFunctionValue',
		'lineSearch',
		'lineSearchFunctionBlock'
	],
	#category : 'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #creation }
PMNewtonZeroFinder class >> function: aBlock1 derivative: aBlock2 [
		"Convenience method to create a instance with given function block.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/1/99 "
	^(self new) setFunction: aBlock1; setDerivative: aBlock2; yourself
]

{ #category : #operation }
PMNewtonZeroFinder >> computeInitialValues [
	"Private - If no derivative has been defined, take an ad-hoc definition.
	 If no initial value has been defined, take 0 as the starting point (for lack of anything better)."
	| n |
	result isNil
		ifTrue: [ result := 0].
	derivativeBlock isNil
		ifTrue: [ derivativeBlock := self defaultDerivativeBlock].
	n := 0.
	[ (derivativeBlock value: result) equalsTo: 0]
		whileTrue: [ n := n + 1.
					 n > maximumIterations
						ifTrue: [ self error: 'Function''s derivative seems to be zero everywhere'].
					 result := Number random + result].
	newFunctionValue := functionBlock value: result.
]

{ #category : #information }
PMNewtonZeroFinder >> defaultDerivativeBlock [
	"Private - Answers a block computing the function's derivative by approximation."
	^[ :x | 5000 * ( ( functionBlock value: (x + 0.0001)) - ( functionBlock value: (x - 0.0001)))]
]

{ #category : #operation }
PMNewtonZeroFinder >> evaluateIteration [
	"Compute one step of Newton's zero finding method. Answers the estimated precision."
	| g0 g1 dg0 coefficient |
	"Calculate new Newton step"
	searchStep := (( lastFunctionValue := newFunctionValue) / ( derivativeBlock value: result)) negated.
	"Initialize variables for line search"
	g0 := 0.5 * lastFunctionValue squared.
	dg0 := -2 * lastFunctionValue.
	"This also updates newFunctionValue"
	g1 := lineSearchFunctionBlock value: 1.
	"Get coefficient of the step from line search: 0 < coefficient <= 1; newFunctionValue is updated as well"
	coefficient := lineSearch setValueAtZero: g0 derivativeAtZero: dg0 valueAtOne: g1; evaluate.
	searchStep := coefficient * searchStep.
	result := result + searchStep.
	^ self relativePrecision: (searchStep abs max: newFunctionValue abs)
	
]

{ #category : #initialization }
PMNewtonZeroFinder >> initialValue: aNumber [
	"Defines the initial value for the iterations."
	result := aNumber.
]

{ #category : #'as yet unclassified' }
PMNewtonZeroFinder >> initialize [
	"Initialize lineSearchFunction and lineSearch: it depends on other variables only indirectly,
	can be initialized once at the begining"
	super initialize.
	lineSearchFunctionBlock := [ :t |
		newFunctionValue := functionBlock value: t * searchStep + result.
		0.5 * newFunctionValue squared ].
	lineSearch := PMLineSearch new.
	lineSearch setFunction:  lineSearchFunctionBlock.
	^ self
]

{ #category : #initialization }
PMNewtonZeroFinder >> setDerivative: aBlock [ 
	"Defines the derivative of the function for which zeroes will be found.
	Tests if provided block indeed implements the derivative of the function"
	| x |
	(aBlock respondsTo: #value:)
		ifFalse: [self error: 'Derivative block must implement the method value:'].
	x := result isNil
				ifTrue: [Number random]
				ifFalse: [result + Number random].
	((aBlock value: x)
		relativelyEqualsTo: (self defaultDerivativeBlock value: x)
		upTo: 1.0e-4)
		ifFalse: [self error: 'Supplied derivative is not correct'].
	derivativeBlock := aBlock
]

{ #category : #initialization }
PMNewtonZeroFinder >> setFunction: aBlock [
	"Sets the function block (delegates to superclass). Resets the derivative"
	super setFunction: aBlock.
	derivativeBlock := nil.
]
