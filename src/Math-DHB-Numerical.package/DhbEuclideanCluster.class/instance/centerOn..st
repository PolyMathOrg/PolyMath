initialization
centerOn: aVector
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
		"minimal change so that it works in pharo 1.2.1" 
	center := aVector.
	accumulator := DhbVectorAccumulator new: (aVector ifNil:[0]ifNotNil:[aVector size]).