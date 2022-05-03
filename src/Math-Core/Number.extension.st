Extension { #name : #Number }

{ #category : #'*Math-Core' }
Number >> addWithRegularMatrix: aMatrix [
	"Adds itself to every row of the matrix"
	^ PMMatrix rows: (aMatrix rowsCollect: [ :row | row + self ])
]

{ #category : #'*Math-Core' }
Number >> addWithVector: aVector [
	"Adds itself to each element of the vector"
	^ aVector collect: [ :each | each + self ]
]

{ #category : #'*Math-Core' }
Number >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector."
	^aVector collect: [ :each | each * self]
]
