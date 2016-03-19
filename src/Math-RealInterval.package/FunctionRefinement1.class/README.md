A FunctionRefinement1  is a  refinement of a function of  a box or RealInterval or IntervalUnion using the Skelboe-Moore algo.
example:
f:=[:x|x - x squared]. 
x:=RealInterval inf: 0.0 sup: 1.0.
f value:x . "--> [-1.0,1.0]"
ff:=FunctionRefinement1 function: f box:x.
ff evaluate .  "--> [-1.032869778594403e-8,0.2500211522783466] "
the theoretically best interval result would be [ 0,0.25 ]  which is nicely included in the result of #evaluate. 