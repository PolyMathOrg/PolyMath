evaluating
nnSearch: aSequenceableCollection i: anInt
"search for i nearest neighbours of vector aSequenceableCollection and return the indices; and squared distances (if i>1, at second position)"
|n|
n :=PMNNStore new: anInt .
self nnSearch: aSequenceableCollection asFloatArray near: n .
^anInt =1 ifTrue: [n data first first ] ifFalse:   [n completeData collect: [:i | {(i at:2)first . i first}]  ]  