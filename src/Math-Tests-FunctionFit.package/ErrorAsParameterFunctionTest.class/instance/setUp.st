running
setUp 
|col|
f:=ErrorOfParameterFunction new function: [:x :a :b|a*x / (b+x)].
col:=(1 to: 3)collect: [:i|i@(f function cull: i cull: 1 cull: 1) ].
f data: col.
f :=ErrorAsParameterFunction new function: f.