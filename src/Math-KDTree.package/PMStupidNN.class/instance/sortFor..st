sorting
sortFor: aCollection
"sort nearest neighbours of aCollection "
|i|
self do:[:e| i :=aCollection -(e at:2) . e at: 1 put: (i*i)sum ];
	sort .