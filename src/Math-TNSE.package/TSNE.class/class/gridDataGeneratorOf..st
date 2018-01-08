as yet unclassified
gridDataGeneratorOf: size
	| points |
	points := Bag new.
	0 to: size do: [ :x | 0 to: size do: [ :y | points add: x @ y ] ].
	^ points