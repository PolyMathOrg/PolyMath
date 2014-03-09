tests
testIndexedKDTree4Dimensions
|m aVector aResult bResult|
m :=(1 to: 2000) collect:   [:n| (rand next:4)-0.5].		"4-dimensional data"
self initializeTreeWith: m as: false .
50 timesRepeat: [aVector :=(rand next: 4)- 0.5.
	aResult :=stupid nnSearch: aVector  i:2.						"2 nearest neighbours"
	bResult :=m atAll: ((tree nnSearch: aVector  i:2)collect: [:a|a first]).
	self equalityTest: aResult and: bResult  ] . 
