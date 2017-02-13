tests
testKernelAndData
|b|
b:=[:x|x].
density kernel:b.
density data: #(-1 2 2 5).
self assert: (density data=#(-1 2 2 5)asSortedCollection ).
self assert: (density kernel=b).
self assert: (density value:2)=0.
