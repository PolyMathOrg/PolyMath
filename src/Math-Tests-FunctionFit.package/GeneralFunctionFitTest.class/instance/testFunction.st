tests
testFunction 
|fit y|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
y:=fit function  value: 3 value: 0.1 value: 0.4.
fit evaluate .
self assert: ((fit function value:3) equalsTo:  y).



