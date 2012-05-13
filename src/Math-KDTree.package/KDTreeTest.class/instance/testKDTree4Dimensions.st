tests
testKDTree4Dimensions
|m tree stupid vec aResult bResult|
m :=(1 to: 2000) collect:   [:n| (rand next:4)].		"4-dimensional data"
stupid :=StupidNN withAll: m.
tree :=KDTree  withAll: m.
50 timesRepeat: [vec :=(rand next: 4)- 0.5.
	aResult :=stupid nnSearch: vec  i:2.						"2 nearest neighbours"
	bResult :=tree nnSearch: vec  i:2.
	self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e])  ] . 
50 timesRepeat: [vec :=rand next: 4.
	aResult :=stupid nnSearch: vec  i:1.						"just the nearest neighbour"
	bResult :=tree nnSearch: vec  i:1.
	self assert: (aResult  hasEqualElements: bResult )    ] . 
