tests
testEqual
|a b|
b :=#(#(1 $a) #(3 1.0) #(0 '2')).
a :=NNStore newFrom: b.
self deny: (a=b).
b :=NNStore newFrom:#(#(1 $a) #(3 1.0) #(0 2)).
self deny: (a=b).
b :=a copyEmpty .
self deny: (a=b).
b addAll: #(#(3 1.0) #(1 $a) #(4 true) #(0 '2')).
self assert: (a=b).
b add: #(2 nil).
self deny: (a=b).
b :=NNStore new:3.
a :=NNStore new:2.
a add: #(2 nil).
b add: #(2 nil).
self deny: (a=b).
self deny: (b hash=a hash).