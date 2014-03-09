tests
testKDTree1DimensionIntegers
|m aVector aResult bResult|
m :=(1 to: 20) collect: [:index | Array with: (rand nextInt: 10)].	"only integers, obviously with multiples. test distances because the nearest neighbours are not necessarily the same"
self initializeTreeWith: m as: true .
0 to: 11do:[:v|aVector :={v}.
	aResult :=(aVector first - (stupid nnSearch: aVector  i:3))abs.		"distances between 3 nearest numbers and aVector "
	bResult :=(aVector first - (tree nnSearch: aVector  i:3))abs.		"distances using KDTree"
	self equalityTest: aResult and: bResult ]  .