transformation
growNegativeContents: anInteger 
	"Private - 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 15/2/99"

	| n newSize newContents |
	n := 1 - anInteger.
	newSize := contents size + n.
	newContents := Array new: newSize.
	newContents at: 1 put: 1.
	2 to: n do: [:i | newContents at: i put: 0].
	newContents
		replaceFrom: n + 1
		to: newSize
		with: contents
		startingAt: 1.
	contents := newContents.
	minimum := anInteger - 1 * binWidth + minimum