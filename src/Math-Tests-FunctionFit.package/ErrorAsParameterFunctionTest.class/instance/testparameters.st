tests
testparameters
f parameters:#(1 1).
f changeParametersBy:#(1 1).
self assert: (f parameters= #(2 2) ).
