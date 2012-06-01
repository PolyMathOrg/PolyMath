*Math-DHB-Numerical-Extensions
removeAtIndex: anIndex
	"Remove the element of the collection at position anIndex.  Answer the object removed."

	| obj |
	obj := self at: anIndex.
	self removeIndex: anIndex + firstIndex - 1.
	^obj