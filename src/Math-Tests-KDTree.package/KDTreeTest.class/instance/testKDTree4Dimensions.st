tests
testKDTree4Dimensions
|aVector|
self initializeTreeWith: ((1 to: 2000) collect:   [:n| (rand next:4)-0.5]) as: true . 	"4-dimensional data"
50 timesRepeat: [aVector :=(rand next: 4)- 0.5.								"2 nearest neighbours"
	self equalityTest: (stupid nnSearch: aVector  i:2) and: (tree nnSearch: aVector  i:2)  ] . 
50 timesRepeat: [aVector :=(rand next: 4)-0.5.									"just 1 nearest neighbour"
	self assert: ( (stupid nnSearch: aVector  i:1)  hasEqualElements: (tree nnSearch: aVector  i:1) )    ] .  