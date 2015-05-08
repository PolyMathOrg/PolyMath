tests
testBenchmark
|aStream s|
(RPackage  organizer includesPackageNamed: 'Math-Benchmarks-KDTree') ifFalse:[^self skip].
aStream :=ReadWriteStream with:''.
(KDTreeBenchmark fastRun: 1 with: Array)printOn: aStream . 
s :=aStream contents .
self assert: (s allRangesOfSubstring: 'Benchmark')size = 5 .
aStream :=ReadWriteStream with:''.
(KDTreeBenchmark run: 1 with: OrderedCollection )printOn: aStream . 
s :=aStream contents .
self assert:((s allRangesOfSubstring: 'Benchmark')size =7).
