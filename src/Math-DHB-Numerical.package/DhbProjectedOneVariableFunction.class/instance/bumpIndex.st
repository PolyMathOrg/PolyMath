transformation
bumpIndex
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	index isNil
		ifTrue: [ index := 1]
		ifFalse:[ index := index + 1.
				  index > argument size
					ifTrue: [ index := 1].
				].