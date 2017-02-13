tests
testResetBestPoints
fit:=PMGeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
fit evaluate .
fit resetBestPoints.
self assert: (fit optimizer bestPoints isEmpty ).