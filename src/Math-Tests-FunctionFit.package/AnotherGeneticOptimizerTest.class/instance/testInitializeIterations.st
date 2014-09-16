tests
testInitializeIterations
self assert: (go bestPoints isEmpty ).
go initializeIterations .
self deny: (go bestPoints isEmpty ). 
go calcStatistics: true.
go evaluate .
self deny: (go bestValueHistory isEmpty  ).
go initializeIterations .
self assert: (go bestValueHistory isEmpty  ).


