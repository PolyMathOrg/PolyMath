tests
testNormal
|r|
density normal.
r:=0.2419707245.
self assert: (( #(1 0 -1 -2.9)collect:[:x|density kernel value: x])equalsTo: 
				(Array with:r with: 0.3989422804 with: r with: 0.0059525324197)).
