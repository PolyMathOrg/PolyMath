operation
productWithMatrix: aMatrix
	"Answers the product of aMatrix with the receiver."
	^aMatrix rowsCollect: [ :each | each * self]