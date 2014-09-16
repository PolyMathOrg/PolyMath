tests
testChangeParametersBy
|s | 
s:=SimpleParameterFunction function: f parameters: #(1 1 2).
s changeParametersBy: #(3 2 1).
self assert: (s parameters =#(4 3 3)).
