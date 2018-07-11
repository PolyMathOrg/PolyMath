"
Test to check FloatingPoint numbers with arbitrary precision
"
Class {
	#name : #ArbitraryPrecisionFloatTest,
	#superclass : #TestCase,
	#instVars : [
		'zero',
		'one',
		'two',
		'half',
		'minusOne',
		'minusTwo',
		'huge'
	],
	#category : 'Math-Tests-ArbitraryPrecisionFloat'
}

{ #category : #accessing }
ArbitraryPrecisionFloatTest class >> defaultTimeLimit [

^ 120 seconds
]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkDoublePrecision: y forFunction: func nBits: n [
	"Check that doubling the precision, then rounding would lead to the same result"
	
	| anArbitraryPrecisionFloat singlePrecisionResult |
	anArbitraryPrecisionFloat := y asArbitraryPrecisionFloatNumBits: n.
	singlePrecisionResult := anArbitraryPrecisionFloat perform: func.
	self checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult.
	^singlePrecisionResult
]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkDoublePrecisionSerie: serie forFunction: func [ 
	^self checkDoublePrecisionSerie: serie forFunction: func nBits: Float precision
]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkDoublePrecisionSerie: serie forFunction: func nBits: n [
	serie do: [:y | self checkDoublePrecision: y forFunction: func nBits: n]
]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkDoublePrecisionSerieVsFloat: serie forFunction: func [ 
	^serie reject: [:y |
		| farb |
		farb := self checkDoublePrecision: y forFunction: func nBits: Float precision.
		[(y asFloat perform: func) = farb] on: ZeroDivide do: [false]]
]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult [
	"Check that doubling the precision, then rounding would lead to the same result"
	
	| n doublePrecision doublePrecisionResult lowBits |
	n := anArbitraryPrecisionFloat numBits.
	doublePrecision := anArbitraryPrecisionFloat asArbitraryPrecisionFloatNumBits: n * 2.
	doublePrecisionResult := doublePrecision perform: func.
	
	"Note: the test must be guarded against double rounding error condition.
	For example, suppose the single precision is 4 bits, double precision 8 bits.
	If exact result is 1.001 | 0111 | 1001...
	Then the nearest double is rounded to upper 1.001 | 1000
	Then the nearest single to the double is rounded to upper 1.010
	But the nearest single to the exact result should have been 1.001
	To avoid this, we have to check if the second rounding is an exact tie"
	doublePrecisionResult normalize.
	lowBits := doublePrecisionResult mantissa bitAnd: 1<<n-1.
	lowBits = (1<<(n-1))
		ifTrue:
			["double precision is ambiguous - retry with quadruple..."
			^self checkThatEvaluatingFunction: func toQuadruplePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult].
	self assert: ((doublePrecisionResult asArbitraryPrecisionFloatNumBits: n)- singlePrecisionResult) isZero
	

]

{ #category : #private }
ArbitraryPrecisionFloatTest >> checkThatEvaluatingFunction: func toQuadruplePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult [
	"Check that quadrupling the precision, then rounding would lead to the same result"
	
	| n quadruplePrecision quadruplePrecisionResult lowBits |
	n := anArbitraryPrecisionFloat numBits.
	quadruplePrecision := anArbitraryPrecisionFloat asArbitraryPrecisionFloatNumBits: n * 4.
	quadruplePrecisionResult := quadruplePrecision perform: func.
	
	"Guard against double rounding error condition (exact tie)"
	quadruplePrecisionResult normalize.
	lowBits := quadruplePrecisionResult mantissa bitAnd: 1<<(3*n)-1.
	lowBits = (1<<(3*n-1))
		ifTrue:
			["quadruple precision is ambiguous - give up..."
			^self].
	self assert: ((quadruplePrecisionResult asArbitraryPrecisionFloatNumBits: n)- singlePrecisionResult) isZero.
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> hyperbolicSerie [
	^#(-3.0e0  -0.1e0  0.0e0  1.0e-20  1.0e-10  0.99e0 1.0e0  2.5e0  3.0e0  10.25e0) , (Array with: (3/10) asFloat with: (22/7) asFloat)
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> inverseTrigonometricSerie [
	^((-20 to: 20) collect: [:e | (e / 20) asFloat]) , ((-6 to: 6) collect: [:e | (e / 7) asFloat])
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> largeTrigonometricSerie [
	^#(1.0e15 1.1e21 1.2e28 1.0e32 1.1e34 -1.23e51 1.345e67 1.777e151 1.211e308)
]

{ #category : #setup }
ArbitraryPrecisionFloatTest >> setUp [
	zero := 0 asArbitraryPrecisionFloatNumBits: 53.
	one := 1 asArbitraryPrecisionFloatNumBits: 53.
	two := 2 asArbitraryPrecisionFloatNumBits: 53.
	half := 1/2 asArbitraryPrecisionFloatNumBits: 53.
	minusOne := -1 asArbitraryPrecisionFloatNumBits: 53.
	minusTwo := -2 asArbitraryPrecisionFloatNumBits: 53.
	huge := (10 raisedTo: 100) asArbitraryPrecisionFloatNumBits: 53.
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testArCosh [
	<timeout: 5 "seconds">
	| serie |
	serie := ((1 to: 10) , #(1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arCosh
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testArCoshDomainError [
	self should: [(1/2 asArbitraryPrecisionFloatNumBits: 24) arCosh] raise: DomainError.
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testArSinh [
	<timeout: 10 "seconds">
	| serie |
	serie := ((-5 to: 10) , #(1.0e-20 1.0e-10  0.9999 1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arSinh
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testArTanh [
	<timeout: 20 "seconds">
	| serie |
	serie := ((-19 to: 19) collect: [:e | (e / 20) asFloat]) , ((-6 to: 6) collect: [:e | (e / 7) asFloat]) , #(1.0e-20 1.0e-10 0.99 0.9999 0.999999).
	self checkDoublePrecisionSerie: serie forFunction: #arTanh
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testArTanhDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcCos [
	<timeout: 10 "seconds">
	| badArcCos |
	badArcCos := self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcCos.
	badArcCos isEmpty ifFalse: [Transcript cr; show: 'bad arcCos for ' , badArcCos printString]
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcCosDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcSin [
	<timeout: 10 "seconds">
	| badArcSin |
	badArcSin := self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcSin.
	badArcSin isEmpty ifFalse: [Transcript cr; show: 'bad arcSin for ' , badArcSin printString]
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcSinDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcTan [
	<timeout: 10 "seconds">
	| badArcTan serie |
	serie := ((-50 to: 50) collect: [:e | (e / 10) asFloat]).
	badArcTan := self checkDoublePrecisionSerieVsFloat: serie forFunction: #arcTan.
	badArcTan isEmpty ifFalse: [Transcript cr; show: 'bad arcTan for ' , badArcTan printString]
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testArcTan2 [
	<timeout: 30 "seconds">
	-5 to: 5 by: 4/10 do: [:y |
		| yf yd |
		yf := y asArbitraryPrecisionFloatNumBits: Float precision.
		yd := yf asArbitraryPrecisionFloatNumBits: Float precision * 2.
		-5 to: 5 by: 4/10 do: [:x |
			| xf xd  |
			xf := x asArbitraryPrecisionFloatNumBits: Float precision.
			xd := xf asArbitraryPrecisionFloatNumBits: Float precision * 2.
			self assert: ((yd arcTan: xd) asFloat - (yf arcTan: xf) asFloat) isZero]].
]

{ #category : #'testing-converting' }
ArbitraryPrecisionFloatTest >> testAsFloat [
	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision) asFloat = 0.5e0.
	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision * 2) asFloat = 0.5e0.
]

{ #category : #'testing-converting' }
ArbitraryPrecisionFloatTest >> testAsFloatWithUnderflow [
	| fmin fminA |
	fmin := Float fmin.
	fminA := fmin asArbitraryPrecisionFloatNumBits: one numBits.
	Float emin - Float precision + 1 to: Float emin + 1 do: [:n |
		self assert: ((one timesTwoPower: n) + fminA) asFloat = ((1.0e0 timesTwoPower: n) + fmin)].
]

{ #category : #'testing-converting' }
ArbitraryPrecisionFloatTest >> testAsMinimalDecimalFraction [
	| emax emin leadingOne significands |
	significands := 0 to: 1<<10-1.
	leadingOne := 1<<10.
	emin := -14.
	emax := 15.
	
	"Test all normal finite half precision float"
	emin to: emax do: [:e | 
		significands do: [:s |
			| f |
			f := (leadingOne + s asArbitraryPrecisionFloatNumBits: 11) timesTwoPower: e - 10.
			self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: 11) = f]].
	
	"Test all subnormal finite half precision float"
	significands do: [:s |
		| f |
		f := (s asArbitraryPrecisionFloatNumBits: s highBit) timesTwoPower: emin - 10.
		self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: s highBit) = f].
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingDivide [
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: one / heteroHalf = two.
		self assert: (one / heteroHalf) class = one class.
		self assert: (one / heteroHalf) numBits = one numBits.
		self assert: heteroHalf / one = half.
		self assert: (heteroHalf / one) class = one class.
		self assert: (heteroHalf / one) numBits = one numBits].

	self assert: one / 2 = half.
	self assert: (one / 2) class = one class.
	self assert: (one / 2) numBits = one numBits.
	self assert: -2 / two = minusOne.
	self assert: (-2 / two) class = two class.
	self assert: (-2 / two) numBits = two numBits.
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingEqual [
	self assert: half = (1/2).
	self assert: (1/2) = half.
	self deny: half = (1/3).
	self deny: (1/3) = half.

	self assert: two = 2.
	self assert: -2 = minusTwo.
	self deny: -3 = two.
	self deny: two = 3.

	self assert: half = (0.5e0).
	self assert: (0.5e0) = half.
	self deny: half = (0.33e0).
	self deny: (0.33e0) = half.

	self assert: half = (0.5s1).
	self assert: (0.5s1) = half.
	self deny: half = (0.33s2).
	self deny: (0.33s2) = half.
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingLessThan [
	self deny: half < (1/2).
	self assert: (1/3) < half.
	self assert: minusOne < (1/2).
	self deny: (1/3) < minusTwo.

	self assert: two < 3.
	self deny: two < 2.
	self deny: two < 1.
	self deny: two < -1.
	self assert:  minusTwo < -1.
	self assert:  minusTwo < 1.
	self deny: minusTwo < -2.
	self deny: minusTwo < -3.

	self deny: half < (0.5e0).
	self deny: half < (0.33e0).
	self assert: half < (0.66e0).
	self deny: (0.5e0) < half.
	self assert: (0.33e0) < half.
	self deny: (0.66e0) < half.

	self deny: half < (0.5s1).
	self deny: half < (0.33s2).
	self assert: half < (0.66s2).
	self deny: (0.5s1) < half.
	self assert: (0.33s2) < half.
	self deny: (0.66s2) < half.
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingMultiply [
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: two * heteroHalf = one.
		self assert: (two * heteroHalf) class = half class.
		self assert: (two * heteroHalf) numBits = half numBits.
		self assert: heteroHalf * two = one.
		self assert: (heteroHalf * two) class = half class.
		self assert: (heteroHalf * two) numBits = half numBits].

	self assert: minusOne * 2 = minusTwo.
	self assert: (minusOne * 2) class = minusOne class.
	self assert: (minusOne * 2) numBits = minusOne numBits.
	self assert: 2 * one = two.
	self assert: (2 * one) class = one class.
	self assert: (2 * one) numBits = one numBits.
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingSubtract [
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: half - heteroHalf = zero.
		self assert: (half - heteroHalf) class = half class.
		self assert: (half - heteroHalf) numBits = half numBits.
		self assert: heteroHalf - half = zero.
		self assert: (heteroHalf - half) class = half class.
		self assert: (heteroHalf - half) numBits = half numBits].

	self assert: one - 1 = zero.
	self assert: (one - 1) class = minusOne class.
	self assert: (one - 1) numBits = minusOne numBits.
	self assert: -2 - minusTwo = zero.
	self assert: (-2 - minusTwo) class = minusTwo class.
	self assert: (-2 - minusTwo) numBits = minusTwo numBits.
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testCoercingSum [
	(Array with: 1/2 with: 0.5e0 with: 0.5s1) do: [:heteroHalf |
		self assert: half + heteroHalf = one.
		self assert: (half + heteroHalf) class = half class.
		self assert: (half + heteroHalf) numBits = half numBits.
		self assert: heteroHalf + half = one.
		self assert: (heteroHalf + half) class = half class.
		self assert: (heteroHalf + half) numBits = half numBits].

	self assert: minusOne + 1 = zero.
	self assert: (minusOne + 1) class = minusOne class.
	self assert: (minusOne + 1) numBits = minusOne numBits.
	self assert: 2 + minusTwo = zero.
	self assert: (2 + minusTwo) class = minusTwo class.
	self assert: (2 + minusTwo) numBits = minusTwo numBits.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testCos [
	<timeout: 30 "seconds">
	| badCos |
	badCos := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #cos.
	badCos isEmpty ifFalse: [Transcript cr; show: 'bad cos for angles (degrees) ' , (badCos collect: [:i | i radiansToDegrees rounded]) printString]
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testCosh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #cosh
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testDivide [
	| serie |
	serie := {1. 2. 3. 5. 6. 7. 9. 10. 11. 12. 19. 243. 10 raisedTo: Float precision + 1. Float precision factorial. Float pi.}.
	serie do: [:num |
		| nf na |
		nf := num asFloat.
		na := num asArbitraryPrecisionFloatNumBits: Float precision.
		serie do:[:den |
			| df da ff fa |
			df := den asFloat.
			da := den asArbitraryPrecisionFloatNumBits: Float precision.
			ff := nf / df.
			fa := na / da.
			self assert: ff = fa]].
]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testEqual [
	self assert: zero = zero.
	self assert: one = one.
	self assert: one = one copy.
	self assert: one = (one asArbitraryPrecisionFloatNumBits: one numBits * 2).

	self deny: zero = one.
	self deny: minusOne = one.

	self assert: zero = 0.
	self assert: 0 = zero.
	self assert: zero = 0.0.
	self assert: 0.0 = zero.

	self deny: two = (1/2).
	self deny: (1/2) = two.
	self deny: zero = 1.0.
	self deny: 0.0 = one.

	self deny: one = nil.
	self deny: nil = one.
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testExp [
	<timeout: 10 "seconds">
	| badExp serie |
	serie := ((-20 to: 20) collect: [:e |e asFloat]).
	badExp := self checkDoublePrecisionSerieVsFloat: serie forFunction: #exp.
	badExp isEmpty ifFalse: [Transcript cr; show: 'bad exp for ' , badExp printString]
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testExpLn [
	|n|
	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 1 asFloat exp.
	n := 5 exp.
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp - n)abs <= n ulp.
	"self assert: (5 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 5 asFloat exp."
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp ln asFloat - n ln)abs <= 5.0 ulp.
	"this test was skipped. changed that & loosened 2. test,
	 since '5 exp' seems to round up instead of down here,
	 which results in an error of almost one ulp in '5 exp'"
]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testGreaterThan [
	
	self assert: zero < one.
	self deny: one > two.
	self deny: two > huge.
	self deny: minusOne > one.
	self deny: minusTwo > minusOne.
	self deny: minusTwo > huge.
	
	self assert: huge > one.
	self assert: huge > zero.
	self assert: huge > minusOne.
	self assert: one > minusOne.
	self assert: minusOne > minusTwo.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testIEEEArithmeticVersusFloat [
	| floats ops ref new |
	floats := #(1.0 2.0 3.0 5.0 10.0 2r1.0e52 2r1.0e53 2r1.0e54 0.5 0.25 2r1.0e-52 2r1.0e-53 2r1.0e-54 1.0e60 0.1 1.1e-30 1.0e-60) copyWith: Float pi.
	ops := #(#+ #- #* #/ #= #< #> ).
	ops
		do: [:op | floats
				do: [:f1 | floats
						do: [:f2 | 
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53)
										perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref]]]
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testIEEEArithmeticVersusIntegerAndFraction [
	"check that results are the same as IEEE 754 accelerated hardware
	WARNING: this cannot be the case for denormalized numbers (gradual underflow)
	because our exponent is unlimited"

	| floats ops ref new intAndFractions |
	floats := #(1.0e0 2.0e0 3.0e0 5.0e0 10.0e0) 
				, (#(52 53 54 -52 -53 -54) collect: [:e | 1.0e0 timesTwoPower: e]) 
					, #(0.5e0 0.25e0 1.0e60 0.1e0 1.1e-30 1.0e-60) copyWith: Float pi.
	intAndFractions := #(1 3 5 10 12345678901234567890 -1 -22 -3 1.2s1) copyWith: 7/9.
	intAndFractions := intAndFractions , (intAndFractions collect: [:e | e reciprocal]).
	
	ops := 1/10 = 0.1
		ifTrue: [#(#+ #- #* #/)]
		ifFalse: [#(#+ #- #* #/ #= #< #>)]. "BEWARE: ArbitraryPrecisionFloat compare exactly, Float don't, unless http://bugs.squeak.org/view.php?id=3374"
	ops do: 
			[:op | 
			floats do: 
					[:f1 | 
					intAndFractions do: 
							[:f2 | 
							ref := f1 perform: op with: f2 asFloat.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							new := f1 perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: f2.
							self assert: new = ref.
							
							ref := f2 asFloat perform: op with: f1.
							new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op with: f1.
							self assert: new = ref.
							
							ref := f2 perform: op with: f1.
							new := f2 perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref]]]
]

{ #category : #'testing-coercing' }
ArbitraryPrecisionFloatTest >> testInfinityAndNaN [
	| inf nan |
	inf := Float infinity.
	nan := Float nan.
	self assert: inf + two equals: inf.
	self assert: half + inf negated equals: inf negated.	
	self assert: (nan + minusOne)  isNaN .
	self assert: inf - huge equals: inf.
	self assert: half - inf equals: inf negated.
	self assert: minusTwo - inf negated equals: inf.
	self assert: (one - nan) isNaN.
	self assert: inf * two equals: inf.
	self assert: minusOne * inf equals: inf negated.
	self assert: inf negated * minusOne equals: inf.
	self assert: (huge * nan) isNaN.
	self assert: inf negated / minusTwo equals: inf.
	self assert: zero / inf negated equals: 0.	
	self assert: one / inf equals: 0.
	self should: [inf / zero] raise: ZeroDivide.	
	self assert: (nan  / two) isNaN.	
	self assert: (inf raisedTo: huge) equals: inf.
	self assert: (huge raisedTo: inf) equals: inf.
	self assert: (nan raisedTo: two) isNaN.
	self assert: (two raisedTo: nan) isNaN.
	self deny: nan <= one.
	self deny: zero >= nan.
	self assert: one < inf.
	self assert: zero ~= nan.
	self deny: nan = one.
]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testIsZero [
	self assert: zero isZero.
	self deny: one isZero.
	self deny: minusTwo isZero.
]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testLessThan [
	
	self assert: zero < one.
	self assert: one < two.
	self assert: two < huge.
	self assert: minusOne < one.
	self assert: minusTwo < minusOne.
	self assert: minusTwo < huge.
	
	self deny: huge < one.
	self deny: huge < zero.
	self deny: huge < minusOne.
	self deny: one < minusOne.
	self deny: minusOne < minusTwo.
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testLn [
	<timeout: 10 "seconds">
	| badLn serie |
	serie := ((1 to: 100) collect: [:e |e asFloat]).
	badLn := self checkDoublePrecisionSerieVsFloat: serie forFunction: #ln.
	badLn isEmpty ifFalse: [Transcript cr; show: 'bad ln for ' , badLn printString]
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testLnDomainError [
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) ln] raise: DomainError.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testMultiply [
	self assert: zero * zero = zero.
	self assert: zero * minusOne = zero.
	self assert: huge * zero = zero.
	self assert: one * zero = zero.
	
	self assert: one * two = two.
	self assert: minusOne * one = minusOne.
	self assert: minusOne * minusTwo = two.
	
	self assert: half * two = one.
	
	"check rounding"
	self assert: huge * one = huge.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testNegated [
	self assert: zero negated = zero.
	self assert: one negated = minusOne.
	self assert: minusTwo negated = two.
	self assert: huge negated negated = huge.

]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testNegative [
	
	self deny: zero negative.
	self deny: two negative.
	self assert: minusTwo negative.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testPi [
	"check computation of pi"

	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) pi = Float pi.
]

{ #category : #'testing-compare' }
ArbitraryPrecisionFloatTest >> testPositive [
	
	self assert: zero positive.
	self assert: one positive.
	self deny: minusOne positive.
]

{ #category : #'testing-converting' }
ArbitraryPrecisionFloatTest >> testPrintAndEvaluate [
	"seconds"

	<timeout: 50>
	| emax emin leadingOne significands |
	significands := 0 to: (1 << 10) - 1.
	leadingOne := 1 << 10.
	emin := -14.
	emax := 15.

	"Test all normal finite half precision float"
	emin to: emax do: [ :e | 
		significands
			do: [ :s | 
				| f |
				f := (leadingOne + s asArbitraryPrecisionFloatNumBits: 11)
					timesTwoPower: e - 10.
				self
					assert: (Smalltalk compiler evaluate: f storeString)
					equals: f.
				self
					assert: (Smalltalk compiler evaluate: f printString)
					equals: f ] ].

	"Test all subnormal finite half precision float"
	significands
		do: [ :s | 
			| f |
			f := (s asArbitraryPrecisionFloatNumBits: s highBit)
				timesTwoPower: emin - 10.
			self assert: (Smalltalk compiler evaluate: f storeString) equals: f.
			self assert: (Smalltalk compiler evaluate: f printString) equals: f ]
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testRaisedToNegativeInteger [
	| n |
	n := 11.
	1 to: 1<<n-1 do: [:i |
		self assert: ((i asArbitraryPrecisionFloatNumBits: n) raisedToInteger: -49)
			equals: ((i raisedToInteger: -49) asArbitraryPrecisionFloatNumBits: n) ].
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testRaisedToPositiveInteger [
	| n |
	n := 11.
	1 to: 1<<n-1 do: [:i |
		self assert: ((i asArbitraryPrecisionFloatNumBits: n) raisedToInteger: 49)
			equals: ((i raisedToInteger: 49) asArbitraryPrecisionFloatNumBits: n) ].
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testReciprocal [
	| b |
	b := 1 << (Float precision - 1).
	1 to: 10000 do: [:i |
		| a |
		a := i asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: a reciprocal = i asFloat reciprocal.
		self assert: (a+b) reciprocal = (i+b) asFloat reciprocal.
		self assert: a negated reciprocal = i asFloat negated reciprocal.]
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testRoundToNearestEven [
	"Check that IEEE default rounding mode is honoured,
	that is rounding to nearest even"
		
	self assert: ((one timesTwoPower: 52)+(0+(1/4))) asTrueFraction = ((1 bitShift: 52)+0).
	self assert: ((one timesTwoPower: 52)+(0+(1/2))) asTrueFraction = ((1 bitShift: 52)+0).
	self assert: ((one timesTwoPower: 52)+(0+(3/4))) asTrueFraction = ((1 bitShift: 52)+1).
	self assert: ((one timesTwoPower: 52)+(1+(1/4))) asTrueFraction = ((1 bitShift: 52)+1).
	self assert: ((one timesTwoPower: 52)+(1+(1/2))) asTrueFraction = ((1 bitShift: 52)+2).
	self assert: ((one timesTwoPower: 52)+(1+(3/4))) asTrueFraction = ((1 bitShift: 52)+2).
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testRoundToNearestEvenAgainstIEEEDouble [
	"Check that IEEE default rounding mode is honoured"

	#(1 2 3 5 6 7) do: 
			[:i | 
			self assert: ((one timesTwoPower: 52) + (i / 4)) asTrueFraction 
						= ((1 asFloat timesTwoPower: 52) + (i / 4)) asTrueFraction.
			self assert: ((one timesTwoPower: 52) - (i / 4)) asTrueFraction 
						= ((1 asFloat timesTwoPower: 52) - (i / 4)) asTrueFraction]
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testSin [
	<timeout: 30 "seconds">
	| badSin |
	badSin := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #sin.
	badSin isEmpty ifFalse: [Transcript cr; show: 'bad sin for angles (degrees) ' , (badSin collect: [:i | i radiansToDegrees rounded]) printString]
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testSincos [
	<timeout: 30 "seconds">
	self trigonometricSerie do: [:aFloat |
		| x sc s c |
		x := aFloat asArbitraryPrecisionFloatNumBits: 53.
		sc := x sincos.
		s := x sin.
		c := x cos.
		self assert: sc size = 2.

		self assert: sc first = s.
		self assert: sc last = c]
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testSinh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #sinh
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testSqrt [
	<timeout: 10 "seconds">
	| badSqrt serie |
	"knowing that (10**3) < (2**10), 100 bits are enough for representing 10**30 exactly"
	self assert: ((10 raisedTo: 30) asArbitraryPrecisionFloatNumBits: 100) sqrt = (10 raisedTo: 15).

	serie := ((0 to: 20) collect: [:e | e asFloat]) , ((2 to: 20) collect: [:e | e reciprocal asFloat]).
	badSqrt := self checkDoublePrecisionSerieVsFloat: serie forFunction: #sqrt.
	badSqrt isEmpty ifFalse: [Transcript cr; show: 'bad sqrt for ' , badSqrt printString]
]

{ #category : #'testing-functions' }
ArbitraryPrecisionFloatTest >> testSqrtDomainError [
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) sqrt] raise: DomainError.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testSubtract [
	self assert: zero - zero = zero.
	self assert: zero - minusOne = one.
	self assert: huge - zero = huge.
	self assert: one - zero = one.
	
	self assert: one - minusOne = two.
	self assert: minusOne - minusTwo = one.
	self assert: minusOne - one = minusTwo.
	
	"check rounding"
	self assert: huge - one = huge.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testSum [
	self assert: zero + zero = zero.
	self assert: zero + minusOne = minusOne.
	self assert: huge + zero = huge.
	self assert: one + zero = one.
	
	self assert: one + minusOne = zero.
	self assert: minusOne + two = one.
	self assert: one + minusTwo = minusOne.
	
	"check rounding"
	self assert: huge + one = huge.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testTan [
	<timeout: 30 "seconds">
	| badTan |
	badTan := self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #tan.
	badTan isEmpty ifFalse: [Transcript cr; show: 'bad tan for angles (degrees) ' , (badTan collect: [:i | i radiansToDegrees rounded]) printString]
]

{ #category : #'testing-hyperbolic' }
ArbitraryPrecisionFloatTest >> testTanh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #tanh
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testVeryLargeCos [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #cos.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testVeryLargeSin [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #sin.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> testVeryLargeTan [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #tan.
]

{ #category : #'testing-arithmetic' }
ArbitraryPrecisionFloatTest >> testZeroOne [

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one = 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero isZero.

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one asInteger = 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero asInteger isZero.
]

{ #category : #'testing-trigonometry' }
ArbitraryPrecisionFloatTest >> trigonometricSerie [
	^(-720 to: 720) collect: [:i | i asFloat degreesToRadians]
]
