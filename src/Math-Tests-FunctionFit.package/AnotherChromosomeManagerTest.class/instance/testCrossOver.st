tests
testCrossOver
|a|
1 to: 20 do: [:i| a:=cm crossover: #(1 2 3) and: #(4 5 6).
	1 to:2 do:[:index|
		self assert: (#(1 4) includes: ((a at: index) first)).
		self assert: (#(2 5)includes:((a at: index) at: 2)).
		self assert: (#(3 6) includes:((a at: index) at: 3)).].
	self deny: (((a at: 1)at: 2)=((a at: 2)at: 2)).
	self deny: (((a at: 1)at: 1)=((a at: 2)at: 1)).
	self deny: (((a at: 1)at: 3)=((a at: 2)at: 3)).
	a].
a:= a collect: [:g|g first].
self assert: ((a occurrencesOf: #(1 2 3))<20).