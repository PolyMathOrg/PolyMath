running
initializeTreeWith: aCollection as: simpleTree 
"used to initialize all tests"
stupid :=PMStupidNN withAll: aCollection.
tree := simpleTree ifTrue: [ PMKDTree withAll: aCollection ] ifFalse: [PMIndexedKDTree  withAll: aCollection ].