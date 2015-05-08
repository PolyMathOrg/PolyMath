tests
test
|f g h r|
f:=[:i||x y|x:=i first.y:=i second.
	 (x raisedToInteger: 3)+(x squared *y)- y squared - (4*y)].
g := Gradient of: f.
h := Hessian of: f.
r:=#(0 0).
self assert: (g value:#(0 -2))=r. 
self assert: (g value:{1. (-3/2)})=r.
self assert: (g value:#(-4 6))=r.
self assert:(h value:#(0 -2))=(DhbMatrix rows:#((-4 0)(0 -2))).
self assert:h gradient =r.