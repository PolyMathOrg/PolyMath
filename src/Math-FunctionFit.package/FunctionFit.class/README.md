FunctionFit fits a function to some data. the data has to be a collection of points x@f(x). the fitting minimizes the squared error.
f:=[:x :a :b|a*x / (b+x)].
col:=(1 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].
fit:= FunctionFit function: f data: col .
fit evaluate . 
fit result parameters .   --->  #(1.9999999999999998 0.39999999999999863)