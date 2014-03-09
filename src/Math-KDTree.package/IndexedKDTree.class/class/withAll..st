instance creation
withAll: aCollectionOfCollections
"make a KDTree from a SequenceableCollection of SequenceableCollections ,which is an ordered Collection of points in a n-dimensional space. the nearest neighbour search then returns the indices of the neighbours"
|c|
c :=aCollectionOfCollections withIndexCollect: [:v :i| {i.v.}]  .
^super withAll: c.  