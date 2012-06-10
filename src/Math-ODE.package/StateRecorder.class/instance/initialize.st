initialize-release
initialize
	super initialize.
	states := SortedCollection sortBlock: [:x :y | x time < y time].
	^ self