tests
testCheckStrongEquality
fp block: [:x| |d| d:=x-1.d< -2 ifTrue:[d:=2].d]."can return an Integer!"
fp value:2.0."aFloat"
fp evaluate .
self assert: fp iterations=10."first 4 Floats, then 5 integers, the a repeat"
self assert: fp hasConverged .
self assert: fp cycleLength =5 .