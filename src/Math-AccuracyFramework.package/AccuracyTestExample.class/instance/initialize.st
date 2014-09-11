initialize-release
initialize 
"this is always necessarily the first thing:"
super initialize .
"this is only for testSetup:"
count:=0.
"now you can set defaults:"
self result: #(#(2)#(3)).
self argument: #(#('a') #('AG')).
self parameter: #(#(1) #(3))
