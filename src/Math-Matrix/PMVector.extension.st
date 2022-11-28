Extension { #name : #PMVector }

{ #category : #'*Math-Matrix' }
PMVector >> productWithMatrix: aMatrix [

	"Answers the product of aMatrix with the receiver."

	^ aMatrix rowsCollect: [ :each | each * self ]
]

{ #category : #'*Math-Matrix' }
PMVector >> reshapeWithDimensions: dimensionArray [

	| computedRows rowNum colNum |
	self checkDimensionalCompatibility: dimensionArray.
	rowNum := dimensionArray at: 1.
	colNum := dimensionArray at: 2.
	computedRows := (1 to: rowNum) collect: [ :i | (1 to: colNum) collect: [ :j | self at: i - 1 * colNum + j ] ].

	^ PMMatrix rows: computedRows
]

{ #category : #'*Math-Matrix' }
PMVector >> tensorProduct: aVector [
	"Answers the tensor product of the receiver with aVector."
	^self == aVector "dont use #="
			ifTrue: [PMSymmetricMatrix new: self size function:[:x :y|(self at: x) * (self at: y)]] 
			ifFalse:[PMMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])]

]
