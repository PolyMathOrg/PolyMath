running
initializeTreeWith: aCollection as: simpleTree 
"used to initialize all tests"
stupid :=StupidNN withAll: aCollection.
tree := simpleTree ifTrue: [ KDTree withAll: aCollection ] ifFalse: [IndexedKDTree  withAll: aCollection ].