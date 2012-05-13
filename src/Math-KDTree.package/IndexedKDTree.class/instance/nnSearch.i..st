evaluating
nnSearch: aCollection i: anInt
"search for i nearest neighbours of vector aCollection and return the indices; and distances (if i>1, at second position)"
|n|
n :=NNStore new: anInt .
self nnSearch: aCollection near: n .
^anInt =1 ifTrue: [n data first first ] ifFalse:   [n completeData collect: [:i | {(i at:2)first . i first}]  ]  