accessing
nearChild: aVector
^((value at: dim) < (aVector at: dim)) ifTrue: [right ] ifFalse:   [left ]