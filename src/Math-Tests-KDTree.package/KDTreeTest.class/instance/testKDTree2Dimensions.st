tests
testKDTree2Dimensions
|aVector aResult bResult|
self initializeTreeWith: ((1 to: 2000) collect:   [:n| (rand next:2)]) as: true .	"2-dimensional data"
100 timesRepeat: [aVector :=rand next:2.
	aResult :=stupid nnSearch: aVector  i:3.
	bResult :=tree nnSearch: aVector  i:3.
	self equalityTest: aResult and: bResult  ] . 