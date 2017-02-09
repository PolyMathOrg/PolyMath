initialization
centerOn: aVector
	
	center := aVector.
	accumulator := PMVectorAccumulator new: (aVector ifNil:[0]ifNotNil:[ aVector size ])