Class {
	#name : #PMVectorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Core'
}

{ #category : #tests }
PMVectorTest >> testAddScalar [
	"Can we add Number to PMVector?"
	
	| vec num actual expected |
	
	vec := #(1 2 3) asPMVector.
	num := 4.
	
	actual := vec + num.
	expected := #(5 6 7) asPMVector.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
PMVectorTest >> testAddToScalar [
	"Can we add PMVector to Number?"
	
	| num vec actual expected |
	
	num := 4.
	vec := #(1 2 3) asPMVector.
	
	actual := num + vec.
	expected := #(5 6 7) asPMVector.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
PMVectorTest >> testArgMax [
	| v1 v2 |
	v1 := #(1 5 3 2 0) asPMVector.
	v2 := #(1 5 3 5 0) asPMVector.
	self assert: v1 argMax equals: 2.
	self assert: v2 argMax equals: 2
]

{ #category : #tests }
PMVectorTest >> testArgMaxWithVectorOverReals [
	"For vectors over a field of real numbers"

	| v1 v2 |
	v1 := #(1.3 5.001 3.1 2.0 0.2) asPMVector.
	v2 := #(1.2 15.0000000200 3.14 15.0000000201 0.1) asPMVector.
	self assert: v1 argMax equals: 2.
	self assert: v2 argMax equals: 4
]

{ #category : #tests }
PMVectorTest >> testAsArray [
	self assert: #(1 2 3 4) asPMVector asArray equals: #(1 2 3 4)
]

{ #category : #tests }
PMVectorTest >> testGreaterThan [
	| vec vecCopy |
	vec := #(1 2 3) asPMVector.
	vecCopy := vec deepCopy.
	self assert: (vec > 1.5) equals: #(false true true) asPMVector.
	"Ensure that in-place modification does not take place"
	self assert: vec equals: vecCopy asPMVector.
]

{ #category : #tests }
PMVectorTest >> testHouseholder [
	| u w |
	u := #(-1 0 1) asPMVector. "`x <= 0` when x = -1"
	w := u householder.
	self
		assert: (w at: 1) equals: 1.7071067811865475;
		assert: (w at: 2) asArray equals: #(1.0 -0.0 -0.4142135623730951).
	u := #(1.00001 2.00007) asPMVector. "`x <= 0` when x = 1.00001"
	w := u householder.
	self
		assert: (w at: 1) equals: 0.5527953485259909;
		assert: (w at: 2) asArray equals: #(1.0 -1.6180158992689828).
]

{ #category : #tests }
PMVectorTest >> testLessThan [
	| vec vecCopy |
	vec := #(1 2 3) asPMVector.
	vecCopy := vec deepCopy.
	self assert: (vec < 1.5) equals: #(true false false) asPMVector.
	"Ensure that in-place modification does not take place"
	self assert: vec equals: vecCopy asPMVector.
]

{ #category : #tests }
PMVectorTest >> testScalarProduct [
	| u v |
	u := PMVector new: 3.
	v := PMVector new: 3.
	u
		at: 1 put: 1;
		at: 2 put: 1;
		at: 3 put: 1.
	v
		at: 1 put: 0;
		at: 2 put: 2;
		at: 3 put: 0.
	self assert: (u scalarProduct: v) equals: 2.
	v at: 1 put: 2.
	self assert: (u scalarProduct: v) equals: 4
]

{ #category : #tests }
PMVectorTest >> testScalarProductIsCommutative [
	| u v |
	u := PMVector new: 3.
	v := PMVector new: 3.
	u
		at: 1 put: 1;
		at: 2 put: 1;
		at: 3 put: 1.
	v
		at: 1 put: 0;
		at: 2 put: 2;
		at: 3 put: 0.
	self assert: (u scalarProduct: v) equals: (v scalarProduct: u)
]

{ #category : #tests }
PMVectorTest >> testSubFromScalar [
	"Can we subtract PMVector from a Number?"
	
	| num vec actual expected |
	
	num := 4.
	vec := #(1 2 3) asPMVector.
	
	actual := num - vec.
	expected := #(3 2 1) asPMVector.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
PMVectorTest >> testSubtractScalar [
	"Can we subtract Number from PMVector?"
	
	| vec num actual expected |
	
	vec := #(5 6 7) asPMVector.
	num := 4.
	
	actual := vec - num.
	expected := #(1 2 3) asPMVector.
	
	self assert: actual equals: expected.
]

{ #category : #test }
PMVectorTest >> testTake [

	| m expected |
	m := PMVector withAll: #(1 2 3).
	expected := PMVector withAll: #(0 1 3).
	self assert: (m take: 2) equals: expected.
	expected := PMVector withAll: #(0 0 1).
	self assert: (m take: 3) equals: expected.
	
	m := PMVector withAll: #().
	expected := PMVector withAll: #().
	self assert: (m take: 2) equals: expected.
]

{ #category : #tests }
PMVectorTest >> testTensorProduct [
	| a b c |
	a := #(1 2 3) asPMVector.
	b := #(2 2 3) asPMVector.
	c := a tensorProduct: b.
	self deny: c transpose = c.	"hence c is not symmetric, but this does not work:"
	self deny: c isSymmetric.
	"furthermore this is completely permissible:"
	b := #(1 2 3 4) asPMVector.
	c := a tensorProduct: b.
	self assert: (b tensorProduct: a) equals: c transpose
]

{ #category : #tests }
PMVectorTest >> testVectorCloseTo [
	self assert: (#(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector).
	self assert: #(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector.	"Double check that the TestAsserter >> #assert:closeTo: functions properly here."
	self deny: (#(1.00001 2.00007) asPMVector closeTo: #(1.00007 2.00001) asPMVector)
]

{ #category : #tests }
PMVectorTest >> testVectorCloseToPrecision [
	| u v |
	u := #(1.2 2.4) asPMVector.
	v := #(1.4 2.2) asPMVector.
	self assert: (u closeTo: v precision: 0.5).
	self deny: (u closeTo: v precision: 0.3).
	self deny: (u closeTo: v precision: 0.1).
]

{ #category : #tests }
PMVectorTest >> testVectorCumulativeSum [
	"Code Example 8.1"

	| u w |
	u := #(1 2 3) asPMVector.
	w := u cumsum.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 1.
	self assert: (w at: 2) equals: 3.
	self assert: (w at: 3) equals: 6
]

{ #category : #tests }
PMVectorTest >> testVectorGreater [

| u w |
	u := #(-1 0 1) asPMVector.
	w := u > 0.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: false.
	self assert: (w at: 2) equals: false.
	self assert: (w at: 3) equals: true

]

{ #category : #tests }
PMVectorTest >> testVectorHadamardProduct [
	"Code Example 8.1"

	| u v w |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	w := u hadamardProduct: v.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 3.
	self assert: (w at: 2) equals: 8.
	self assert: (w at: 3) equals: 15
]

{ #category : #tests }
PMVectorTest >> testVectorLess [

| u w |
	u := #(-1 0 1) asPMVector.
	w := u < 0.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: true.
	self assert: (w at: 2) equals: false.
	self assert: (w at: 3) equals: false

]

{ #category : #tests }
PMVectorTest >> testVectorNegate [
	"negate modifies the vector. negated makes a new vector with inverse coefficients. "

	| v |
	v := #(1 2 3) asPMVector.
	self assert: (v negate at: 1) equals: -1.
	self assert: 2 equals: (v negate at: 2).
	self assert: -2 equals: (v negated at: 2)
]

{ #category : #tests }
PMVectorTest >> testVectorNorm [

	| v1 v2 |
	v1 := #( 1 0 ) asPMVector.
	self assert: v1 norm equals: 1.
	v2 := #( 0 1 ) asPMVector.
	self assert: v2 norm equals: 1.
	self shouldnt: [ (v1 + v2) norm = 1 ].
	"normalized norm may differ from exactly one due to floating point operations"
	self assert: ((v1 + v2) normalized norm closeTo: 1)
]

{ #category : #tests }
PMVectorTest >> testVectorOnes [
	| v |
	v := PMVector ones: 3.
	self assert: (v size) equals: 3.
	self assert: (v at: 1) equals: 1.
	self assert: (v at: 2) equals: 1.
	self assert: (v at: 3) equals: 1
	
]

{ #category : #tests }
PMVectorTest >> testVectorOperation [
	"Code Example 8.1"

	| u v w |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	w := 4 * u + (3 * v).
	self assert: w size equals: 3.
	self assert: (w at: 1) equals: 13.
	self assert: (w at: 2) equals: 20.
	self assert: (w at: 3) equals: 27
]

{ #category : #tests }
PMVectorTest >> testVectorOperationInverse [
	| u v w |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	w := v * 4 - (3 * u).
	self assert: w size equals: 3.
	self assert: (w at: 1) equals: 9.
	self assert: (w at: 2) equals: 10.
	self assert: (w at: 3) equals: 11
]

{ #category : #tests }
PMVectorTest >> testVectorProduct [
	"Code Example 8.1"

	| u v |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	self assert: u * v equals: 26
]

{ #category : #tests }
PMVectorTest >> testVectorSqrt [
	"Code Example 8.1"

	| u w |
	u := #(1 4 9) asPMVector.
	w := u sqrt.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 1.
	self assert: (w at: 2) equals: 2.
	self assert: (w at: 3) equals: 3
]

{ #category : #tests }
PMVectorTest >> testVectorSum [
	"Code Example 8.1"

	| u |
	u := #(1 2 3) asPMVector.
	self assert: (u sum) equals: 6.
]

{ #category : #tests }
PMVectorTest >> testVectorZeros [
	| v |
	v := PMVector zeros: 3.
	self assert: (v size) equals: 3.
	self assert: (v at: 1) equals: 0.
	self assert: (v at: 2) equals: 0.
	self assert: (v at: 3) equals: 0
	
]
