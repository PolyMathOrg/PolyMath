tests
testSymmetric
|a m|
a:=#(1 2 3)asDhbVector.
m:=PMMatrix rows: #((1 2)(3 3)).
self deny: (m isSymmetric ).
"but a DhbMatrix can of course also be symmetric, 
and it is occasionally interesting to know, 
hence the result should be correct"
m:=PMMatrix rows: (a tensorProduct: a)rows.
self assert: (m isSymmetric ).

