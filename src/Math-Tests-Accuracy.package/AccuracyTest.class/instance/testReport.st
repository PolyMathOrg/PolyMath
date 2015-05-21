tests
testReport
self assert:  a report = ''.
a run.
self assert: (a report beginsWith: 'Report for: AccuracyTestExample')