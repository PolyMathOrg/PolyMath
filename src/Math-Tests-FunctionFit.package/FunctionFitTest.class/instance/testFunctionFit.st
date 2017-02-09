tests
testFunctionFit
	| ff ar p |
	ff := FunctionFit function: f data: d.
	ar := ff parameters.
	ar
		do: [ :i | 
			self assert: i isNumber.
			self assert: i ~= 0 ].
	ff parameters: #(1 2).
	self assert: ff parameters equals: #(1 2).
	p := PMWeightedPoint point: -2 @ 1.
	self shouldnt: [ ff accumulate: p ] raise: Error.	"function result will be NaN and should be ignored in the following calculations"
	ff parameters: ar.
	ff evaluate.
	self assert: (ff parameters equalsTo: #(2 0.4))