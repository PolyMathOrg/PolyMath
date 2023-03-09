"
Test to check FloatingPoint numbers with arbitrary precision
"
Class {
	#name : #PMArbitraryPrecisionFloatTest,
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
	#category : #'Math-Tests-ArbitraryPrecisionFloat'
}

{ #category : #accessing }
PMArbitraryPrecisionFloatTest class >> defaultTimeLimit [
^ 120 seconds
]

{ #category : #private }
PMArbitraryPrecisionFloatTest >> checkDoublePrecision: y forFunction: func nBits: n [
	"Check that doubling the precision, then rounding would lead to the same result"

	| anArbitraryPrecisionFloat singlePrecisionResult |
	anArbitraryPrecisionFloat := y asArbitraryPrecisionFloatNumBits: n.
	singlePrecisionResult := anArbitraryPrecisionFloat perform: func.
	self checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult.
	^singlePrecisionResult
]

{ #category : #private }
PMArbitraryPrecisionFloatTest >> checkDoublePrecisionSerie: serie forFunction: func [
	^self checkDoublePrecisionSerie: serie forFunction: func nBits: Float precision
]

{ #category : #private }
PMArbitraryPrecisionFloatTest >> checkDoublePrecisionSerie: serie forFunction: func nBits: n [
	serie do: [:y | self checkDoublePrecision: y forFunction: func nBits: n]
]

{ #category : #private }
PMArbitraryPrecisionFloatTest >> checkDoublePrecisionSerieVsFloat: serie forFunction: func [
	^serie reject: [:y |
		| farb |
		farb := self checkDoublePrecision: y forFunction: func nBits: Float precision.
		[(y asFloat perform: func) = farb] on: ZeroDivide do: [false]]
]

{ #category : #private }
PMArbitraryPrecisionFloatTest >> checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult [
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
PMArbitraryPrecisionFloatTest >> checkThatEvaluatingFunction: func toQuadruplePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult [
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
	self assert: ((quadruplePrecisionResult asArbitraryPrecisionFloatNumBits: n)- singlePrecisionResult) isZero
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> hyperbolicSerie [
	^#(-3.0e0  -0.1e0  0.0e0  1.0e-20  1.0e-10  0.99e0 1.0e0  2.5e0  3.0e0  10.25e0) , (Array with: (3/10) asFloat with: (22/7) asFloat)
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> inverseTrigonometricSerie [
	^((-20 to: 20) collect: [:e | (e / 20) asFloat]) , ((-6 to: 6) collect: [:e | (e / 7) asFloat])
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> largeTrigonometricSerie [
	^#(1.0e15 1.1e21 1.2e28 1.0e32 1.1e34 -1.23e51 1.345e67 1.777e151 1.211e308)
]

{ #category : #running }
PMArbitraryPrecisionFloatTest >> setUp [
	zero := 0 asArbitraryPrecisionFloatNumBits: 53.
	one := 1 asArbitraryPrecisionFloatNumBits: 53.
	two := 2 asArbitraryPrecisionFloatNumBits: 53.
	half := 1/2 asArbitraryPrecisionFloatNumBits: 53.
	minusOne := -1 asArbitraryPrecisionFloatNumBits: 53.
	minusTwo := -2 asArbitraryPrecisionFloatNumBits: 53.
	huge := (10 raisedTo: 100) asArbitraryPrecisionFloatNumBits: 53
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testArCosh [
	<timeout: 5 "seconds">
	| serie |
	serie := ((1 to: 10) , #(1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arCosh
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testArCoshDomainError [
	self should: [(1/2 asArbitraryPrecisionFloatNumBits: 24) arCosh] raise: DomainError
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testArSinh [
	<timeout: 10 "seconds">
	| serie |
	serie := ((-5 to: 10) , #(1.0e-20 1.0e-10  0.9999 1.0001 100 1000 1.0e20)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #arSinh
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testArTanh [
	<timeout: 20 "seconds">
	| serie |
	serie := ((-19 to: 19) collect: [:e | (e / 20) asFloat]) , ((-6 to: 6) collect: [:e | (e / 7) asFloat]) , #(1.0e-20 1.0e-10 0.99 0.9999 0.999999).
	self checkDoublePrecisionSerie: serie forFunction: #arTanh
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testArTanhDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arTanh] raise: DomainError
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcCos [
	"seconds"

	<timeout: 10>
	self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcCos
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcCosDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcCos] raise: DomainError
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcSin [
	"seconds"

	<timeout: 10>
	self checkDoublePrecisionSerieVsFloat: self inverseTrigonometricSerie forFunction: #arcSin
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcSinDomainError [
	self should: [(2 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError.
	self should: [(-3 asArbitraryPrecisionFloatNumBits: 24) arcSin] raise: DomainError
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcTan [
	"seconds"

	<timeout: 10>
	| serie |
	serie := (-50 to: 50) collect: [ :e | (e / 10) asFloat ].
	self checkDoublePrecisionSerieVsFloat: serie forFunction: #arcTan
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testArcTan2 [
	<timeout: 30 "seconds">
	-5 to: 5 by: 4/10 do: [:y |
		| yf yd |
		yf := y asArbitraryPrecisionFloatNumBits: Float precision.
		yd := yf asArbitraryPrecisionFloatNumBits: Float precision * 2.
		-5 to: 5 by: 4/10 do: [:x |
			| xf xd  |
			xf := x asArbitraryPrecisionFloatNumBits: Float precision.
			xd := xf asArbitraryPrecisionFloatNumBits: Float precision * 2.
			self assert: ((yd arcTan: xd) asFloat - (yf arcTan: xf) asFloat) isZero]]
]

{ #category : #'testing-converting' }
PMArbitraryPrecisionFloatTest >> testAsFloat [

	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision) asFloat equals: 0.5e0.
	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision * 2) asFloat equals: 0.5e0
]

{ #category : #'testing-converting' }
PMArbitraryPrecisionFloatTest >> testAsFloatWithUnderflow [

	| fmin fminA |
	fmin := Float fmin.
	fminA := fmin asArbitraryPrecisionFloatNumBits: one numBits.
	Float emin - Float precision + 1 to: Float emin + 1 do: [ :n | self assert: ((one timesTwoPower: n) + fminA) asFloat equals: (1.0e0 timesTwoPower: n) + fmin ]
]

{ #category : #'testing-converting' }
PMArbitraryPrecisionFloatTest >> testAsMinimalDecimalFraction [

	| emax emin leadingOne significands |
	significands := 0 to: 1 << 10 - 1.
	leadingOne := 1 << 10.
	emin := -14.
	emax := 15.

	"Test all normal finite half precision float"
	emin to: emax do: [ :e |
		significands do: [ :s |
			| f |
			f := (leadingOne + s asArbitraryPrecisionFloatNumBits: 11) timesTwoPower: e - 10.
			self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: 11) equals: f ] ].

	"Test all subnormal finite half precision float"
	significands do: [ :s |
		| f |
		f := (s asArbitraryPrecisionFloatNumBits: s highBit) timesTwoPower: emin - 10.
		self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: s highBit) equals: f ]
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingDivide [

	(Array with: 1 / 2 with: 0.5e0 with: 0.5s1) do: [ :heteroHalf |
		self assert: one / heteroHalf equals: two.
		self assert: (one / heteroHalf) class equals: one class.
		self assert: (one / heteroHalf) numBits equals: one numBits.
		self assert: heteroHalf / one equals: half.
		self assert: (heteroHalf / one) class equals: one class.
		self assert: (heteroHalf / one) numBits equals: one numBits ].

	self assert: one / 2 equals: half.
	self assert: (one / 2) class equals: one class.
	self assert: (one / 2) numBits equals: one numBits.
	self assert: -2 / two equals: minusOne.
	self assert: (-2 / two) class equals: two class.
	self assert: (-2 / two) numBits equals: two numBits
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingEqual [

	self assert: half equals: 1 / 2.
	self assert: 1 / 2 equals: half.
	self deny: half equals: 1 / 3.
	self deny: 1 / 3 equals: half.

	self assert: two equals: 2.
	self assert: -2 equals: minusTwo.
	self deny: -3 equals: two.
	self deny: two equals: 3.

	self assert: half equals: 0.5e0.
	self assert: 0.5e0 equals: half.
	self deny: half equals: 0.33e0.
	self deny: 0.33e0 equals: half.

	self assert: half equals: 0.5s1.
	self assert: 0.5s1 equals: half.
	self deny: half equals: 0.33s2.
	self deny: 0.33s2 equals: half
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingLessThan [
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
	self deny: (0.66s2) < half
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingMultiply [

	(Array with: 1 / 2 with: 0.5e0 with: 0.5s1) do: [ :heteroHalf |
		self assert: two * heteroHalf equals: one.
		self assert: (two * heteroHalf) class equals: half class.
		self assert: (two * heteroHalf) numBits equals: half numBits.
		self assert: heteroHalf * two equals: one.
		self assert: (heteroHalf * two) class equals: half class.
		self assert: (heteroHalf * two) numBits equals: half numBits ].

	self assert: minusOne * 2 equals: minusTwo.
	self assert: (minusOne * 2) class equals: minusOne class.
	self assert: (minusOne * 2) numBits equals: minusOne numBits.
	self assert: 2 * one equals: two.
	self assert: (2 * one) class equals: one class.
	self assert: (2 * one) numBits equals: one numBits
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingSubtract [

	(Array with: 1 / 2 with: 0.5e0 with: 0.5s1) do: [ :heteroHalf |
		self assert: half - heteroHalf equals: zero.
		self assert: (half - heteroHalf) class equals: half class.
		self assert: (half - heteroHalf) numBits equals: half numBits.
		self assert: heteroHalf - half equals: zero.
		self assert: (heteroHalf - half) class equals: half class.
		self assert: (heteroHalf - half) numBits equals: half numBits ].

	self assert: one - 1 equals: zero.
	self assert: (one - 1) class equals: minusOne class.
	self assert: (one - 1) numBits equals: minusOne numBits.
	self assert: -2 - minusTwo equals: zero.
	self assert: (-2 - minusTwo) class equals: minusTwo class.
	self assert: (-2 - minusTwo) numBits equals: minusTwo numBits
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testCoercingSum [

	(Array with: 1 / 2 with: 0.5e0 with: 0.5s1) do: [ :heteroHalf |
		self assert: half + heteroHalf equals: one.
		self assert: (half + heteroHalf) class equals: half class.
		self assert: (half + heteroHalf) numBits equals: half numBits.
		self assert: heteroHalf + half equals: one.
		self assert: (heteroHalf + half) class equals: half class.
		self assert: (heteroHalf + half) numBits equals: half numBits ].

	self assert: minusOne + 1 equals: zero.
	self assert: (minusOne + 1) class equals: minusOne class.
	self assert: (minusOne + 1) numBits equals: minusOne numBits.
	self assert: 2 + minusTwo equals: zero.
	self assert: (2 + minusTwo) class equals: minusTwo class.
	self assert: (2 + minusTwo) numBits equals: minusTwo numBits
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testCos [
	"seconds"

	<timeout: 30>
	self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #cos
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testCosh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #cosh
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testDivide [

	| serie |
	serie := #( 1 2 3 5 6 7 9 10 11 12 19 243 ) asOrderedCollection
		         add: (10 raisedTo: Float precision + 1);
		         add: Float precision factorial;
		         add: Float pi;
		         asArray.
	serie do: [ :num |
		| nf na |
		nf := num asFloat.
		na := num asArbitraryPrecisionFloatNumBits: Float precision.
		serie do: [ :den |
			| df da ff fa |
			df := den asFloat.
			da := den asArbitraryPrecisionFloatNumBits: Float precision.
			ff := nf / df.
			fa := na / da.
			self assert: ff equals: fa ] ]
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testEqual [

	self assert: zero equals: zero.
	self assert: one equals: one.
	self assert: one equals: one copy.
	self assert: one equals: (one asArbitraryPrecisionFloatNumBits: one numBits * 2).

	self deny: zero equals: one.
	self deny: minusOne equals: one.

	self assert: zero equals: 0.
	self assert: 0 equals: zero.
	self assert: zero equals: 0.0.
	self assert: 0.0 equals: zero.

	self deny: two equals: 1 / 2.
	self deny: 1 / 2 equals: two.
	self deny: zero equals: 1.0.
	self deny: 0.0 equals: one.

	self deny: one isNil.
	self deny: nil equals: one
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testExp [
	"seconds"

	<timeout: 10>
	| badExp serie |
	serie := (-20 to: 20) collect: [ :e | e asFloat ].
	badExp := self checkDoublePrecisionSerieVsFloat: serie forFunction: #exp.
	badExp ifNotEmpty: [
		Transcript
			cr;
			show: 'bad exp for ' , badExp printString ]
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testExpLn [

	| n |
	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) exp asFloat equals: 1 asFloat exp.
	n := 5 exp.
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp - n) abs <= n ulp.
	"self assert: (5 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 5 asFloat exp."
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp ln asFloat - n ln) abs <= 5.0 ulp
	"this test was skipped. changed that & loosened 2. test,
	 since '5 exp' seems to round up instead of down here,
	 which results in an error of almost one ulp in '5 exp'"
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testGreaterThan [

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
	self assert: minusOne > minusTwo
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testIEEEArithmeticVersusFloat [

	| floats ops ref new |
	floats := #( 1.0 2.0 3.0 5.0 10.0 2r1.0e52 2r1.0e53 2r1.0e54 0.5 0.25 2r1.0e-52 2r1.0e-53 2r1.0e-54 1.0e60 0.1 1.1e-30 1.0e-60 ) copyWith: Float pi.
	ops := #( #+ #- #* #/ #= #< #> ).
	ops do: [ :op |
		floats do: [ :f1 |
			floats do: [ :f2 |
				ref := f1 perform: op with: f2.
				new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op with: (f2 asArbitraryPrecisionFloatNumBits: 53).
				self assert: new equals: ref ] ] ]
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testIEEEArithmeticVersusIntegerAndFraction [
	"check that results are the same as IEEE 754 accelerated hardware
	WARNING: this cannot be the case for denormalized numbers (gradual underflow)
	because our exponent is unlimited"

	| floats ops ref new intAndFractions |
	floats := #( 1.0e0 2.0e0 3.0e0 5.0e0 10.0e0 ) , (#( 52 53 54 -52 -53 -54 ) collect: [ :e | 1.0e0 timesTwoPower: e ])
	          , #( 0.5e0 0.25e0 1.0e60 0.1e0 1.1e-30 1.0e-60 ) copyWith: Float pi.
	intAndFractions := #( 1 3 5 10 12345678901234567890 -1 -22 -3 1.2s1 ) copyWith: 7 / 9.
	intAndFractions := intAndFractions , (intAndFractions collect: [ :e | e reciprocal ]).

	ops := 1 / 10 = 0.1
		       ifTrue: [ #( #+ #- #* #/ ) ]
		       ifFalse: [ #( #+ #- #* #/ #= #< #> ) ]. "BEWARE: ArbitraryPrecisionFloat compare exactly, Float don't, unless http://bugs.squeak.org/view.php?id=3374"
	ops do: [ :op |
		floats do: [ :f1 |
			intAndFractions do: [ :f2 |
				ref := f1 perform: op with: f2 asFloat.
				new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op with: (f2 asArbitraryPrecisionFloatNumBits: 53).
				self assert: new equals: ref.
				new := f1 perform: op with: (f2 asArbitraryPrecisionFloatNumBits: 53).
				self assert: new equals: ref.

				ref := f1 perform: op with: f2.
				new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op with: f2.
				self assert: new equals: ref.

				ref := f2 asFloat perform: op with: f1.
				new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op with: (f1 asArbitraryPrecisionFloatNumBits: 53).
				self assert: new equals: ref.
				new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op with: f1.
				self assert: new equals: ref.

				ref := f2 perform: op with: f1.
				new := f2 perform: op with: (f1 asArbitraryPrecisionFloatNumBits: 53).
				self assert: new equals: ref ] ] ]
]

{ #category : #'testing-coercing' }
PMArbitraryPrecisionFloatTest >> testInfinityAndNaN [

	| inf nan |
	inf := Float infinity.
	nan := Float nan.
	self assert: inf + two equals: inf.
	self assert: half + inf negated equals: inf negated.
	self assert: (nan + minusOne) isNaN.
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
	self should: [ inf / zero ] raise: ZeroDivide.
	self assert: (nan / two) isNaN.
	self assert: (inf raisedTo: huge) equals: inf.
	self assert: (huge raisedTo: inf) equals: inf.
	self assert: (nan raisedTo: two) isNaN.
	self assert: (two raisedTo: nan) isNaN.
	self deny: nan <= one.
	self deny: zero >= nan.
	self assert: one < inf.
	self assert: zero ~= nan.
	self deny: nan equals: one
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testIsZero [
	self assert: zero isZero.
	self deny: one isZero.
	self deny: minusTwo isZero
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testLessThan [

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
	self deny: minusOne < minusTwo
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testLn [
	"seconds"

	<timeout: 10>
	| badLn serie |
	serie := (1 to: 100) collect: [ :e | e asFloat ].
	badLn := self checkDoublePrecisionSerieVsFloat: serie forFunction: #ln.
	badLn ifNotEmpty: [
		Transcript
			cr;
			show: 'bad ln for ' , badLn printString ]
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testLnDomainError [
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) ln] raise: DomainError
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testMultiply [

	self assert: zero * zero equals: zero.
	self assert: zero * minusOne equals: zero.
	self assert: huge * zero equals: zero.
	self assert: one * zero equals: zero.

	self assert: one * two equals: two.
	self assert: minusOne * one equals: minusOne.
	self assert: minusOne * minusTwo equals: two.

	self assert: half * two equals: one.

	"check rounding"
	self assert: huge * one equals: huge
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testNegated [

	self assert: zero negated equals: zero.
	self assert: one negated equals: minusOne.
	self assert: minusTwo negated equals: two.
	self assert: huge negated negated equals: huge
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testNegative [

	self deny: zero negative.
	self deny: two negative.
	self assert: minusTwo negative
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testPi [
	"check computation of pi"

	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) pi equals: Float pi
]

{ #category : #'testing-compare' }
PMArbitraryPrecisionFloatTest >> testPositive [

	self assert: zero positive.
	self assert: one positive.
	self deny: minusOne positive
]

{ #category : #'testing-converting' }
PMArbitraryPrecisionFloatTest >> testPrintAndEvaluate [
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
PMArbitraryPrecisionFloatTest >> testRaisedToNegativeInteger [
	| n |
	n := 11.
	1 to: 1<<n-1 do: [:i |
		self assert: ((i asArbitraryPrecisionFloatNumBits: n) raisedToInteger: -49)
			equals: ((i raisedToInteger: -49) asArbitraryPrecisionFloatNumBits: n) ]
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testRaisedToPositiveInteger [
	| n |
	n := 11.
	1 to: 1<<n-1 do: [:i |
		self assert: ((i asArbitraryPrecisionFloatNumBits: n) raisedToInteger: 49)
			equals: ((i raisedToInteger: 49) asArbitraryPrecisionFloatNumBits: n) ]
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testReciprocal [

	| b |
	b := 1 << (Float precision - 1).
	1 to: 10000 do: [ :i |
		| a |
		a := i asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: a reciprocal equals: i asFloat reciprocal.
		self assert: (a + b) reciprocal equals: (i + b) asFloat reciprocal.
		self assert: a negated reciprocal equals: i asFloat negated reciprocal ]
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testRoundToNearestEven [
	"Check that IEEE default rounding mode is honoured,
	that is rounding to nearest even"

	self assert: ((one timesTwoPower: 52) + (0 + (1 / 4))) asTrueFraction equals: (1 bitShift: 52) + 0.
	self assert: ((one timesTwoPower: 52) + (0 + (1 / 2))) asTrueFraction equals: (1 bitShift: 52) + 0.
	self assert: ((one timesTwoPower: 52) + (0 + (3 / 4))) asTrueFraction equals: (1 bitShift: 52) + 1.
	self assert: ((one timesTwoPower: 52) + (1 + (1 / 4))) asTrueFraction equals: (1 bitShift: 52) + 1.
	self assert: ((one timesTwoPower: 52) + (1 + (1 / 2))) asTrueFraction equals: (1 bitShift: 52) + 2.
	self assert: ((one timesTwoPower: 52) + (1 + (3 / 4))) asTrueFraction equals: (1 bitShift: 52) + 2
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testRoundToNearestEvenAgainstIEEEDouble [
	"Check that IEEE default rounding mode is honoured"

	#( 1 2 3 5 6 7 ) do: [ :i |
		self assert: ((one timesTwoPower: 52) + (i / 4)) asTrueFraction equals: ((1 asFloat timesTwoPower: 52) + (i / 4)) asTrueFraction.
		self assert: ((one timesTwoPower: 52) - (i / 4)) asTrueFraction equals: ((1 asFloat timesTwoPower: 52) - (i / 4)) asTrueFraction ]
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testSin [
	"seconds"

	<timeout: 30>
	self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #sin
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testSincos [
	"seconds"

	<timeout: 30>
	self trigonometricSerie do: [ :aFloat |
		| x sc s c |
		x := aFloat asArbitraryPrecisionFloatNumBits: 53.
		sc := x sincos.
		s := x sin.
		c := x cos.
		self assert: sc size equals: 2.

		self assert: sc first equals: s.
		self assert: sc last equals: c ]
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testSinh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #sinh
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testSqrt [
	"seconds"

	<timeout: 10>
	| badSqrt serie |
	"knowing that (10**3) < (2**10), 100 bits are enough for representing 10**30 exactly"
	self assert: ((10 raisedTo: 30) asArbitraryPrecisionFloatNumBits: 100) sqrt equals: (10 raisedTo: 15).

	serie := ((0 to: 20) collect: [ :e | e asFloat ]) , ((2 to: 20) collect: [ :e | e reciprocal asFloat ]).
	badSqrt := self checkDoublePrecisionSerieVsFloat: serie forFunction: #sqrt.
	badSqrt ifNotEmpty: [
		Transcript
			cr;
			show: 'bad sqrt for ' , badSqrt printString ]
]

{ #category : #'testing-functions' }
PMArbitraryPrecisionFloatTest >> testSqrtDomainError [
	self should: [(-2 asArbitraryPrecisionFloatNumBits: 24) sqrt] raise: DomainError
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testSubtract [

	self assert: zero - zero equals: zero.
	self assert: zero - minusOne equals: one.
	self assert: huge - zero equals: huge.
	self assert: one - zero equals: one.

	self assert: one - minusOne equals: two.
	self assert: minusOne - minusTwo equals: one.
	self assert: minusOne - one equals: minusTwo.

	"check rounding"
	self assert: huge - one equals: huge
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testSum [

	self assert: zero + zero equals: zero.
	self assert: zero + minusOne equals: minusOne.
	self assert: huge + zero equals: huge.
	self assert: one + zero equals: one.

	self assert: one + minusOne equals: zero.
	self assert: minusOne + two equals: one.
	self assert: one + minusTwo equals: minusOne.

	"check rounding"
	self assert: huge + one equals: huge
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testTan [
	"seconds"

	<timeout: 30>
	self checkDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #tan
]

{ #category : #'testing-hyperbolic' }
PMArbitraryPrecisionFloatTest >> testTanh [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self hyperbolicSerie forFunction: #tanh
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testVeryLargeCos [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #cos
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testVeryLargeSin [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #sin
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> testVeryLargeTan [
	<timeout: 10 "seconds">
	self checkDoublePrecisionSerie: self largeTrigonometricSerie forFunction: #tan
]

{ #category : #'testing-arithmetic' }
PMArbitraryPrecisionFloatTest >> testZeroOne [

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one equals: 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero isZero.

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one asInteger equals: 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero asInteger isZero
]

{ #category : #'testing-trigonometry' }
PMArbitraryPrecisionFloatTest >> trigonometricSerie [
	^(-720 to: 720) collect: [:i | i asFloat degreesToRadians]
]
