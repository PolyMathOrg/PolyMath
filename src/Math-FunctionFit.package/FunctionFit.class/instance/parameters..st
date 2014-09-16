initialization
parameters: indexableCollection
indexableCollection do:[ :e|(e equalsTo: 0.0)ifTrue: [ self error:'parameters shouldnt be set to practically zero' ] ].
result parameters: indexableCollection.
self finalizeIterations .