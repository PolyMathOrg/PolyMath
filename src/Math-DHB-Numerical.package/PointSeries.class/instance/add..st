public methods
add: anObject
	"Add a point to the receiver"
	self primitiveAdd: anObject.
	self changed: self changedSymbol.
	^anObject