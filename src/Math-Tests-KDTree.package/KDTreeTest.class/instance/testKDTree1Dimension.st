tests
testKDTree1Dimension
|m aVector aResult bResult|
m :=(rand next:200) collect:   [:n| Array with: n]."1-dimensional data, just some numbers"
self initializeTreeWith: m as: true .
1 to: 11do:[:v|aVector :={1/ v asFloat }.
	aResult :=stupid nnSearch: aVector  i:3.						"3 nearest numbers to aVector "
	bResult :=tree nnSearch: aVector  i:3.							
	self equalityTest: aResult and: bResult  ]  .
