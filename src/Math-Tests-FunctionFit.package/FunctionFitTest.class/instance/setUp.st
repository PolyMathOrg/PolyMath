running
setUp 
f:=[:x :a :b|a*x / (b+x)].
d:=(1 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].