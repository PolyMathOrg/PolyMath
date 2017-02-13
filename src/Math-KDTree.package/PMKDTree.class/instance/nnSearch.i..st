evaluating
nnSearch: aSequenceableCollection i: anInt
"search for i nearest neighbours of vector aSequenceableCollection and return the vectors "
|n|
n :=PMNNStore new: anInt .
self nnSearch: aSequenceableCollection asFloatArray near: n .
n :=n data .
^anInt =1 ifTrue: [n first ] ifFalse:   [n]  