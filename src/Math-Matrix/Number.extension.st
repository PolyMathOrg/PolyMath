Extension { #name : #Number }

{ #category : #'*Math-Matrix' }
Number >> productWithMatrix: aMatrix [
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])
]
