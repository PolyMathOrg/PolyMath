tests
testManager
|fit|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
self assert: (fit manager class =AnotherChromosomeManager ).
self assert: (fit manager range= #(5 5)).


