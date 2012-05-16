public methods
remove: anObject
	"Add a point to the receiver"
	self primitiveRemove: anObject.
	self changed: self changedSymbol.
	^anObject