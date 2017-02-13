instance creation
withAll: aCollectionOfCollections
"make a KDTree from a Collection of SequenceableCollections ,which is a Collection of points in a n-dimensional space"
(aCollectionOfCollections allSatisfy: [:c|c isCollection ])ifFalse: 			"isSequenceable does not work here in a simple way"
	[self error: 'KDTree withAll: expects a collection of collections']. 
aCollectionOfCollections first ifEmpty: [self error: 'KDTree withAll: error'  ].
^self new addData: aCollectionOfCollections asOrderedCollection at:1.     