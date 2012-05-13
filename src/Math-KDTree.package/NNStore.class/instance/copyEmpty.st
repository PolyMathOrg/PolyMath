copying
copyEmpty
	^ self species new: (self size min: (freeIndex -1 max: 1))