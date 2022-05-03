Class {
	#name : #PMHyperDualNumberTest,
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
PMHyperDualNumberTest >> assertEquality: aDualNumber and: anotherDualNumber [
	self assert: aDualNumber equals: anotherDualNumber.
	self assert: aDualNumber exp equals: anotherDualNumber exp.
	self assert: aDualNumber eps2 equals: anotherDualNumber eps2.
	self assert: aDualNumber eps1eps2 equals: anotherDualNumber eps1eps2
]

{ #category : #running }
PMHyperDualNumberTest >> setUp [
super setUp.
	zero := PMHyperDualNumber
		value: 0
		eps: 1
		eps2: 1
		eps1eps2: 0.
	zeroc := PMHyperDualNumber value: 0.
	one := PMHyperDualNumber
		value: 1
		eps: 1
		eps2: 1
		eps1eps2: 0.
	onec := PMHyperDualNumber value: 1.
	three := PMHyperDualNumber
		value: 3
		eps: 1
		eps2: 1
		eps1eps2: 0
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testAbs [
	self assertEquality: three negated abs and: three
]

{ #category : #tests }
PMHyperDualNumberTest >> testAccessing [
	self assert: three eps equals: 1.
	self assert: three value equals: 3.
	self assert: three eps2 equals: 1.
	self assert: three eps1eps2 equals: 0.
	three eps1eps2: 2.
	three eps2: 2.
	self assert: three eps2 == 2.
	self assert: three eps1eps2 equals: 2
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testAdd [
	self assertEquality: 0 + onec + 0 and: onec.
	self assertEquality: 1 + one + onec + 0 and: three.
	three eps1eps2: 2.
	self
		assertEquality: 1 + one + one + three + 1
		and:
			(PMHyperDualNumber
				value: 7
				eps: 3
				eps2: 3
				eps1eps2: 2)
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testArcCos [
	| a |
	self
		assert:
			(zero arcCos
				equalsTo:
					(PMHyperDualNumber
						value: Float halfPi
						eps: -1
						eps2: -1
						eps1eps2: 0)).
	a := (PMHyperDualNumber
		value: 1.0 predecessor
		eps: 1
		eps2: 1
		eps1eps2: 0) arcCos.
	self assert: (a value closeTo: 0).
	self assert: a eps < -1e6.
	self assert: a eps2 < -1e6.
	self assert: a eps1eps2 < -1e6
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testArcSin [

	| a |
	self assert: zero arcSin equals: zero.
	a := (PMHyperDualNumber
		      value: 1.0 predecessor
		      eps: 1
		      eps2: 1
		      eps1eps2: 0) arcSin.
	self assert: (a value closeTo: Float halfPi).
	self assert: a eps > 1e6.
	self assert: a eps2 > 1e6.
	self assert: a eps1eps2 > 1e6
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testArcTan [

	self assert: zero arcTan equals: zero.
	self assertEquality: one negated arcTan and: (PMHyperDualNumber
			 value: -1 arcTan
			 eps: -1 / 2
			 eps2: -1 / 2
			 eps1eps2: 1 / 2).
	self assert: (three arcTan eps2 closeTo: 0.1).
	self assert: (three arcTan eps1eps2 closeTo: -3 / 50)
]

{ #category : #tests }
PMHyperDualNumberTest >> testConverting [
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
PMHyperDualNumberTest >> testCos [
	self
		assert:
			((PMHyperDualNumber
				value: Float halfPi negated
				eps: 1
				eps2: 1
				eps1eps2: 0) cos equalsTo: zero).
	self
		assert:
			((PMHyperDualNumber
				value: Float halfPi
				eps: 1
				eps2: 1
				eps1eps2: 0) cos equalsTo: zero negated).
	self
		assert: ((PMHyperDualNumber value: Float halfPi) cos equalsTo: zeroc)
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testDivide [
	self should: [ 4.0 / (one - 1) ] raise: ZeroDivide.
	self should: [ three / (onec - 1) ] raise: ZeroDivide.
	self assertEquality: three / onec and: three.
	self assertEquality: three / three and: onec.
	self
		assertEquality: 1 / one
		and:
			(PMHyperDualNumber
				value: 1
				eps: -1
				eps2: -1
				eps1eps2: 2).
	self assertEquality: 1 / three reciprocal and: three.
	self assertEquality: 2 / three reciprocal and: three * 2.
	self
		assertEquality: 1 / three
		and:
			(PMHyperDualNumber
				value: 1 / 3
				eps: -1 / 9
				eps2: -1 / 9
				eps1eps2: 2 / 27)
]

{ #category : #'tests-testing' }
PMHyperDualNumberTest >> testEqual [
	self assert: one equals: onec.
	self assert: zero equals: zeroc.
	self assert: one equals: 1.0.
	self assert: three equals: 3.
	self assert: one ~= zero.
	self assert: 1.1 equals: (PMHyperDualNumber value: 1.1 eps: 2).
	self
		assert: 1 / 3
		equals:
			(PMHyperDualNumber
				value: 1 / 3
				eps: 2 / 3
				eps2: 5.4
				eps1eps2: 6.4).
	self assert: 1 / 3.0 ~= (PMHyperDualNumber value: 1 / 3) hash
]

{ #category : #tests }
PMHyperDualNumberTest >> testEqualsTo [
	self assert: (zeroc equalsTo: zeroc).
	self deny: (zeroc equalsTo: zero).
	self assert: (zero equalsTo: zero).
	self
		assert:
			(one
				equalsTo:
					(PMHyperDualNumber
						value: 1.0000000001
						eps: 1.0000000001
						eps2: 1.0000000001
						eps1eps2: 0.0000000001)).
	self
		deny:
			(one
				equalsTo:
					(PMHyperDualNumber
						value: 1.0000000001
						eps: 1.0000000001
						eps2: 1.0000000001
						eps1eps2: 0.001)).
	self
		deny:
			(one
				equalsTo:
					(PMHyperDualNumber
						value: 1.0000000001
						eps: 1.0000000001
						eps2: 1.001
						eps1eps2: 0.0000000001))
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testExp [

	| a b |
	b := 3 exp.
	a := three exp.
	self assert: (a eps closeTo: b).
	self assert: (a eps2 closeTo: b).
	self assert: (a eps1eps2 closeTo: b).
	self assert: a value equals: b.
	self assert: one equals: zero exp
]

{ #category : #tests }
PMHyperDualNumberTest >> testHash [
	self assert: one hash equals: onec hash.
	self assert: zero hash equals: zeroc hash.
	self assert: one hash equals: 1 hash.
	self assert: three hash equals: 3 hash.
	self assert: one hash ~= zero hash.
	self
		assert: 1.1 hash
		equals:
			(PMHyperDualNumber
				value: 1.1
				eps: 2
				eps2: 0.8
				eps1eps2: 0.7) hash.
	self
		assert: (1 / 3) hash
		equals:
			(PMHyperDualNumber
				value: 1 / 3
				eps: 2 / 3
				eps2: 0.8
				eps1eps2: 0.7) hash.
	self assert: 1 / 3.0 hash ~= (PMHyperDualNumber value: 1 / 3) hash
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testLn [

	| a |
	a := three ln.
	self assert: (a eps closeTo: 1 / 3).
	self assert: (a eps2 closeTo: 1 / 3).
	self assert: (a eps1eps2 closeTo: -1 / 9).
	self assert: a value equals: 3 ln.
	self assert: one ln equals: zero
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testMultiply [
	self assertEquality: 0 * onec and: zeroc.
	self assertEquality: three * 0 and: zeroc.
	self assertEquality: onec * three and: three.
	self
		assertEquality: three * one
		and:
			(PMHyperDualNumber
				value: 3
				eps: 4
				eps2: 4
				eps1eps2: 2).
	self
		assertEquality: (three + 2.0) * (1 + one)
		and:
			(PMHyperDualNumber
				value: 10.0
				eps: 7.0
				eps2: 7.0
				eps1eps2: 2.0)
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testNegated [
	three eps1eps2: -4.
	self assert: three negated equals: -3.
	self assert: three negated eps equals: -1.
	self assert: three negated eps2 equals: -1.
	self assert: three negated eps1eps2 equals: 4
]

{ #category : #'tests-testing' }
PMHyperDualNumberTest >> testOpposites [
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
PMHyperDualNumberTest >> testPrintOn [
	| stream |
	stream := ReadWriteStream on: ''.
	three printOn: stream.
	self assert: (stream contents includesSubstring: ' 3').
	self assert: (stream contents includesSubstring: ' 1').
	self assert: (stream contents includesSubstring: ' 0')
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testRaisedTo [

	| a b |
	self assert: ((three raisedTo: 2) equalsTo: three squared).
	self assertEquality: (three raisedTo: 0) and: onec.
	self assert:
		((three + one raisedTo: 1 / 2) equalsTo: (PMHyperDualNumber
				  value: 2
				  eps: 1 / 2
				  eps2: 1 / 2
				  eps1eps2: -1 / 8)).
	self assertEquality: (zero raisedTo: 1.4) and: zeroc.
	a := 2 raisedTo: three.
	self assert: (a value closeTo: 8).
	b := 2 ln * (2 raisedTo: 3).
	self assert: (a eps closeTo: b).
	self assert: (a eps2 closeTo: b).
	self assert: (a eps1eps2 closeTo: 2 ln * b).
	self assertEquality: (1 raisedTo: three) and: onec.
	self assert: ((one raisedTo: one) equalsTo: (PMHyperDualNumber
				  value: 1
				  eps: 1
				  eps2: 1
				  eps1eps2: 2)).
	a := three raisedTo: three.
	self assert: (a value closeTo: 27).
	b := 3 ln + 1 * 27.
	self assert: (a eps closeTo: b).
	self assert: (a eps2 closeTo: b).
	self assert: (a eps1eps2 closeTo: b * (3 ln + 1) + 9)
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testRaisedToInteger [
	self assertEquality: (three raisedToInteger: 2) and: three squared.
	self assertEquality: (three raisedToInteger: 1) and: three.
	self assertEquality: (three raisedToInteger: 0) and: onec.
	self
		assertEquality: (three raisedToInteger: 4)
		and:
			(PMHyperDualNumber
				value: 81
				eps: 108
				eps2: 108
				eps1eps2: 108).
	self assertEquality: (zero raisedToInteger: 4) and: zeroc
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testReciprocal [
	self should: [ zero reciprocal ] raise: ZeroDivide.
	self should: [ zeroc reciprocal ] raise: ZeroDivide.
	self
		assertEquality: one reciprocal
		and:
			(PMHyperDualNumber
				value: 1
				eps: -1
				eps2: -1
				eps1eps2: 2).
	self assertEquality: onec reciprocal and: onec.
	self
		assertEquality: three reciprocal
		and:
			(PMHyperDualNumber
				value: 1 / 3
				eps: -1 / 9
				eps2: -1 / 9
				eps1eps2: 2 / 27)
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testSin [
	self
		assert:
			((PMHyperDualNumber
				value: Float halfPi negated
				eps: 1
				eps2: 1
				eps1eps2: 0) sin
				equalsTo:
					(PMHyperDualNumber
						value: -1
						eps: 0
						eps2: 0
						eps1eps2: 1)).
	self
		assert:
			((PMHyperDualNumber
				value: Float halfPi
				eps: 1
				eps2: 1
				eps1eps2: 0) sin
				equalsTo:
					(PMHyperDualNumber
						value: 1
						eps: 0
						eps2: 0
						eps1eps2: -1)).
	self assertEquality: zero sin and: zero
]

{ #category : #'tests-testing' }
PMHyperDualNumberTest >> testSmaller [
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
PMHyperDualNumberTest >> testSqrt [
	| a |
	self
		assertEquality:
			(PMHyperDualNumber
				value: 16
				eps: 5
				eps2: 1
				eps1eps2: 0) sqrt
		and:
			(PMHyperDualNumber
				value: 4
				eps: 5 / 8
				eps2: 1 / 8
				eps1eps2: -5 / 256).
	a := zero sqrt.
	self assert: a value equals: 0.
	self assert: a eps > 1e60.
	self assert: a eps2 > 1e60.
	self assert: a eps1eps2 < 1e60
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testSquared [
	self
		assert:
			((PMHyperDualNumber
				value: -3
				eps: 5
				eps2: 1
				eps1eps2: 0) squared
				equalsTo:
					(PMHyperDualNumber
						value: 9
						eps: -30
						eps2: -6
						eps1eps2: 10)).
	zeroc eps1eps2: 2.
	self assertEquality: zero squared and: zeroc
]

{ #category : #'tests-arithmetic' }
PMHyperDualNumberTest >> testSubtract [
	self assertEquality: 2 - onec - 1 and: zeroc.
	self assertEquality: three - one - 1 and: onec.
	self assertEquality: 1 - one - 1 and: one negated
]

{ #category : #'tests-mathematical functions' }
PMHyperDualNumberTest >> testTan [

	| a |
	a := three tan.
	self assert: a value equals: 3 tan.
	self assert: (a eps closeTo: 3 tan squared + 1).
	self assert: (a eps closeTo: a eps2).
	self assert: (a eps1eps2 closeTo: -0.2908860399427)
]

{ #category : #'tests-testing' }
PMHyperDualNumberTest >> testTesting [
	self deny: 3 isDualNumber.
	self assert: one isDualNumber.
	self assert: zeroc isDualNumber.
	self deny: three isInfinite.
	self
		assert:
			(PMHyperDualNumber
				value: Float infinity negated
				eps: 3
				eps2: 0
				eps1eps2: 0) isInfinite.
	self deny: three isNaN.
	self deny: zeroc isNaN.
	self assert: (PMHyperDualNumber value: Float nan eps: 1) isNaN.
	self assert: onec isNumber.
	self assert: three isNumber.
	self assert: zeroc isZero.
	self assert: zero isZero.
	self deny: onec isZero.
	self deny: one isZero
]
