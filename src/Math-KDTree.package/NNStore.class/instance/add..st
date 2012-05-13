adding
add: distAndNeighbour
"if NNStore is full, further data will be added at the last position and the last data will be overwrittten"
	self at: (self isFull ifTrue: [ self size ] ifFalse: [ freeIndex ]) put: distAndNeighbour.
	freeIndex := freeIndex + 1.
	self isFull ifTrue: [ self sort ].