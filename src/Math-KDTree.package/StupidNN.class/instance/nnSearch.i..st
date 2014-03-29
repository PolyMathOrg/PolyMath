evaluating
nnSearch: aCollection i:anInt
"search for i nearest neighbours of vector aCollection "
|d|
self sortFor: aCollection asFloatArray.
d :=self data .
anInt =1 ifTrue:[^d first ].
^d size >anInt ifTrue: [d copyFrom: 1 to: anInt]ifFalse: [d]  
  