operation
shiftDirections
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	| position delta firstDirection |
	firstDirection := bestPoints first direction.
	bestPoints inject: nil
					into: [ :prev :each |
							position isNil
								ifTrue: [ position := each origin]
								ifFalse:[ prev direction: each direction].
							each
							].
	position := bestPoints last origin - position.
	delta := position norm.
	delta > desiredPrecision
		ifTrue: [ bestPoints last direction: (position scaleBy: (1 / delta))]
		ifFalse:[ bestPoints last direction: firstDirection].