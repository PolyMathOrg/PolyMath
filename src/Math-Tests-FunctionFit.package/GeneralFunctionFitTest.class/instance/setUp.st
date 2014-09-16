running
setUp 
f:=[ :x :a :b | (a * x) sin / (b + x squared) ].
col:=((-4) to: 4 by:0.1)collect: [:i|i@(f cull: i cull: 0.1 cull: 0.4) ].