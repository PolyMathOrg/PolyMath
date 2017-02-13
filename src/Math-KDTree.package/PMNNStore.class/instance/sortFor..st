sorting
sortFor: whatever
"should be overwritten by subclasses"
"
canonical form:
self do:[:e|e at: 1 put: somethingDependingOnWhatever ].
self sort.
"
"sortFor: should not be called before the NNStore is full!"
self do:[:e|e at: 1 put: (e at: 2) ].
self sort .