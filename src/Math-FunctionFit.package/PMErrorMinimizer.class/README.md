ErrorMinimizer fits a function to some data using an ErrorOfParameterFunction . It is internally used by GeneralFunctionFit . It is generally better to use GeneralFunctionFit .
f:=[:x :a :b|a*x / (b+x)].
col:=(1 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].
er:=ErrorOfParameterFunction function: f data: col.
er errorType: #median.
fit:= ErrorMinimizer function: er.
fit evaluate . 
fit  parameters. 	-->  #(2.0 0.39999999999903596)