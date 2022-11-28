"
here are tests that would be in Math-Tests-DHB-Numerical, if it could construct random matrices

"
Class {
	#name : #PMAdditionalTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #tests }
PMAdditionalTest >> testMatrixInversionSmall [
	"it is here since it uses random matrices"

	| m c i |
	c := PMSymmetricMatrix identity: 5.
	3
		timesRepeat: [ [ m := PMSymmetricMatrix new: 5 random: 20.
			m determinant = 0 ] whileTrue.	"singular matrix not allowed"
			self assert: (i := m crlInverse) * m closeTo: c.
			self assert: i class equals: PMSymmetricMatrix.
			self assert: (i := m inversePureLUP) * m closeTo: c.
			self assert: i class equals: PMSymmetricMatrix.
			self assert: m * (i := m inversePureCRL) closeTo: c.
			self assert: i class equals: PMSymmetricMatrix ].
	3
		timesRepeat: [ [ m := PMMatrix rows: 5 columns: 5 random: 20.
			m determinant = 0 ] whileTrue.
			self assert: m * (i := m inverse) closeTo: c.
			self assert: i class equals: PMMatrix.
			self assert: (i := m inversePureCRL) * m closeTo: c.
			self assert: i class equals: PMMatrix ]
]

{ #category : #tests }
PMAdditionalTest >> testMatrixSquared [
	"this tests squared and is not in Math-Tests-Numerical since it uses random matrices"

	| a |
	10
		timesRepeat: [ a := PMMatrix rows: 20 columns: 21 random: 10.0.
			self assert: a squared equals: a transpose * a ].
	self assert: a squared class equals: PMSymmetricMatrix
]

{ #category : #tests }
PMAdditionalTest >> testTensorProduct [
	"this tests if a tensor product of two vectors is calculated correctly"

	| a b expected |
	a := #(3 4) asPMVector.
	b := #(1 2) asPMVector.
	
	"tensor product of two different vectors (a PMMatrix)"
	expected := PMMatrix rows: #((3 6)(4 8)).
	self assert: (a tensorProduct: b) equals: expected.
	
	"tensor product of two equal vectors (a PMSymmetricMatrix)"
	expected := PMMatrix rows: #((9 12)(12 16)).
	self assert: (a tensorProduct: a) equals: expected.
]
