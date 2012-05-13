instance creation
withAll: aCollectionOfCollections
"make a KDTree from aCollectionOfCollections ,which is a Collection of points in a n-dimensional space"
(aCollectionOfCollections allSatisfy: [:c|c isCollection ])ifFalse: 
	[self error: 'KDTree withAll: expects a collection of collections'].    
^self new addData: aCollectionOfCollections asOrderedCollection at:1.     