tests
testNewFrom
|n |
n :=NNStore newFrom:#(#(1 $a) #(3 1.0) #(0 '2')).
self assert: (n  data= #('2' $a 1.0) ).
self assert: n isFull .
self assert: (n maxDistance=3).
n add: #(2 true).
self assert: (n maxDistance=2).
n add: #(0.5 nil).
self assert: (n maxDistance=1).
self assert: (n data = #('2' nil $a)).
