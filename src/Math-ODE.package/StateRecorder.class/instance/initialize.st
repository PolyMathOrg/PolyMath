initialize-release
initialize
	super initialize.
	states := SortedCollection sortBlock: [:x :y | x y < y y].
	^ self