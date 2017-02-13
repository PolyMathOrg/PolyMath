tests
testBasic
|d|
fit:=PMGeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
self assert: (fit evaluate equalsTo:  #(0.1 0.4)).
(fit result - #(0.1 0.4))abs with: (fit secondaryResult - #(0.1 0.4))abs do:
	 [:e :s| self assert: (s -e > 0)].
d:=fit error:fit secondaryResult.
self assert: (d<1e-5).
self assert: (fit error<d).


