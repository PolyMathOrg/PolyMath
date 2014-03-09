tests
testInitialize
|a b|
a :=(NNStore newFrom:#(#(4 $a) #(5 1.0) #(6 '2')))  .	
b :=(NNStore newFrom:#(#(4 $a) #(5 1.0) #(6 '2'))) initialize .	
self deny: (a=b).
a initialize.
self assert: (a=b).
b add: #(4 $a). 
self deny: (a=b).
a add:#(4 $a).
self assert: (a=b).	
a add: #(5 1.0). 
self deny: (a=b).
