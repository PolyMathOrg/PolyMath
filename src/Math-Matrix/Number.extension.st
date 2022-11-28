Extension { #name : #Number }

{ #category : #'*Math-Matrix' }
Number >> addWithRegularMatrix: aMatrix [
	"Adds itself to every row of the matrix"
	^ PMMatrix rows: (aMatrix rowsCollect: [ :row | row + self ])
]

{ #category : #'*Math-Matrix' }
Number >> productWithMatrix: aMatrix [
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])
]
