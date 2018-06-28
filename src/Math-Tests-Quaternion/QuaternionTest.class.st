"
This class is for unit testing the Quaternion.
"
Class {
	#name : #QuaternionTest,
	#superclass : #TestCase,
	#instVars : [
		'q1234',
		'q1',
		'q12',
		'q123'
	],
	#category : 'Math-Tests-Quaternion'
}

{ #category : #running }
QuaternionTest >> setUp [
	q1234 := 1 i: 2 j: 3 k: 4.
	q1 := 1 asQuaternion.
	q12 := (1 + 2 i) asQuaternion .
	q123 := (1 + 2 i + 3 j).
]

{ #category : #running }
QuaternionTest >> testAbs [
	self assert: (1 i: 1 j: 1 k: 1) abs equals: 2.
	self
		should: [ (1.0e200 i: 1.0e200 j: 1.0e200 k: 1.0e200) abs = 2.0e200 ]
		description: 'An overflow should be avoided'.
	self
		should: [ | big |
			big := (2.0 raisedTo: 53) - 1 timesTwoPower: 1023 - 52.
			(big i: big j: big k: big) abs = Float infinity ]
		description: 'An overflow cannot be avoided'.
	self
		should: [ (1.0e-200 i: 1.0e-200 j: 1.0e-200 k: 1.0e-200) abs = 2.0e-200 ]
		description: 'An underflow should be avoided'
]

{ #category : #running }
QuaternionTest >> testAddPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + q12 at: 0) equals: (2 + 2 i) asQuaternion.
	self assert: (q12 + poly at: 0) equals: (2 + 2 i) asQuaternion
]

{ #category : #running }
QuaternionTest >> testAngle [
	self assert: q1 angle equals: 0.
	self assert: (q12 - q1) angle equals: Float pi.
	self assert: (q123 - q12) angle equals: Float pi.
	self assert: (q1234 - q123) angleInDegrees equals: 180
]

{ #category : #running }
QuaternionTest >> testAsQuaternion [
	self assert: 1 asQuaternion equals: q1 asQuaternion.
	self assert: q1234 asQuaternion equals: q1234
]

{ #category : #running }
QuaternionTest >> testCos [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 cos - ((q1234 real cos * q1234 unreal cos) - (q1234 real sin * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) cos - (1 + 2 j k) cos) abs < eps.
]

{ #category : #running }
QuaternionTest >> testCosh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) cosh - (1 + 2 j k) cosh) abs < eps
]

{ #category : #running }
QuaternionTest >> testDividePolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly / q12 at: 0) equals: q12 reciprocal.
	self assert: (q12 / poly at: 0) equals: 0.
	poly := poly * q12.
	self assert: ((poly / q12) coefficients allSatisfy: [ :ea | ea = 1 ])
]

{ #category : #running }
QuaternionTest >> testEquality [
	self assert: q1234 equals: q1234 copy.
	self assert: 1 + 2 i equals: 1 + 2 j k.
	self assert: 1 + 2 j k equals: 1 + 2 i.
	self deny: 1 + 2 j = (1 + 2 i).
	self deny: q1234 = 1.
	self assert: 1 k k equals: -1.
	self assert: 1 equals: -1 k k.
	self deny: q1234 = nil
]

{ #category : #running }
QuaternionTest >> testExp [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 exp - (q1234 real exp * q1234 unreal exp)) abs < eps.
	self assert: ((1 + 2 i) exp - (1 + 2 j k) exp) abs < eps
]

{ #category : #running }
QuaternionTest >> testFloatClass [
	"not much to do here?"

	self assert: (1.5 isKindOf: (1.5 * q1234) floatClass).
	self assert: q12 floatClass equals: q12 reduce floatClass
]

{ #category : #running }
QuaternionTest >> testFractionDoubleDispatch [
	"needed for coverage of adaptToFraction:andSend:"

	| frac |
	frac := 1 / 2.
	self assert: frac + q1234 equals: q1234 + frac.
	self assert: ((frac + q1234) real isKindOf: Fraction).
	self assert: (frac + q1234) real equals: 3 / 2
]

{ #category : #running }
QuaternionTest >> testFunctions [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 ln exp - q1234) abs < eps
]

{ #category : #running }
QuaternionTest >> testHash [
	self assert: q1234 hash equals: q1234 copy hash.
	self assert: (1 + 2 i) hash equals: (1 + 2 j k) hash.
	self assert: 1 k k hash equals: -1 hash
]

{ #category : #running }
QuaternionTest >> testLn [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) ln - (1 + 2 j k) ln) abs < eps
]

{ #category : #running }
QuaternionTest >> testLog [
	"this ensures that log and ln have the expected relationship"

	| qln qlg10ln |
	qln := q1234 ln.
	qlg10ln := q1234 log * 10 ln.

	"this inspires me to implement Quaternion>>equalsTo: "
	self assert: (qln qr equalsTo: qlg10ln real).
	self assert: (qln qi equalsTo: qlg10ln qi).
	self assert: (qln qj equalsTo: qlg10ln qj).
	self assert: (qln qk equalsTo: qlg10ln qk)
]

{ #category : #running }
QuaternionTest >> testOne [
	self assert: Quaternion one unreal isZero.
	self assert: Quaternion one real equals: 1
]

{ #category : #running }
QuaternionTest >> testPrintOn [
	| s |
	s := q1234 printString.
	self assert: s equals: '(1 i: 2 j: 3 k: 4)'
]

{ #category : #running }
QuaternionTest >> testProduct [
	self assert: q1234 * 5 equals: (5 i: 10 j: 15 k: 20).
	self assert: 5 * q1234 equals: (5 i: 10 j: 15 k: 20).
	self assert: 1 i * 1 i equals: -1.
	self assert: 1 j * 1 j equals: -1.
	self assert: 1 k * 1 k equals: -1.
	self assert: 1 i * 1 j equals: 1 k.
	self assert: 1 j * 1 k equals: 1 i.
	self assert: 1 k * 1 i equals: 1 j.
	self assert: 1 j * 1 i equals: -1 k.
	self assert: 1 k * 1 j equals: -1 i.
	self assert: 1 i * 1 k equals: -1 j.
	self assert: 1 i i equals: -1.
	self assert: 1 j j equals: -1.
	self assert: 1 k k equals: -1.
	self assert: 1 i j equals: 1 k.
	self assert: 1 j k equals: 1 i.
	self assert: 1 k i equals: 1 j.
	self assert: 1 j i equals: -1 k.
	self assert: 1 k j equals: -1 i.
	self assert: 1 i k equals: -1 j.
	self assert: q1234 * 1 i equals: q1234 i.
	self assert: q1234 * 1 j equals: q1234 j.
	self assert: q1234 * 1 k equals: q1234 k.
	self assert: (q1234 * 0) isZero.
	self assert: (0 / q1234) isZero.
	self assert: q1234 * q1234 conjugated equals: q1234 squaredNorm.
	self assert: 1 / q1234 equals: q1234 reciprocal.
	self assert: q1234 / q1234 equals: 1
]

{ #category : #running }
QuaternionTest >> testProductWithVector [
	| vec |
	vec := PMVector new: 2.
	vec at: 1 put: 1.
	vec at: 2 put: 2.
	"This uses productWithVector"
	self assert: (vec * q1234 at: 2) equals: 2 * q1234.

	"This uses adaptToQuaternion:andSend:"
	self assert: (q1234 * vec at: 1) equals: q1234
]

{ #category : #running }
QuaternionTest >> testRaisedTo [
	| eps |
	eps := 1.0e-6.
	self assert: ((q1234 raisedTo: 3) - (q1234 ln * 3) exp) abs < eps.
]

{ #category : #running }
QuaternionTest >> testRandomIsLessThanOne [
	| r |
	r := Quaternion random.
	self assert: r abs >= 0.0.
	self assert: r abs <= 1.0.
	self assert: r isQuaternion.
	r := q1234 random.
	self assert: r qr < q1234 abs.
	self assert: r qi < q1234 abs.
	self assert: r qj < q1234 abs.
	self assert: r qk < q1234 abs
]

{ #category : #running }
QuaternionTest >> testReduce [
	self assert: q1234 reduce equals: q1234.
	self assert: q1 reduce equals: 1.
	self assert: q1 reduce isInteger.
	self assert: q12 reduce isComplexNumber.
	self assert: q12 reduce equals: (1 + 2 i) asComplex.
	self shouldnt: [ q123 reduce isComplexNumber ]
]

{ #category : #running }
QuaternionTest >> testSin [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 sin - ((q1234 real sin * q1234 unreal cos) + (q1234 real cos * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) sin - (1 + 2 j k) sin) abs < eps.
]

{ #category : #running }
QuaternionTest >> testSinh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) sinh - (1 + 2 j k) sinh) abs < eps
]

{ #category : #running }
QuaternionTest >> testSubtractPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly - q12 at: 0) equals: (0 - 2 i) asQuaternion.
	self assert: (q12 - poly at: 0) equals: (0 + 2 i) asQuaternion
]

{ #category : #running }
QuaternionTest >> testSum [
	self assert: 1 + 2 i + 3 j + 4 k equals: q1234.
	self assert: 1 + 2 i + (3 + 4 i) j equals: q1234.
	self assert: q1234 + 5 equals: (6 i: 2 j: 3 k: 4).
	self assert: 5 + q1234 equals: (6 i: 2 j: 3 k: 4).
	self assert: q1234 - 9 equals: (-8 i: 2 j: 3 k: 4).
	self assert: 9 - q1234 equals: (8 i: -2 j: -3 k: -4).
	self assert: q1234 + q1234 conjugated equals: q1234 real * 2.
	self assert: q1234 + q1234 negated equals: 0.
	self assert: q1234 isZero not.
	self assert: (q1234 negated + q1234) isZero
]

{ #category : #running }
QuaternionTest >> testTan [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tan - (1 + 2 j k) tan) abs < eps
]

{ #category : #running }
QuaternionTest >> testTanh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tanh - (1 + 2 j k) tanh) abs < eps
]

{ #category : #running }
QuaternionTest >> testTimesPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly * q12 at: 0) equals: q12.
	self assert: (q12 * poly at: 0) equals: q12
]

{ #category : #running }
QuaternionTest >> testUnreal [
	self assert: q1234 unreal real equals: 0.
	self
		assert: q1234 unreal squared
		equals: (2 squared + 3 squared + 4 squared) negated
]

{ #category : #running }
QuaternionTest >> testZero [
	self assert: Quaternion zero isZero.
	self assert: Quaternion zero abs isZero.
]
