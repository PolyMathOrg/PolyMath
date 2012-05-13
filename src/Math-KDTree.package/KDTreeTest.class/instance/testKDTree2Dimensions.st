tests
testKDTree2Dimensions
|m tree stupid vec aResult bResult|
m :=(1 to: 2000) collect:   [:n| (rand next:2)].	"2-dimensional data"
stupid :=StupidNN withAll: m.
tree :=KDTree  withAll: m.
100 timesRepeat: [vec :=rand next:2.
	aResult :=stupid nnSearch: vec  i:3.
	bResult :=tree nnSearch: vec  i:3.
	self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e])  ] . 
m:= (1 to: 200) collect: [:index | Array with: (rand nextInt: 10) with: (rand nextInt: 10  )]. 	"integers"
stupid :=StupidNN withAll: m.
tree :=KDTree  withAll: m.
100 timesRepeat: [vec :=(rand next: 2)*11.
	aResult :=stupid nnSearch: vec  i:3.
	bResult :=tree nnSearch: vec  i:3.
	self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e]) ] . 
