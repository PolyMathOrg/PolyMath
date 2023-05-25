"
A CdfNewtonZeroFinder is a specialised version of PMNewtonZeroFinder for DhbProbabilityDensity >>privateInverseDistributionValue:, that can deal with problems that can arise there (it doesnt diverge on a cdf)
"
Class {
	#name : #PMCDFNewtonZeroFinder,
	#superclass : #PMNewtonZeroFinder,
	#instVars : [
		'old'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #operation }
PMCDFNewtonZeroFinder >> computeInitialValues [

	"super computeInitialValues." "the original testing there is skipped for speed reasons, not because of the error,that is produced here, which is completely eliminated"
	old:=result-1.0
]

{ #category : #operation }
PMCDFNewtonZeroFinder >> evaluateIteration [
		"fallback on bisection if necessary (no divideByZero anymore)"
	| delta new |
	delta :=( functionBlock value: result) / (derivativeBlock value: result).
	new := result - delta.
	old<result
		ifTrue: [	new <= old ifTrue:[new:=old+result /2.0]]
		ifFalse:[	new>=old ifTrue: [new:=old+result /2.0]].
	[0.0 = (derivativeBlock value: new )] whileTrue: [new:=new +result /2.0].
	old:=result.
	result:=new.
	^self relativePrecision: delta abs
]

{ #category : #initialization }
PMCDFNewtonZeroFinder >> setDerivative: aBlock [
	"the original testing is skipped for speed reasons, not because of the error (which is largely eliminated anyway)."

	derivativeBlock := aBlock
]
