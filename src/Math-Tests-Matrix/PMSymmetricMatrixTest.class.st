Class {
	#name : #PMSymmetricMatrixTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #tests }
PMSymmetricMatrixTest >> testCrlInverse [
	| m i |
	m := PMSymmetricMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	i := m crlInverse.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3)
	"the funny result of m*i with the bug is this matrix:
a PMVector(1 0 -24)
a PMVector(0 1 -40)
a PMVector(2 4 -51)"
]

{ #category : #tests }
PMSymmetricMatrixTest >> testEqual [
	"= should work like in a SequenceableCollection  eg a PMVector and a Array can be equal"

	| a b |
	a := PMMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	b := a asSymmetricMatrix.
	self assert: a equals: b.
	self assert: b equals: a.
	self assert: a hash equals: b hash.
	a := PMMatrix rows: #(#(1 2 3) #(2 4 5) #(3 5 6)).
	self assert: a ~= b.
	self assert: b ~= a.
	self assert: a hash ~= b hash.
	a := a asSymmetricMatrix.
	self assert: a ~= b.
	a := 2.
	self assert: b ~= a.
	a := 's'.
	self assert: b ~= a
]

{ #category : #tests }
PMSymmetricMatrixTest >> testIdentityMatrix [
	|expectedIdentityMatrix identityMatrix|

	identityMatrix := PMSymmetricMatrix identity: 3.
	expectedIdentityMatrix := PMSymmetricMatrix rows: #(#(1 0 0) #(0 1 0) #(0 0 1)).

	self assert: identityMatrix equals: expectedIdentityMatrix.
]

{ #category : #tests }
PMSymmetricMatrixTest >> testInversePureLUP [
	| m i |
	m := PMSymmetricMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	"this raises an error"
	i := m inversePureLUP.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3).
	"there is no(!) bug in inversePureCRL, but it is nowhere tested i think, hence i just added this here for the sake of simplicity (and because i simplified inversePureCRL)"
	i := m inversePureCRL.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3)
]
