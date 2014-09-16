tests
testEirCrossOver
|a|
a :=(1 to: 200)collect: [:i| a:=cm eirCrossover: #(1.0 3.0) and: #(5.0 1.0).
		self assert: (((a at: 1)at:1) between: -1 and: 7).
		self assert: (((a at: 1)at:2) between: 0 and: 4).
		self assert: (((a at: 2)at:1) between: -1 and: 3).
		self assert: (((a at: 2)at:2) between: 2 and: 4).
		a].
self assert: (a anySatisfy: [:g|((g at: 1)at:1)<0]).
self assert: (a anySatisfy: [:g|((g at: 1)at:1)>6]).
self assert: (a anySatisfy: [:g|((g at: 1)at:2)<1]).
self assert: (a anySatisfy: [:g|((g at: 1)at:2)>3]).
self assert: (a anySatisfy: [:g|((g at: 2)at:1)<0]).
self assert: (a anySatisfy: [:g|((g at: 2)at:1)>2]).
self assert: (a anySatisfy: [:g|((g at: 2)at:2)<3]).
self assert: (a anySatisfy: [:g|((g at: 2)at:2)>3]).
self shouldnt: [a:=cm eirCrossover: #(1 -3) and: #(1 -3)] raise: Error.
(1 to: 20)do: [:i| a:=cm eirCrossover: #(-1.0 -1) and: #(1 1.0).
		self assert: (((a at: 1)at:1) between: -2 and: 2).
		self assert: (((a at: 1)at:2) between: -2 and: 2).
		self assert: (((a at: 2)at:1) between: -2 and: 0).
		self assert: (((a at: 2)at:2) between: -2 and: 0).
		].	
