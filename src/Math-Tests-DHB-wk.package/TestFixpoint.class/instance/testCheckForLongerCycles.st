tests
testCheckForLongerCycles
fp:=Fixpoint block: [:x| |d| d:=x-1.d< -2 ifTrue:[d:=0.0].d] value: 20.0.
self assert: fp cycleLength isNil.
self assert: fp evaluate=0.
self assert: fp iterations=23. 
self assert: fp hasConverged .
self assert: fp cycleLength =3 .
self assert: fp cycle = #(-1 -2 0).
fp maximumIterations: 10.
fp value: 11.0.
fp evaluate .
self deny: fp hasConverged .
self assert: fp cycleLength isNil.
self assert: fp cycle = #().