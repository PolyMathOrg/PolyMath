Class {
	#name : #PMDualNumberTest,
	#superclass : #TestCase,
	#instVars : [
		'zero',
		'one',
		'three',
		'zeroc',
		'onec'
	],
	#category : #'Math-Tests-AutomaticDifferenciation'
}

{ #category : #running }
PMDualNumberTest >> assertEquality: aDualNumber and: anotherDualNumber [
	self assert: aDualNumber equals: anotherDualNumber.
	self assert: aDualNumber eps equals: anotherDualNumber eps
]

{ #category : #running }
PMDualNumberTest >> setUp [
	zero := PMDualNumber value: 0 eps: 1.
	zeroc := PMDualNumber value: 0 eps: 0.
	one := PMDualNumber value: 1 eps: 1.
	onec := PMDualNumber value: 1.
	three := PMDualNumber value: 3.0 eps: 1
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testAbs [
	self assertEquality: three negated abs and: three
]

{ #category : #tests }
PMDualNumberTest >> testAccessing [
	self assert: three eps equals: 1.
	self assert: three value equals: 3.
	three value: 2.
	three eps: 2.
	self assert: three eps equals: 2.
	self assert: three value equals: 2
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testAdd [
	self assertEquality: 0 + onec + 0 and: onec.
	self assertEquality: 1 + one + onec + 0 and: three.
	self
		assertEquality: 1 + one + one + three + 1
		and: (PMDualNumber value: 7 eps: 3)
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testArcCos [

	| a |
	self assert:
		(zero arcCos equalsTo: (PMDualNumber value: Float halfPi eps: -1)).
	a := (PMDualNumber value: -1.0 successor eps: 1) arcCos.
	self assert: (a value closeTo: Float pi).
	self assert: a eps < -1e6
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testArcSin [

	| a |
	self assert: zero arcSin equals: zero.
	a := (PMDualNumber value: 1.0 predecessor eps: 1) arcSin.
	self assert: (a value closeTo: Float halfPi).
	self assert: a eps > 1e6.
	a := (PMDualNumber value: -0.5 eps: 1) arcSin.
	self assert: a value equals: -0.5 arcSin.
	self assert: a eps equals: 1 / (1 - 0.5 squared) sqrt
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testArcTan [

	self assertEquality: zero arcTan and: zero.
	self
		assertEquality: one negated arcTan
		and: (PMDualNumber value: -1 arcTan eps: -1 / 2).
	self assert: (three arcTan eps closeTo: 0.1)
]

{ #category : #test }
PMDualNumberTest >> testConjugated [
	| a z |
	z := PMDualNumber value: 1.0 + 1.0 i eps: 1.0.
	a := z absSquared.
	self assert: a value equals: z value absSquared.
	self
		assert: a eps
		equals: z eps asComplex complexConjugate * z value + (z value asComplex conjugated * z eps)
]

{ #category : #tests }
PMDualNumberTest >> testConverting [
	| a |
	self assert: zeroc asInteger == 0.
	self assert: three asInteger == 3.
	self assert: onec asFloat isFloat.
	self deny: onec isFloat.
	self assert: onec asFloat equals: 1.
	a := three negated asFloat.
	self assert: a isFloat.
	self assert: a equals: -3.
	self assert: (PMDualNumber value: -3.7 eps: 2) asInteger == -3
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testCos [
	self
		assert:
			((PMDualNumber value: Float halfPi negated eps: 1) cos
				equalsTo: (PMDualNumber value: 0 eps: 1)).
	self
		assert:
			((PMDualNumber value: Float halfPi eps: 1) cos
				equalsTo: (PMDualNumber value: 0 eps: -1)).
	self
		assert: ((PMDualNumber value: Float halfPi eps: 0) cos equalsTo: zeroc)
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testDerivatives [
	"f(x) = x^3
	f'(x) = 3*x^2"

	| x y |
	x := PMDualNumber value: 2 eps: 1.
	y := x raisedTo: 3.
	self assert: y value equals: (2.0 raisedTo: 3).
	self assert: y eps equals: 3.0 * (x raisedTo: 2)
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testDivide [
	self should: [ 4.0 / (one - 1) ] raise: ZeroDivide.
	self should: [ three / (onec - 1) ] raise: ZeroDivide.
	self assertEquality: three / onec and: three.
	self assertEquality: three / three and: onec.
	self assertEquality: 1 / one and: (PMDualNumber value: 1 eps: -1).
	self assertEquality: 1 / three reciprocal and: three.
	self assertEquality: 2 / three reciprocal and: three * 2.
	self
		assertEquality: 1 / three
		and: (PMDualNumber value: (1 / 3) asFloat eps: (-1 / 9) asFloat)
]

{ #category : #'tests-testing' }
PMDualNumberTest >> testEqual [
	self assert: one equals: onec.
	self assert: zero equals: zeroc.
	self assert: one equals: 1.0.
	self assert: three equals: 3.
	self assert: one ~= zero.
	self assert: 1.1 equals: (PMDualNumber value: 1.1 eps: 2).
	self assert: 1 / 3 equals: (PMDualNumber value: 1 / 3 eps: 2 / 3).
	self assert: 1 / 3.0 ~= (PMDualNumber value: 1 / 3 eps: 2) hash
]

{ #category : #tests }
PMDualNumberTest >> testEqualsTo [
	self assert: (zeroc equalsTo: zeroc).
	self deny: (zeroc equalsTo: zero).
	self assert: (zero equalsTo: zero).
	self
		assert: (one equalsTo: (PMDualNumber value: 1.0000000001 eps: 1.0000000001)).
	self
		deny: (one equalsTo: (PMDualNumber value: 1.0000000001 eps: 1.001)).
	self
		deny: (one equalsTo: (PMDualNumber value: 1.001 eps: 1.0000000001)).
	self
		deny: (one equalsTo: (PMDualNumber value: 1.001 eps: 1.001))
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testExp [

	| a b |
	b := 3 exp.
	a := three exp.
	self assert: (a eps closeTo: b).
	self assert: a value equals: b.
	self assert: one equals: zero exp
]

{ #category : #tests }
PMDualNumberTest >> testHash [
	self assert: one hash equals: onec hash.
	self assert: zero hash equals: zeroc hash.
	self assert: one hash equals: 1 hash.
	self assert: three hash equals: 3 hash.
	self assert: one hash ~= zero hash.
	self assert: 1.1 hash equals: (PMDualNumber value: 1.1 eps: 2) hash.
	self
		assert: (1 / 3) hash
		equals: (PMDualNumber value: 1 / 3 eps: 2 / 3) hash.
	self assert: 1 / 3.0 hash ~= (PMDualNumber value: 1 / 3 eps: 2) hash
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testLn [

	| a |
	a := three ln.
	self assert: (a eps closeTo: 1 / 3).
	self assert: a value equals: 3 ln.
	self assert: one ln equals: zero
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testMultiply [
	self assertEquality: 0 * onec and: zeroc.
	self assertEquality: three * 0 and: zeroc.
	self assertEquality: onec * three and: three.
	self assertEquality: three * one and: (PMDualNumber value: 3 eps: 4).
	self
		assertEquality: (three + 2.0) * (1 + one)
		and: (PMDualNumber value: 10.0 eps: 7.0)
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testNegated [
	self assert: three negated equals: -3.
	self assert: three negated eps equals: -1
]

{ #category : #'tests-testing' }
PMDualNumberTest >> testOpposites [
	self assert: zeroc even.
	self deny: one even.
	self deny: zero odd.
	self assert: three odd.
	self deny: zeroc odd.
	self assert: zeroc positive.
	self deny: zero negative.
	self assert: three positive.
	self assert: onec negated negative
]

{ #category : #tests }
PMDualNumberTest >> testPrintOn [
	| stream |
	stream := ReadWriteStream on: ''.
	three printOn: stream.
	self assert: (stream contents includesSubstring: ' 3.0').
	self assert: (stream contents includesSubstring: ' 1')
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testRaisedTo [

	| a |
	self assertEquality: (three raisedTo: 2) and: three squared.
	self assertEquality: (three raisedTo: 0) and: onec.
	self
		assertEquality: (three + one raisedTo: 1 / 2)
		and: (PMDualNumber value: 2 eps: 1 / 2).
	self assert: ((three + one raisedTo: 3 / 2) equalsTo:
			 (PMDualNumber value: 8 eps: 6)).
	self assertEquality: (zero raisedTo: 1.4) and: zeroc.
	a := 2 raisedTo: three.
	self assert: (a value closeTo: 8).
	self assert: (a eps closeTo: 2 ln * (2 raisedTo: 3)).
	self assertEquality: (1 raisedTo: three) and: onec.
	self assertEquality: (one raisedTo: one) and: one.
	a := three raisedTo: three.
	self assert: (a value closeTo: 27).
	self assert: (a eps closeTo: (3 raisedTo: 3) * (3 ln + 1))
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testRaisedToInteger [
	self assertEquality: (three raisedToInteger: 2) and: three squared.
	self assertEquality: (three raisedToInteger: 1) and: three.
	self assertEquality: (three raisedToInteger: 0) and: onec.
	self
		assertEquality: (three raisedToInteger: 4)
		and: (PMDualNumber value: 81 eps: 108).
	self assertEquality: (zero raisedToInteger: 4) and: zeroc
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testReciprocal [
	self should: [ zero reciprocal ] raise: ZeroDivide.
	self should: [ zeroc reciprocal ] raise: ZeroDivide.
	self
		assertEquality: one reciprocal
		and: (PMDualNumber value: 1 eps: -1).
	self assertEquality: onec reciprocal and: onec.
	self
		assertEquality: three reciprocal
		and: (PMDualNumber value: 1 / 3.0 eps: -1 / 9.0)
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testSin [
	self
		assert:
			((PMDualNumber value: Float halfPi negated eps: 1) sin
				equalsTo: (PMDualNumber value: -1.0 eps: 0.0)).
	self
		assert:
			((PMDualNumber value: Float halfPi eps: 1) sin
				equalsTo: (PMDualNumber value: 1.0 eps: 0.0)).
	self assertEquality: zero sin and: zero
]

{ #category : #'tests-testing' }
PMDualNumberTest >> testSmaller [
	self assert: one < 1.1.
	self deny: one < 0.
	self assert: 1 > zeroc.
	self deny: -0.1 > zeroc.
	self deny: three < 3.
	self assert: three <= 3.
	self assert: 4 >= three.
	self deny: three <= 2.9.
	self deny: onec <= 0.9.
	self assert: one < three.
	self assert: three > one.
	self deny: three < three
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testSqrt [
	| a |
	self
		assertEquality: (PMDualNumber value: 16 eps: 5) sqrt
		and: (PMDualNumber value: 4 eps: 5 / 8).
	a := zero sqrt.
	self assert: a value equals: 0.
	self assert: a eps > 1e60
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testSquared [
	self
		assertEquality: (PMDualNumber value: -3 eps: 5) squared
		and: (PMDualNumber value: 9 eps: -30).
	self assertEquality: zero squared and: zeroc
]

{ #category : #'tests-arithmetic' }
PMDualNumberTest >> testSubtract [
	self assertEquality: 2 - onec - 1 and: zeroc.
	self assertEquality: three - one - 1 and: onec.
	self assertEquality: 1 - one - 1 and: one negated
]

{ #category : #'tests-mathematical functions' }
PMDualNumberTest >> testTan [

	| a b |
	a := three tan.
	self assert: a value equals: 3 tan.
	self assert: (a eps closeTo: 3 tan squared + 1).
	b := Float halfPi - 0.000000000001.
	a := (PMDualNumber value: b eps: 1) tan.
	self assert: a value equals: b tan.
	self assert: (a eps closeTo: b tan squared + 1)
]

{ #category : #'tests-testing' }
PMDualNumberTest >> testTesting [
	self deny: 3 isDualNumber.
	self assert: one isDualNumber.
	self assert: zeroc isDualNumber.
	self deny: three isInfinite.
	self
		assert: (PMDualNumber value: Float infinity negated eps: 3) isInfinite.
	self deny: three isNaN.
	self deny: zeroc isNaN.
	self assert: (PMDualNumber value: Float nan eps: 1) isNaN.
	self assert: onec isNumber.
	self assert: three isNumber.
	self assert: zeroc isZero.
	self assert: zero isZero.
	self deny: onec isZero.
	self deny: one isZero
]
