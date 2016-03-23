initialization
centerOn: aVector
	
	center := aVector.
	accumulator := DhbVectorAccumulator new: (aVector ifNil:[0]ifNotNil:[ aVector size ])