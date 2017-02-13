accessing
completeData
"return the sorted data with distance (at first place)"
|ar |
ar :=(Array new:lastUsedIndex) replaceFrom: 1 to:  lastUsedIndex with: self startingAt:  1 .
^self isFull ifTrue: [ar] ifFalse: [ar sort: [: a :b| a first < b first ] ]
