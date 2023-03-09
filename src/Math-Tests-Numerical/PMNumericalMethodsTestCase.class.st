Class {
	#name : #PMNumericalMethodsTestCase,
	#superclass : #TestCase,
	#category : #'Math-Tests-Numerical'
}

{ #category : #running }
PMNumericalMethodsTestCase >> setUp [
	"Reset the seed of the random numbers (to get consistent results)"
	PMMitchellMooreGenerator reset: 0.
	"Reset the FloatingPointMachine to make coverage consistent"
	PMFloatingPointMachine reset
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testAtRowPutAtColumnPut [
	| a |
	a := PMMatrix rows: #(#(11 12 13) #(21 22 23)).
	a atRow: 1 put: (a rowAt: 2).
	self assert: a equals: (PMMatrix rows: #(#(21 22 23) #(21 22 23))).
	a atColumn: 3 put: (a columnAt: 2).
	self assert: a equals: (PMMatrix rows: #(#(21 22 22) #(21 22 22))).
	a := PMSymmetricMatrix rows: #(#(11 12) #(21 22)).
	self should: [ a atRow: 1 put: (a rowAt: 2) ] raise: Error.
	self should: [ a atColumn: 1 put: (a rowAt: 2) ] raise: Error
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testBissection [
	"Code Example 5.1"

	| zeroFinder result |
	zeroFinder := PMBisectionZeroFinder
		function: [ :x | x errorFunction - 0.9 ].
	zeroFinder
		setPositiveX: 10.0;
		setNegativeX: 0.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: (result - 1.28155193291605) abs < 1.0e-14
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testDeterminant [
	| m |
	m := PMMatrix rows: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	self assert: m determinant equals: -42
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testDimension [
	| a |
	a := PMMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	self assert: a dimension equals: 2@3
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testEigenvalues [
	"Code Example 8.15"

	| m charPol roots eigenvalues finder |
	m := PMMatrix rows: #(#(3 -2 0) #(-2 7 1) #(0 1 5)).
	charPol := PMPolynomial coefficients: #(82 -66 15 -1).
	roots := charPol roots asSortedCollection asArray reverse.
	finder := PMJacobiTransformation matrix: m.
	finder desiredPrecision: 1.0e-09.
	eigenvalues := finder evaluate.
	self assert: eigenvalues size equals: 3.
	self assert: ((roots at: 1) - (eigenvalues at: 1)) abs < 1.0e-09.
	self assert: ((roots at: 2) - (eigenvalues at: 2)) abs < 1.0e-09.
	self assert: ((roots at: 3) - (eigenvalues at: 3)) abs < 1.0e-09
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testEigenvaluesLargest [
	"Code Example 8.13"

	| m charPol roots eigenvalue finder |
	m := PMMatrix rows: #(#(3 -2 0) #(-2 7 1) #(0 1 5)).
	charPol := PMPolynomial coefficients: #(82 -66 15 -1).
	roots := charPol roots asSortedCollection asArray reverse.
	finder := PMLargestEigenValueFinder matrix: m.
	finder desiredPrecision: 1.0e-08.
	eigenvalue := finder evaluate.
	self assert: ((roots at: 1) - eigenvalue) abs < 1.0e-08.
	finder := finder nextLargestEigenValueFinder.
	eigenvalue := finder evaluate.
	self assert: ((roots at: 2) - eigenvalue) abs < 1.0e-08
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testErrorFunction [
	"simple cases to expect"

	self assert: 0 errorFunction equals: 1 / 2.
	self
		assert:
			PMFloatingPointMachine new largestNumber errorFunction
				> (1 - PMFloatingPointMachine new machinePrecision).
	"add some code to require initialize to run"
	PMErfApproximation reset.
	self
		assert:
			PMFloatingPointMachine new largestNumber negated errorFunction
				< PMFloatingPointMachine new smallestNumber
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testFTest [
	| accC accMM confidenceLevel |
	accC := PMStatisticalMoments new.
	#(5.56 5.89 4.66 5.69 5.34 4.79 4.80 7.86 3.64 5.70)
		do: [ :x | accC accumulate: x ].
	accMM := PMStatisticalMoments new.
	#(7.48 6.75 3.77 5.71 7.25 4.73 6.23 5.60 5.94 4.58)
		do: [ :x | accMM accumulate: x ].
	confidenceLevel := accC fConfidenceLevel: accMM.
	self assert: (accC average - 5.393) abs < 0.000000001.
	self
		assert: (accC standardDeviation - 1.0990809292) abs < 0.000000001.
	self assert: (accMM average - 5.804) abs < 0.000000001.
	self assert: (accMM standardDeviation - 1.19415428) abs < 0.000000001.
	self assert: (confidenceLevel - 79.8147614536) abs < 0.000000001
]

{ #category : #statistics }
PMNumericalMethodsTestCase >> testHistogram [
	| histogram |
	histogram := PMHistogram new.
	histogram setRangeFrom: 0.0 to: 48.0 bins: 8.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | histogram accumulate: x ].
	histogram
		accumulate: -1;
		accumulate: 55;
		accumulate: 56.
	self assert: histogram count equals: 30.
	self assert: histogram underflow equals: 1.
	self assert: histogram overflow equals: 2.
	self assert: (histogram countAt: 1) equals: 3.
	self assert: (histogram countAt: 8.5) equals: 4.
	self assert: (histogram countAt: 16) equals: 8.
	self assert: (histogram countAt: 23.5) equals: 4.
	self assert: (histogram countAt: 31) equals: 6.
	self assert: (histogram countAt: 38.5) equals: 4.
	self assert: (histogram countAt: 46) equals: 1.
	self assert: (histogram average - 24.1333333333) abs < 0.000000001.
	self
		assert: (histogram standardDeviation - 12.461619237603) abs < 0.000000001.
	self assert: (histogram skewness - 0.116659884676) abs < 0.000000001.
	self assert: (histogram kurtosis + 1.004665562311) abs < 0.000000001
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testIncompleteBetaFunction [
	| function |
	function := PMIncompleteBetaFunction shape: 2 shape: 5.
	self assert: ((function value: 0.8) - 0.9984) abs < 0.00001
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testIncompleteGammaFunction [
	| function |
	function := PMIncompleteGammaFunction shape: 2.
	self
		assert: ((function value: 2) - 0.59399414981) abs < 0.00000000001
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testIntegrationRomberg [
	| integrator ln2 ln3 |
	integrator := PMRombergIntegrator
		function: [ :x | 1.0 / x ]
		from: 1
		to: 2.
	ln2 := integrator evaluate.
	integrator from: 1 to: 3.
	ln3 := integrator evaluate.
	self assert: (2.0 ln - ln2) abs < (2 * integrator precision).
	self assert: (3.0 ln - ln3) abs < (2 * integrator precision)
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testIntegrationSimpson [
	| integrator ln2 ln3 |
	integrator := PMSimpsonIntegrator
		function: [ :x | 1.0 / x ]
		from: 1
		to: 2.
	ln2 := integrator evaluate.
	integrator from: 1 to: 3.
	ln3 := integrator evaluate.
	self assert: (2.0 ln - ln2) abs < integrator precision.
	self assert: (3.0 ln - ln3) abs < integrator precision
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testIntegrationTrapeze [
	"Code Example 6.1"

	| integrator ln2 ln3 |
	integrator := PMTrapezeIntegrator
		function: [ :x | 1.0 / x ]
		from: 1
		to: 2.
	ln2 := integrator evaluate.
	integrator from: 1 to: 3.
	ln3 := integrator evaluate.
	self assert: (2.0 ln - ln2) abs < integrator precision.
	self assert: (3.0 ln - ln3) abs < integrator precision
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationBulirschStoer [
	| interpolator |
	interpolator := PMBulirschStoerInterpolator new.
	1 to: 45 by: 2 do: [ :x | interpolator add: x @ x degreesToRadians sin ].
	self
		assert: ((interpolator value: 8) - 8 degreesToRadians sin) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationLagrange [
	"Code example 3.2"

	| interpolator |
	interpolator := PMLagrangeInterpolator new.
	1 to: 45 by: 2 do: [ :x | interpolator add: x @ x degreesToRadians sin ].
	self
		assert: ((interpolator value: 8) - 8 degreesToRadians sin) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationLagrangeLinear [
	"Code example 3.1"

	| interpolator |
	interpolator := PMLagrangeInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationNeville [
	| interpolator |
	interpolator := PMNevilleInterpolator new.
	1 to: 45 by: 2 do: [ :x | interpolator add: x @ x degreesToRadians sin ].
	self
		assert: ((interpolator value: 8) - 8 degreesToRadians sin) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationNevilleLinear [
	"Code example 3.1"

	| interpolator |
	interpolator := PMNevilleInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testInterpolationNewton [
	| interpolator |
	interpolator := PMNewtonInterpolator new.
	1 to: 45 by: 2 do: [ :x | interpolator add: x @ x degreesToRadians sin ].
	self
		assert: ((interpolator value: 8) - 8 degreesToRadians sin) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationNewtonLinear [
	"Code example 3.1"

	| interpolator |
	interpolator := PMNewtonInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationSpline [
	| interpolator |
	interpolator := PMSplineInterpolator new.
	1 to: 45 by: 2 do: [ :x | interpolator add: x @ x degreesToRadians sin ].
	self
		assert: ((interpolator value: 8) - 8 degreesToRadians sin) abs < 1.0e-7
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testInterpolationSplineLinear [
	"Code example 3.1"

	| interpolator |
	interpolator := PMSplineInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testLUPDecomposition [
	"Code Example 8.10"

	| s sol1 sol2 |
	s := PMLUPDecomposition equations: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	sol1 := s solve: #(16 6 10).
	sol2 := s solve: #(7 10 9).
	self assert: sol1 size equals: 3.
	self assert: (sol1 at: 1) equals: 2.
	self assert: (sol1 at: 2) equals: -1.
	self assert: (sol1 at: 3) equals: 3.
	self assert: sol2 size equals: 3.
	self assert: (sol2 at: 1) equals: 1.
	self assert: (sol2 at: 2) equals: -2.
	self assert: (sol2 at: 3) equals: 2
]

{ #category : #'function evaluation' }
PMNumericalMethodsTestCase >> testLanczosFormulaObject [
	"verify that initialize is sent at least once per test run"

	| first second third |
	first := PMLanczosFormula new.
	PMLanczosFormula reset.
	second := PMLanczosFormula new.
	self shouldnt: [ first == second ].
	third := PMLanczosFormula new.
	self assert: second == third
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testLeastSquare [
	"Code example 10.9"

	"Note: the seemingly large error on the fit results is due to the binning of the histogram."

	| count shape scale genDistr hist fit fittedDistr parameters |
	count := 10000.
	shape := 0.
	scale := 1.
	hist := PMHistogram new.
	hist freeExtent: true.
	genDistr := PMFisherTippettDistribution shape: shape scale: scale.
	count timesRepeat: [ hist accumulate: genDistr random ].
	fit := PMLeastSquareFit
		histogram: hist
		distributionClass: PMFisherTippettDistribution.
	fittedDistr := fit evaluate.
	parameters := fittedDistr parameters.
	self assert: ((parameters at: 1) - shape) abs < 0.1.
	self assert: ((parameters at: 2) - scale) abs < 0.1.
	self assert: ((parameters at: 3) - count) abs < 100
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testLeastSquarePolynomial [
	"Code example 10.5"

	| fit estimation |
	fit := PMPolynomialLeastSquareFit new: 3.
	fit
		add: (PMWeightedPoint point: 1 @ 2.0);
		add: (PMWeightedPoint point: 2 @ 21.0);
		add: (PMWeightedPoint point: 3 @ 72.0);
		add: (PMWeightedPoint point: 4 @ 173.0);
		add: (PMWeightedPoint point: 5 @ 342.0);
		add: (PMWeightedPoint point: 6 @ 597.0);
		add: (PMWeightedPoint point: 7 @ 956.0);
		add: (PMWeightedPoint point: 8 @ 1437.0);
		add: (PMWeightedPoint point: 9 @ 2058.0);
		add: (PMWeightedPoint point: 10 @ 2837.0).
	estimation := fit evaluate.
	self assert: ((estimation value: 4.5) - 247.875) abs < 0.000000001.
	self assert: ((estimation error: 4.5) - 5.215298e-1) abs < 0.00001.
	self
		assert:
			((estimation value: 7.15) - 1019.932625) abs
				< (estimation error: 7.15)
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testLeastSquaresSingularMatrixError [
	| histogram leastSquares |

	histogram := PMHistogram new
		freeExtent: true;
		yourself.

	1 to: 3 do: [:i| histogram accumulate: i ].

	leastSquares := PMLeastSquareFit
		histogram: histogram
		distributionClass: PMTriangularDistribution.

	self should: [ leastSquares evaluate ] raise: PMSingularMatrixError.
	self should: [ leastSquares errorMatrix ] raise: PMSingularMatrixError
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testLineSearch1 [
	"Test line searh for an initial step of Newton solver for equation

	atan x = 0 with x0 = 2.

	D[atan x] = 1 / (1+x^2).
	"
	| xOld p functionBlock g0 g1 dg0 xAnswer |
	xOld := 2.0.
	p := (xOld arcTan * (1.0 + xOld squared)) negated.
	functionBlock := [  :x | 0.5 * ((x * p + xOld) arcTan) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	xAnswer := (PMLineSearch
					function: functionBlock
					valueAtZero: g0
					derivativeAtZero: dg0
					valueAtOne: g1) evaluate.
	self assert: (xAnswer <= 0.5) & (xAnswer > 1e-3).
	self assert: (functionBlock value: xAnswer) < g0.
	self assert: (functionBlock value: xAnswer) < g1
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testLineSearch2 [
	"Test line searh for an initial step of Newton solver for equation

	F(x) := sqrt(x) - x = 0 with x = 2.

	F'(x) = 0.5 / sqrt(x) - 1.

	This case does not require line search, should return 1.
	"
	| xOld p functionBlock g0 g1 dg0 xAnswer |
	xOld := 2.0.
	p := ((xOld sqrt - xOld) / (0.5 / xOld sqrt - 1)) negated.
	functionBlock := [  :x | 0.5 * ((x * p + xOld) sqrt - (x * p + xOld)) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	xAnswer := (PMLineSearch
					function: functionBlock
					valueAtZero: g0
					derivativeAtZero: dg0
					valueAtOne: g1) evaluate.
	self assert: xAnswer equals: 1.0.
	self assert: (functionBlock value: xAnswer) < g0.
	self assert: (functionBlock value: xAnswer) = g1
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testLineSearch3 [
	"Test line searh for the final step of Newton solver for equation

	F(x) := x + 1 for x = -1 (+ small epsilon)

	F'(x) = 1.

	This case does not require line search, should return 1.
	"
	| xOld eps p functionBlock g0 g1 dg0 lineSearch xAnswer |
	eps := PMFloatingPointMachine new defaultNumericalPrecision.
	xOld := -1.0 + eps.
	p := eps.
	functionBlock := [  :t | 0.5 * ((t * p + xOld) + 1) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	lineSearch := PMLineSearch function: functionBlock valueAtZero: g0 derivativeAtZero: dg0 valueAtOne: g1.
	lineSearch desiredPrecision: eps.
	xAnswer := lineSearch evaluate.
	self assert: xAnswer equals: 1.0
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testLinearEquations [
	"Code Example 8.6"

	| s sol1 sol2 |
	s := PMLinearEquationSystem
		equations: #(#(3 2 4) #(2 -5 -1) #(1 -2 2))
		constants: #(#(16 6 10) #(7 10 9)).
	sol1 := s solutionAt: 1.
	sol2 := s solutionAt: 2.
	self assert: sol1 size equals: 3.
	self assert: (sol1 at: 1) equals: 2.
	self assert: (sol1 at: 2) equals: -1.
	self assert: (sol1 at: 3) equals: 3.
	self assert: sol2 size equals: 3.
	self assert: (sol2 at: 1) equals: 1.
	self assert: (sol2 at: 2) equals: -2.
	self assert: (sol2 at: 3) equals: 2
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testLinearEquationsSingle [

	| s sol |
	s := PMLinearEquationSystem
		     equations: #( #( 1 2 0 ) #( 3 5 4 ) #( 5 6 3 ) )
		     constant: #( 0.1 12.5 10.3 ).
	sol := s solution.
	self assert: sol size equals: 3.
	self assert: ((sol at: 1) closeTo: 0.5).
	self assert: ((sol at: 2) closeTo: -0.2).
	self assert: ((sol at: 3) closeTo: 3.0)
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testLinearEquationsSingular [
	| s sol |
	s := PMLinearEquationSystem
		equations: #(#(1 2 0) #(10 12 6) #(5 6 3))
		constant: #(0.1 12.5 10.3).
	sol := s solution.
	self assert: sol isNil
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testLinearRegression [
	"Code example 10.5"

	| linReg estimation |
	linReg := PMLinearRegression new.
	linReg
		add: 1 @ 0.72;
		add: 2 @ 3.25;
		add: 3 @ 5.75;
		add: 4 @ 8.21;
		add: 5 @ 10.71;
		add: 6 @ 13.38;
		add: 7 @ 15.82;
		add: 8 @ 18.39;
		add: 9 @ 20.72;
		add: 10 @ 23.38.
	self assert: (linReg slope - 2.514727272727) abs < 0.000000000001.
	self assert: (linReg intercept + 1.798) abs < 0.000000000001.
	self
		assert: (linReg correlationCoefficient - 0.999966922113) abs < 0.000000000001.
	estimation := linReg asEstimatedPolynomial.
	self
		assert: ((estimation value: 4.5) - 9.5182727272727) abs < 0.000000000001.
	self
		assert: ((estimation value: 7.15) - 16.1823) abs < 0.000000000001
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixAdd [
	| a b c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7)).
	c := a + b.
	self assert: c numberOfRows equals: 2.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 2.
	self assert: ((c rowAt: 1) at: 2) equals: 2.
	self assert: ((c rowAt: 1) at: 3) equals: 4.
	self assert: ((c rowAt: 2) at: 1) equals: -3.
	self assert: ((c rowAt: 2) at: 2) equals: -1.
	self assert: ((c rowAt: 2) at: 3) equals: 10
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixDo [
	| a |
	a := PMMatrix rows: #(#(1 2 3) #(1 2 3) #(1 2 3)).
	a rowsDo: [ :row | row at: 1 put: 0 ].
	self assert: (a rowAt: 1 columnAt: 1) equals: 0.
	a columnsDo: [ :col | a atRow: 1 put: col ].
	self assert: (a rowAt: 1) equals: #(2 3 3) asPMVector
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixEquality [
	| a c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	c := a.
	self assert: c numberOfRows equals: a numberOfRows.
	self assert: c numberOfColumns equals: a numberOfColumns.
	self assert: (c = a and: [ a = c ])
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixExtensions [
	"testing at:at: and at:at:put:"

	| a c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	c := a deepCopy.
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 1).
	a at: 1 at: 1 put: 42.
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ]
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixExtensionsAtColumn [
	"testing at:at: and at:at:put:"

	| a c |

	a := PMMatrix rows: #(#(11 12 13) #(21 22 23)).
	c := a deepCopy.
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 1).
	c atColumn: 1 put: (a atColumn: 2).
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ].
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 2).
	c := a deepCopy.
	c at: 1 at: 1 put: (a at: 1 at: 2).
	c atColumn: 1 put: (a atColumn: 2) startingAt: 1.
	self assert: (c at: 2 at: 1) equals: (a at: 1 at: 2).
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ]
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixExtensionsAtRow [
	"testing at:at: and at:at:put:"

	| a c |

	a := PMMatrix rows: #(#(11 12 13) #(21 22 23)).
	c := a deepCopy.
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 1).
	c atRow: 1 put: (a rowAt: 2).
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ].
	self assert: (c at: 1 at: 1) equals: (a at: 2 at: 1).
	c := a deepCopy.
	c atRow: 1 put: (a rowAt: 2) startingAt: 1.
	self assert: (c at: 1 at: 2) equals: (a at: 2 at: 1).
	self shouldnt: [ (c at: 1 at: 2) = (a at: 1 at: 2) ]
]

{ #category : #comparing }
PMNumericalMethodsTestCase >> testMatrixHash [
	| a b c |
	a := PMMatrix rows: #(#(1 0) #(0 1)).
	b := a deepCopy.
	self assert: a hash equals: b hash.
	c := a + b.
	self shouldnt: [ a hash = c hash ]
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixInitializeSquare [
	| aPMMatrix |
	aPMMatrix := PMMatrix new initializeSquare:  2.
	self assert: aPMMatrix numberOfRows equals: 2.
	self assert: aPMMatrix numberOfColumns equals: 2
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixInversionSmall [
	| m c |
	m := PMMatrix rows: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	c := m inverse * m.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 1.
	self assert: ((c rowAt: 1) at: 2) equals: 0.
	self assert: ((c rowAt: 1) at: 3) equals: 0.
	self assert: ((c rowAt: 2) at: 1) equals: 0.
	self assert: ((c rowAt: 2) at: 2) equals: 1.
	self assert: ((c rowAt: 2) at: 3) equals: 0.
	self assert: ((c rowAt: 3) at: 1) equals: 0.
	self assert: ((c rowAt: 3) at: 2) equals: 0.
	self assert: ((c rowAt: 3) at: 3) equals: 1
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixMultiply [
	"Code Example 8.1"

	| a b c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7) #(5 6 7)).
	c := a * b.
	self assert: c numberOfRows equals: 2.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 6.
	self assert: ((c rowAt: 1) at: 2) equals: 8.
	self assert: ((c rowAt: 1) at: 3) equals: 10.
	self assert: ((c rowAt: 2) at: 1) equals: 18.
	self assert: ((c rowAt: 2) at: 2) equals: 14.
	self assert: ((c rowAt: 2) at: 3) equals: 4
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testMatrixSubtract [
	| a b c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7)).
	c := a - b.
	self assert: c numberOfRows equals: 2.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 0.
	self assert: ((c rowAt: 1) at: 2) equals: -2.
	self assert: ((c rowAt: 1) at: 3) equals: -2.
	self assert: ((c rowAt: 2) at: 1) equals: 1.
	self assert: ((c rowAt: 2) at: 2) equals: -3.
	self assert: ((c rowAt: 2) at: 3) equals: -4
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testMaximumLikelihood [
	"Code example 10.11"

	"Note: the seemingly large error on the fit results is due to the binning of the histogram."

	| count shape scale genDistr hist fit fittedDistr parameters |
	count := 10000.
	shape := 0.
	scale := 1.
	hist := PMHistogram new.
	hist freeExtent: true.
	genDistr := PMFisherTippettDistribution shape: shape scale: scale.
	count timesRepeat: [ hist accumulate: genDistr random ].
	fit := PMMaximumLikelihoodHistogramFit
		histogram: hist
		distributionClass: PMFisherTippettDistribution.
	fittedDistr := fit evaluate.
	parameters := fittedDistr parameters.
	self assert: ((parameters at: 1) - shape) abs < 0.1.
	self assert: ((parameters at: 2) - scale) abs < 0.1.
	self assert: ((parameters at: 3) - count) abs < 100
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testNewtonZeroFinder [
	"Code Example 5.3"

	| zeroFinder result |
	zeroFinder := PMNewtonZeroFinder
		function: [ :x | x errorFunction - 0.9 ].
	zeroFinder initialValue: 1.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: (result - 1.28155193867885) abs < zeroFinder precision
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testNewtonZeroFinder2 [
	"Test Newton's method for

	   atan x = 0, x = 5.

	   atan' x = 1 / (1+x^2)

	This case requires line search to decrease the initial step."
	| zeroFinder result |
	zeroFinder := PMNewtonZeroFinder
		function: [ :x | x arcTan ]
		derivative: [ :x | 1 / (1 + x squared) ].
	zeroFinder initialValue: 5.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: result abs < zeroFinder precision
]

{ #category : #'iterative algorithms' }
PMNumericalMethodsTestCase >> testNewtonZeroFinder3 [
	"Test Newton's method for linear function

	   F(x) = x + 1 = 0, x = 5.

	   F'(x) = 1

	This should converge in two iterations: the first iteration produces large step,
	but the second iteration step is zero => convergence"
	| zeroFinder result |
	zeroFinder := PMNewtonZeroFinder function: [ :x | x + 1 ] derivative: [ :x | 1  ].
	zeroFinder initialValue: 5.0.
	result := zeroFinder evaluate.
	self assert: zeroFinder hasConverged.
	self assert: (result + 1) abs <= zeroFinder precision.
	self assert: zeroFinder iterations = 2
]

{ #category : #statistics }
PMNumericalMethodsTestCase >> testNormalDistribution [
	| dist |
	dist := PMNormalDistribution new: 3.4 sigma: 1.7.
	self assert: (dist average - 3.4) abs < 0.000000001.
	self assert: (dist standardDeviation - 1.7) abs < 0.000000001.
	self assert: ((dist value: 4.5) - 0.1903464693) abs < 0.000000001.
	self
		assert: ((dist distributionValue: 4.5) - 0.7412031298) abs < 0.000000001
]

{ #category : #optimization }
PMNumericalMethodsTestCase >> testOptimize [
	"General optimizer to test genetic algorithm"

	| fBlock finder result |
	fBlock := [ :x |
	| r |
	r := x * x.
	r = 0
		ifTrue: [ 1 ]
		ifFalse: [ r sqrt sin / r ] ].
	finder := PMMultiVariableGeneralOptimizer maximizingFunction: fBlock.
	finder desiredPrecision: 1.0e-6.
	finder
		origin: #(0.5 1.0 0.5) asPMVector;
		range: #(2 2 2) asPMVector.
	result := finder evaluate.
	self assert: finder precision < 1.0e-6.
	self assert: (result at: 1) abs < 1.0e-6.
	self assert: (result at: 2) abs < 1.0e-6.
	self assert: (result at: 3) abs < 1.0e-6
]

{ #category : #optimization }
PMNumericalMethodsTestCase >> testOptimizeOneDimension [
	"Code example 11.1"

	| distr finder maximum |
	distr := PMGammaDistribution shape: 2 scale: 5.
	finder := PMOneVariableFunctionOptimizer maximizingFunction: distr.
	finder desiredPrecision: 1.0e-6.
	maximum := finder evaluate.
	self assert: (maximum - 5) abs < 1.0e-6.
	self assert: finder precision < 1.0e-6
]

{ #category : #optimization }
PMNumericalMethodsTestCase >> testOptimizePowell [
	"Code example 11.3"

	| fBlock hillClimber educatedGuess result |
	fBlock := [ :x | (x * x) negated exp ].
	educatedGuess := #(0.5 1.0 0.5) asPMVector.
	hillClimber := PMHillClimbingOptimizer maximizingFunction: fBlock.
	hillClimber initialValue: educatedGuess.
	hillClimber desiredPrecision: 1.0e-6.
	result := hillClimber evaluate.
	self assert: hillClimber precision < 1.0e-6.
	self assert: (result at: 1) abs < 1.0e-6.
	self assert: (result at: 2) abs < 1.0e-6.
	self assert: (result at: 3) abs < 1.0e-6
]

{ #category : #optimization }
PMNumericalMethodsTestCase >> testOptimizeSimplex [
	"Code example 11.5"

	| fBlock simplex educatedGuess result |
	fBlock := [ :x | (x * x) negated exp ].
	educatedGuess := #(0.5 1.0 0.5) asPMVector.
	simplex := PMSimplexOptimizer maximizingFunction: fBlock.
	simplex initialValue: educatedGuess.
	simplex desiredPrecision: 1.0e-6.
	result := simplex evaluate.
	self assert: simplex precision < 1.0e-6.
	self assert: (result at: 1) abs < 1.0e-6.
	self assert: (result at: 2) abs < 1.0e-6.
	self assert: (result at: 3) abs < 1.0e-6
]

{ #category : #statistics }
PMNumericalMethodsTestCase >> testStatisticalMoments [
	"comment"

	| accumulator |
	accumulator := PMStatisticalMoments new.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | accumulator accumulate: x ].
	self assert: (accumulator average - 24.1333333333) abs < 0.000000001.
	self
		assert: (accumulator standardDeviation - 12.461619237603) abs < 0.000000001.
	self
		assert: (accumulator skewness - 0.116659884676) abs < 0.000000001.
	self
		assert: (accumulator kurtosis + 1.004665562311) abs < 0.000000001
]

{ #category : #statistics }
PMNumericalMethodsTestCase >> testStatisticalMomentsFast [
	| accumulator |
	accumulator := PMFastStatisticalMoments new.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | accumulator accumulate: x ].
	self assert: (accumulator average - 24.1333333333) abs < 0.000000001.
	self
		assert: (accumulator standardDeviation - 12.461619237603) abs < 0.000000001.
	self
		assert: (accumulator skewness - 0.116659884676) abs < 0.000000001.
	self
		assert: (accumulator kurtosis + 1.004665562311) abs < 0.000000001
]

{ #category : #statistics }
PMNumericalMethodsTestCase >> testStatisticalMomentsFixed [
	| accumulator |
	accumulator := PMFixedStatisticalMoments new.
	#(36 13 27 16 33 24 4 20 15 23 37 23 31 15 47 22 6 15 41 22 14 14 31 42 3 42 22 8 37 41)
		do: [ :x | accumulator accumulate: x ].
	self assert: (accumulator average - 24.1333333333) abs < 0.000000001.
	self
		assert: (accumulator standardDeviation - 12.461619237603) abs < 0.000000001.
	self
		assert: (accumulator skewness - 0.116659884676) abs < 0.000000001.
	self
		assert: (accumulator kurtosis + 1.004665562311) abs < 0.000000001
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testSymmetricMatrixAdd [
	| a b c |
	a := (PMMatrix rows: #(#(11 12 13) #(12 22 23) #(13 23 33)))
		asSymmetricMatrix.
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7) #(0 0 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testSymmetricMatrixAdd2 [
	| a b c |
	a := PMSymmetricMatrix rows: #(#(11 12 13) #(12 22 23) #(13 23 33)).
	b := PMSymmetricMatrix rows: #(#(1 2 3) #(2 1 7) #(3 7 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testSymmetricMatrixAdd3 [
	| a b c |
	a := PMMatrix rows: #(#(11 12 13) #(21 22 23) #(31 32 33)).
	b := PMSymmetricMatrix rows: #(#(1 2 3) #(-2 1 7) #(0 0 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16.
	self assert: ((c rowAt: 2) at: 1) equals: 19.
	self assert: ((c rowAt: 2) at: 2) equals: 23.
	self assert: ((c rowAt: 2) at: 3) equals: 30.
	self assert: ((c rowAt: 3) at: 1) equals: 31
]

{ #category : #estimation }
PMNumericalMethodsTestCase >> testTTest [
	| accC accMM confidenceLevel |
	accC := PMStatisticalMoments new.
	#(5.56 5.89 4.66 5.69 5.34 4.79 4.80 7.86 3.64 5.70)
		do: [ :x | accC accumulate: x ].
	accMM := PMStatisticalMoments new.
	#(7.48 6.75 3.77 5.71 7.25 4.73 6.23 5.60 5.94 4.58)
		do: [ :x | accMM accumulate: x ].
	confidenceLevel := accC tConfidenceLevel: accMM.
	self assert: (accC average - 5.393) abs < 0.000000001.
	self
		assert: (accC standardDeviation - 1.0990809292) abs < 0.000000001.
	self assert: (accMM average - 5.804) abs < 0.000000001.
	self assert: (accMM standardDeviation - 1.19415428) abs < 0.000000001.
	self assert: (confidenceLevel - 56.6320739989) abs < 0.000000001
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testVectorMatrixOperation [
	"Code Example 8.1"

	| a u v |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	u := #(1 2 3) asPMVector.
	v := a * u.
	self assert: v size equals: 2.
	self assert: (v at: 1) equals: 4.
	self assert: (v at: 2) equals: 4
]

{ #category : #'linear algebra' }
PMNumericalMethodsTestCase >> testVectorTransposeMatrixOperation [
	"Code Example 8.1"

	| c v w |
	c := PMMatrix rows: #(#(6 8 10) #(18 14 4)).
	v := #(4 4) asPMVector.
	w := c transpose * v.
	self assert: w size equals: 3.
	self assert: (w at: 1) equals: 96.
	self assert: (w at: 2) equals: 88.
	self assert: (w at: 3) equals: 56
]
