instance creation
withAll: aCollectionOfCollections
"make a KDTree from aCollectionOfCollections ,which is a Collection of points in a n-dimensional space"
|c|
c :=aCollectionOfCollections withIndexCollect: [:v :i| {i.v.}]  .
^super withAll: c.  