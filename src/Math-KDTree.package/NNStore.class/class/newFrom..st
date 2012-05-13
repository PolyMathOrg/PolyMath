instance creation
newFrom: aCollectionWithSortingIndex
"example:
( NNStore newFrom:#(#(3 1.0) #(0 '2')) ) data.   #('2' 1.0)"
^((super newFrom: aCollectionWithSortingIndex )freeIndex: aCollectionWithSortingIndex size +1)sort  