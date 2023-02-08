Extension { #name : #Number }

{ #category : #'*Math-Matrix' }
Number >> addWithRegularMatrix: aMatrix [
	"Adds itself to every row of the matrix"
	^ PMMatrix rows: (aMatrix rowsCollect: [ :row | row + self ])
]

{ #category : #'*Math-Matrix' }
Number >> complexConjugate [
	"The complex conjugate of a complex number (a + bi) is another complex number (a - bi).
	Every real number x is also a complex number with imaginary part equal to 0.
	In other words, x = x + 0i and x = x - 0i.
	Therefore, the complex conjugate of a real number is the same real number"
	
	"Maintenance note: This method is related to complexes but is packaged in Matrix because the version on Number is not dependant of Complexe and is used by matrix algos."
	
	^ self
]

{ #category : #'*Math-Matrix' }
Number >> productWithMatrix: aMatrix [
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])
]
