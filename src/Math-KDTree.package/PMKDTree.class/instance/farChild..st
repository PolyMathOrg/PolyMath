accessing
farChild: aVector
^((value at: dim) < (aVector at: dim)) ifTrue: [left ] ifFalse:   [right ]