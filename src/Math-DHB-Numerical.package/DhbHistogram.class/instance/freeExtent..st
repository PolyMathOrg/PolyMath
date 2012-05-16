initialization
freeExtent: aBoolean
		"Defines the range of the receiver to be freely adjustable.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	( underflow = 0 and: [ overflow = 0])
		ifFalse: [ self error: 'Histogram extent cannot be redefined'].
	freeExtent := aBoolean.