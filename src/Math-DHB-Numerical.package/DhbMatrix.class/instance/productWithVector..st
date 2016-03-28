double dispatching
productWithVector: aVector
	"Answers the product of the receiver with aVector"
	^ self columnsCollect: [ :each | each * aVector ]