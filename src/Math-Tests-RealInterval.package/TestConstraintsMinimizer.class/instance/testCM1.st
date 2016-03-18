tests
testCM1
|a r c cc|
a:=ConstraintsMinimizer1 function: f box: box constraints: {c1}.
a maximumIterations: 1000.
r:=a evaluate.
self assert: (r second sup closeTo: -1.732050808).
c:=Constraint new.
a addConstraint:c.
cc:=a constraints.
self assert: cc first =c1. 
self assert: cc second =c. 