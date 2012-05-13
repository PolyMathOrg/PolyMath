accessing
completeData
"return the sorted data with distance (at first place)"
^self isFull ifTrue: [self] ifFalse: [(self copyFrom: 1 to: freeIndex  -1)sort: [:a :b| a first < b first ] ] .
