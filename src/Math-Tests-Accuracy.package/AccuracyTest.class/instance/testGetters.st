tests
testGetters
|r|
r:=a testGetterAaa.
self assert:(r = #(#(#(1 2) #(3 2.8888)) #(#(false) #(true)) #(#(5 3) #(4 4)) 2 2)).
r:=a testGetterBbb.
self assert:(r = #(#(#(1) #(3)) #(#('a') #('AG')) #(#(2) #(3)) 2 2)).
 #(#(#(1) #(3)) #(#(1) #(2)) #(#(2) #(3)) 2 2)