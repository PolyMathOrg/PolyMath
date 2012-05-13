tests
testKDTree1Dimension
|m tree stupid vec aResult bResult|
m :=(rand next:200) collect:   [:n| Array with: n]."1-dimensional data, just some numbers"
stupid :=StupidNN withAll: m.
tree :=KDTree  withAll: m.
1 to: 11do:[:v|vec :={1/ v asFloat }.
	aResult :=stupid nnSearch: vec  i:3.						"3 nearest numbers to vec"
	bResult :=tree nnSearch: vec  i:3.							"3 nearest numbers to vec using KDTree"
	self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e])  ]  .
m :=(1 to: 20) collect: [:index | Array with: (rand nextInt: 10)].	"only integers, obviously with multiples. test distances because nn are not necessarily the same"
stupid :=StupidNN withAll: m.
tree :=KDTree  withAll: m.
0 to: 11do:[:v|vec :={v}.
	aResult :=(vec first - (stupid nnSearch: vec  i:3))abs.		"distances between 3 nearest numbers and vec"
	bResult :=(vec first - (tree nnSearch: vec  i:3))abs.		"distances using KDTree"
	self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e]) ]  .
tree :=KDTree  withAll: #(#(1)).								"extreme case"
bResult :=tree nnSearch: #(2) i: 3.
self assert: (bResult size =1).
self assert: (bResult first = #(1) )   