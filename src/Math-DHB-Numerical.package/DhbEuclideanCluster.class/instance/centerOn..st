initialization
centerOn: aVector
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	center := aVector.
	accumulator := DhbVectorAccumulator new: (aVector ifNil:[0]ifNotNil:[aVector size]).