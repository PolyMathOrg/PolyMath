tests
testInitialize3
|a|
a :=(NNStore newFrom:#(#(7 $a) #(5 1.0) #(6 '2'))) initialize .	
a add: #(5 1.0); add: #(4 $a). 
self assert: (a data=#($a 1.0)).
self assert: (a completeData =#(#(4 $a) #(5 1.0)) ).	


