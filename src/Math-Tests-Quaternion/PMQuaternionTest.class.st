"
This class is for unit testing the Quaternion.
"
Class {
	#name : #PMQuaternionTest,
	#superclass : #TestCase,
	#instVars : [
		'q1234',
		'q1',
		'q12',
		'q123'
	],
	#category : #'Math-Tests-Quaternion'
}

{ #category : #running }
PMQuaternionTest >> setUp [
	q1234 := 1 i: 2 j: 3 k: 4.
	q1 := 1 asQuaternion.
	q12 := (1 + 2 i) asQuaternion .
	q123 := (1 + 2 i + 3 j).
]

{ #category : #running }
PMQuaternionTest >> testAbs [
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
PMQuaternionTest >> testAddPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly + q12 at: 0) equals: (2 + 2 i) asQuaternion.
	self assert: (q12 + poly at: 0) equals: (2 + 2 i) asQuaternion
]

{ #category : #running }
PMQuaternionTest >> testAngle [
	self assert: q1 angle equals: 0.
	self assert: (q12 - q1) angle equals: Float pi.
	self assert: (q123 - q12) angle equals: Float pi.
	self assert: (q1234 - q123) angleInDegrees equals: 180
]

{ #category : #running }
PMQuaternionTest >> testAsQuaternion [
	self assert: 1 asQuaternion equals: q1 asQuaternion.
	self assert: q1234 asQuaternion equals: q1234
]

{ #category : #running }
PMQuaternionTest >> testCos [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 cos - ((q1234 real cos * q1234 unreal cos) - (q1234 real sin * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) cos - (1 + 2 j k) cos) abs < eps.
]

{ #category : #running }
PMQuaternionTest >> testCosh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) cosh - (1 + 2 j k) cosh) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testDividePolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly / q12 at: 0) equals: q12 reciprocal.
	self assert: (q12 / poly at: 0) equals: 0.
	poly := poly * q12.
	self assert: ((poly / q12) coefficients allSatisfy: [ :ea | ea = 1 ])
]

{ #category : #running }
PMQuaternionTest >> testEquality [
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
PMQuaternionTest >> testExp [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 exp - (q1234 real exp * q1234 unreal exp)) abs < eps.
	self assert: ((1 + 2 i) exp - (1 + 2 j k) exp) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testFloatClass [
	"not much to do here?"

	self assert: (1.5 isKindOf: (1.5 * q1234) floatClass).
	self assert: q12 floatClass equals: q12 reduce floatClass
]

{ #category : #running }
PMQuaternionTest >> testFractionDoubleDispatch [
	"needed for coverage of adaptToFraction:andSend:"

	| frac |
	frac := 1 / 2.
	self assert: frac + q1234 equals: q1234 + frac.
	self assert: ((frac + q1234) real isKindOf: Fraction).
	self assert: (frac + q1234) real equals: 3 / 2
]

{ #category : #running }
PMQuaternionTest >> testFunctions [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 ln exp - q1234) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testHash [
	self assert: q1234 hash equals: q1234 copy hash.
	self assert: (1 + 2 i) hash equals: (1 + 2 j k) hash.
	self assert: 1 k k hash equals: -1 hash
]

{ #category : #running }
PMQuaternionTest >> testLog [

	"this ensures that log and ln have the expected relationship"

	| qln qlg10ln |
	qln := q1234 ln.
	qlg10ln := q1234 log * 10 ln.

	"this inspires me to implement Quaternion>>equalsTo: "
	self assert: (qln qr closeTo: qlg10ln real).
	self assert: (qln qi closeTo: qlg10ln qi).
	self assert: (qln qj closeTo: qlg10ln qj).
	self assert: (qln qk closeTo: qlg10ln qk)
]

{ #category : #running }
PMQuaternionTest >> testNaturalLogOfQuaternion [

	"See https://en.wikipedia.org/wiki/Quaternion#cite_note-Särkkä2007-39 for more detail"

	| quaternion naturalLogOfQuaternion expected vectorPartOfQuaternion |
	quaternion := 3 + 4 i + 5 j + 6 k.
	naturalLogOfQuaternion := quaternion ln.

	vectorPartOfQuaternion := PMQuaternion
		                      qr: 0
		                      qi: 4
		                      qj: 5
		                      qk: 6.
	expected := 86 sqrt ln
	            + (vectorPartOfQuaternion / 77 sqrt * (3 / 86 sqrt) arcCos).

	self assert: naturalLogOfQuaternion qr equals: expected qr.
	self assert: naturalLogOfQuaternion qi equals: expected qi.
	self assert: naturalLogOfQuaternion qj closeTo: expected qj.
	self assert: naturalLogOfQuaternion qk equals: expected qk
]

{ #category : #running }
PMQuaternionTest >> testNaturalLogOfQuaternionWithNoVectorPart [
	| expected naturalLogOfQuaternion quaternionWithNoVector |
	
	quaternionWithNoVector := 5 + 0 i + 0 j + 0 k.
	
	naturalLogOfQuaternion := quaternionWithNoVector ln.
	
	expected := 5 ln + 0 i + 0 j + 0 k.
	self assert: naturalLogOfQuaternion qr equals: expected qr.
	self assert: naturalLogOfQuaternion qi equals: 0.
	self assert: naturalLogOfQuaternion qj equals: 0.
	self assert: naturalLogOfQuaternion qk equals: 0.
]

{ #category : #tests }
PMQuaternionTest >> testNaturalLogOfQuaternionWithOnlyVectorPart [

	"See https://en.wikipedia.org/wiki/Quaternion#cite_note-Särkkä2007-39 for more detail"

	| quaternion naturalLogOfQuaternion expected expectedVectorPart |
	quaternion := 0 + 7 i - 10 j + 23 k.
	naturalLogOfQuaternion := quaternion ln.
	expectedVectorPart := PMQuaternion
		                      qr: 0
		                      qi: 7
		                      qj: -10
		                      qk: 23.


	expected := 678 sqrt ln + ((expectedVectorPart / 678 sqrt) * ((0 / 678 sqrt) arcCos)).

	self assert: naturalLogOfQuaternion qr equals: expected qr.
	self assert: naturalLogOfQuaternion qi equals: expected qi.
	self assert: naturalLogOfQuaternion qj closeTo: expected qj.
	self assert: naturalLogOfQuaternion qk equals: expected qk
]

{ #category : #running }
PMQuaternionTest >> testOne [
	self assert: PMQuaternion one unreal isZero.
	self assert: PMQuaternion one real equals: 1
]

{ #category : #running }
PMQuaternionTest >> testPrintOn [
	| s |
	s := q1234 printString.
	self assert: s equals: '(1 i: 2 j: 3 k: 4)'
]

{ #category : #running }
PMQuaternionTest >> testProduct [
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
PMQuaternionTest >> testProductWithVector [
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
PMQuaternionTest >> testRaisedTo [
	| eps |
	eps := 1.0e-6.
	self assert: ((q1234 raisedTo: 3) - (q1234 ln * 3) exp) abs < eps.
]

{ #category : #running }
PMQuaternionTest >> testRandomIsLessThanOne [
	| r |
	r := PMQuaternion random.
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
PMQuaternionTest >> testReduce [
	self assert: q1234 reduce equals: q1234.
	self assert: q1 reduce equals: 1.
	self assert: q1 reduce isInteger.
	self assert: q12 reduce isComplexNumber.
	self assert: q12 reduce equals: (1 + 2 i) asComplex.
	self shouldnt: [ q123 reduce isComplexNumber ]
]

{ #category : #running }
PMQuaternionTest >> testSin [
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 sin - ((q1234 real sin * q1234 unreal cos) + (q1234 real cos * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) sin - (1 + 2 j k) sin) abs < eps.
]

{ #category : #running }
PMQuaternionTest >> testSinh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) sinh - (1 + 2 j k) sinh) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testSquareOfQuaternion [
| q expected |
	q := 1 + 2 i - 3 j - 4 k.
	expected := -28 + 4 i - 6 j - 8 k.

	self assert: q squared equals: expected
]

{ #category : #running }
PMQuaternionTest >> testSubtractPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly - q12 at: 0) equals: (0 - 2 i) asQuaternion.
	self assert: (q12 - poly at: 0) equals: (0 + 2 i) asQuaternion
]

{ #category : #running }
PMQuaternionTest >> testSum [
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
PMQuaternionTest >> testTan [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tan - (1 + 2 j k) tan) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testTanh [
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tanh - (1 + 2 j k) tanh) abs < eps
]

{ #category : #running }
PMQuaternionTest >> testTimesPolynomial [
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly * q12 at: 0) equals: q12.
	self assert: (q12 * poly at: 0) equals: q12
]

{ #category : #running }
PMQuaternionTest >> testUnreal [
	self assert: q1234 unreal real equals: 0.
	self
		assert: q1234 unreal squared
		equals: (2 squared + 3 squared + 4 squared) negated
]

{ #category : #running }
PMQuaternionTest >> testZero [
	self assert: PMQuaternion zero isZero.
	self assert: PMQuaternion zero abs isZero.
]
