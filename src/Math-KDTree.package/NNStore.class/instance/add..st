adding
add: distAndNeighbour
"distAndNeighbour is a SequenceableCollection of the sorting index and the data value.
 dist, the sorting index, has to be a number. distAndNeighbour will only be added if dist is as good or better (smaller) than maxDistance. if NNStore is full, further data will be added at the last position and the last data, which must be worse than distAndNeighbour, will be overwritten."
	(maxDistance > distAndNeighbour first) ifFalse: [^self]. 
	self isFull ifFalse: [lastUsedIndex :=lastUsedIndex +1] .
	self at:  lastUsedIndex  put: distAndNeighbour.
	self isFull ifTrue: [ self sort ].