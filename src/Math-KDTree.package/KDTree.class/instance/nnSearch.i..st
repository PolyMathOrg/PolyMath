evaluating
nnSearch: aCollection i:anInt
"search for i nearest neighbours of vector aCollection "
|n|
n :=NNStore new: anInt .
self nnSearch: aCollection near: n .
n :=n data .
^anInt =1 ifTrue: [n first ] ifFalse:   [n]  