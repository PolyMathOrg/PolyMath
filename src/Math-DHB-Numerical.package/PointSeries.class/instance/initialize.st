public methods
initialize
	"Create the point collection"
	points := SortedCollection sortBlock: self sortBlock.
	^self