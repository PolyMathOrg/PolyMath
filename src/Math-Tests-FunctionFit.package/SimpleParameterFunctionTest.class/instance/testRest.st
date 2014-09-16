tests
testRest
|s vg| 
s:=SimpleParameterFunction function:f.
self assert: (s parameters size =3).
vg:=s valueAndGradient: 2.
self assert: (s parameters first =vg first).
self assert: (vg second equalsTo: #(1 0 0)).

s parameters: #(2 0 0).
self assert: ((s value: 0) =2).
self assert: (s parameters =#(2 0 0)).
self assert: (s parameterSize =3).