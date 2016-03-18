tests
testRefinement

| func i r p v r1|
func :=[:x|x - x squared]. 
i:=RealInterval inf: 0.0 sup: 1.0. 
r:=FunctionRefinement1 function: func box:i.
v:=FunctionRefinement1 skelboeMooreVersion.
FunctionRefinement1 skelboeMooreVersion:1.
r1:=r evaluate.
r maximumIterations: 10.
r:=r evaluate.
self assert: (r includes: r1).
self assert: (r1 includes: (RealInterval inf: 0 sup:0.25) ).
self deny: (r1 includes: r).
FunctionRefinement1 skelboeMooreVersion:2.
r:=FunctionRefinement1 function: func box:i.
r:=r evaluate.
p:=SkelboeMoore2 defaultPrecision.
self assert: (r inf abs<p). 
self assert: ((r sup - 0.25) abs<p). 
self assert: (r includes:0.25).
self assert: (r includes:0).
r:=FunctionRefinement0 function: func interval:i.
r numberOfSplits:2000.
r:=r evaluate.
self assert: (r inf abs < 0.001). 
self assert: (r sup - 0.25)abs < 0.001.
self assert: (r includes:0.25).
self assert: (r includes:0).
r:=FunctionRefinement0 function: func interval: (IntervalUnion with: i with: (2 hull:3) with: 5).
r:=r evaluate.
i:=IntervalUnion with: ((0 hull:(1/4)))with: (-6 hull:(-2)) with: -20.
self assert: (r includes: i).
self assert: i width =4.25.
self assert: r width < 4.255.
":i guess i should also make FunctionRefinement1 deal correctly with such problems, not yet done though, it just produces a hull around the solution, not an IntervalUnion:"
i:= IntervalUnion with: ( RealInterval inf: 0 sup: 0.2 ) with: (RealInterval inf: 0.6 sup:1).
r:=FunctionRefinement1 function: func box:i.
r:=r evaluate.
self assert: (r inf abs<p). 
self assert: ((r sup - 0.24) abs<p). 
self assert: (r includes:0.24).
self assert: (r includes:0). 
FunctionRefinement1 skelboeMooreVersion:v.