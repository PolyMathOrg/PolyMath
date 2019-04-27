"
I implement line search algorithm to find the minimum of a function g(x) >= 0 on the interval 0 < x < 1.
The method is initialized by g(0), g(1) and g'(0).
The step from x = 0 to x = 1 suppose to minimize g(x) (i.e. g'(0) < 0), but due to nonlinearity of g(x) might fail to do so.
In this case, this method finds such an x that this function is minimized in the sense:

g(x) <= g(0) + alpha g'(0)

for some small alpha (defaults to 1e-4).

Usage

For once off use: 

          (PMLineSearch function:  funBlock valueAtZero: g0  derivativeAtZero: dg0  valueAtOne: g1 ) evaluate.

where funBlock is the implementation of g(x), g0 = g(0), dg0 = g'(0) and g1 = g(0).

For repeated use:

            storedMethod := DhbLineSearch new.
           storedMethod setFunction: funBlock.
           storedMethod setValueAtZero: g0 derivativeAtZero: dg0  valueAtOne: g1.
           storedMethod evaluate. 
 
!!! Optimization tip!!!

It is guaranteed that g(x) will be called on the resulting x.

See DhbNewtonZeroFinder (PMNewtonZeroFinder) that uses this to minimize the number of function evaluations.
"
Class {
	#name : #PMLineSearch,
	#superclass : #PMFunctionalIterator,
	#instVars : [
		'alpha',
		'failingMin',
		'boundaryValues',
		'useCubicApproximation',
		'extendedResult'
	],
	#category : #'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #'instance creation' }
PMLineSearch class >> function: aBlock valueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne [
	^ self new
		setFunction: aBlock; setValueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne; 
		yourself
]

{ #category : #accessing }
PMLineSearch >> alpha [
	"Answers alpha parameter of the algorithm:
	weight for derivative value in minimization criteria"
	^ alpha
]

{ #category : #accessing }
PMLineSearch >> alpha: newAlpha [
	"Sets alpha parameter of the algorithm:
	weight for derivative value in minimization criteria"
	alpha := newAlpha
]

{ #category : #operation }
PMLineSearch >> computeInitialValues [
	"Computes initial values as (1, g(1), 0, g(0))"
	extendedResult at: 1 put: 1.0.
	extendedResult at: 2 put: (boundaryValues at: 3).
	extendedResult at: 3 put: 0.0.
	extendedResult at: 4 put: (boundaryValues at: 1).
	useCubicApproximation := false.
	result := 1.0.
]

{ #category : #operation }
PMLineSearch >> evaluate [
	"Overrides the parent method to check if method needs to be executed or
	the full step (x=1) does minimize the function already"
	((boundaryValues at: 3) < (boundaryValues at: 1)
		or: [ (boundaryValues at: 3) <= desiredPrecision ])
			ifTrue: [^ result := 1. ].
	^ super evaluate
]

{ #category : #operation }
PMLineSearch >> evaluateIteration [
	| a b tmp1 tmp2 gamma nextX g0 g1 dg0 deltaX x1 x2 |
	g0 := boundaryValues at: 1.
	dg0 := boundaryValues at: 2.
	g1 := boundaryValues at: 3.
	x1 := extendedResult at: 1.
	x2 := extendedResult at: 3.
	deltaX := x1 - x2.
	useCubicApproximation
		ifFalse: [
			nextX := dg0 negated * 0.5 / (g1 - g0 - dg0) max: 0.1.
			useCubicApproximation := true ]
		ifTrue: [
			gamma := [ :n | 
				((extendedResult at: (n+2)) - dg0 * (extendedResult at: n) - g0) / deltaX ].
			tmp1 := (gamma value: 1) / x1 squared.
			tmp2 := (gamma value: 2) / x2 squared.
			a := tmp1 - tmp2.
			b :=  x1 * tmp2 - x2 * tmp1.
			nextX := (b negated + (b squared - (3.0 * a * dg0) sqrt)) / (3.0 * a) min: 0.5 *x1 max: 0.1 * x1.
			nextX < failingMin ifTrue: [ self error: 'next x is too small: cannot minimize' ] ].
	self updateResult: nextX.
]

{ #category : #accessing }
PMLineSearch >> failingMin [
	"Answers absolute minimum value of step, below which the method would fail"
	^ failingMin
]

{ #category : #accessing }
PMLineSearch >> failingMin: newFailingMin [
	"Sets abs minimum of the step, below which the method will produce failure"
	failingMin := newFailingMin
]

{ #category : #'as yet unclassified' }
PMLineSearch >> hasConverged [
	"Customized convergence test: minimize the function as g(x)<=g(0)+alpha*g'(0)"
	| g0 dg0 gNew |
	gNew := extendedResult at: 2.
	g0 := boundaryValues at: 1.
	dg0 := boundaryValues at: 2.
	^ gNew <= (alpha * dg0 + g0)
]

{ #category : #initialization }
PMLineSearch >> initialize [
	super initialize.
	alpha := 1e-4.
	failingMin := 1e-3.
	useCubicApproximation := false.
	" Values for g(0), g'(0) and g(1) "
	boundaryValues := FloatArray new: 3.
	" Result: x1, g(x1), x2, g(x2) "
	extendedResult := FloatArray new: 4.
	^ self
]

{ #category : #initialization }
PMLineSearch >> setValueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne [
	boundaryValues at: 1 put: valueAtZero asFloat.
	boundaryValues at: 2 put: derivativeAtZero asFloat.
	boundaryValues at: 3 put: valueAtOne.
	^ self
]

{ #category : #operation }
PMLineSearch >> updateResult: nextX [
	" Move x1 -> x2; g(x1) -> g(x2) and assign x1 = nextX; g(x1) = g(nextX) "
	extendedResult at: 3 put: (extendedResult at: 1).
	extendedResult at: 4 put: (extendedResult at: 2).
	extendedResult at: 1 put: nextX.
	extendedResult at: 2 put: (functionBlock value: nextX).
	result := nextX
	
]
