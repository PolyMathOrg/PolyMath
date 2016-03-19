A FunctionRefinement0 is a naive implementation of a refinement of a function of _one_ var. it exists mainly for testing purposes.
example:
f:=[:x|x - x squared]. 
x:=RealInterval inf: 0.0 sup: 1.0.
f value:x . "--> [-1.0,1.0]"
ff:=FunctionRefinement0 function: f interval:x .
ff evaluate .  "--> [-0.0010000000000000009,0.251] "  
