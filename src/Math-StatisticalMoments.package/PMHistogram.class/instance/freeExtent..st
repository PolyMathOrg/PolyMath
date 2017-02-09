initialization
freeExtent: aBoolean
	"Defines the range of the receiver to be freely adjustable."

	(underflow = 0 and: [ overflow = 0 ])
		ifFalse: [ self error: 'Histogram extent cannot be redefined' ].
	freeExtent := aBoolean