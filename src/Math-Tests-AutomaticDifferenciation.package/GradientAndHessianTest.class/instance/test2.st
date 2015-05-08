tests
test2
|f g h r|
f := [:i||x y|x:=i first.y:=i second.
	 (x exp + y exp )ln].
g := Gradient of: f.
(h := Hessian of: f)value:#(0 0).
r:=#(0.5 0.5).
self assert: ((g value:#(0 0))equalsTo:r).
self assert: (h gradient equalsTo:r).
r:=(-1 exp + 1 exp)reciprocal. 
self assert: ((g value:#(-1 1))equalsTo:(r * #(-1  1)exp)).
self assert: (h result equalsTo: (DhbMatrix rows: #((0.25 -0.25)(-0.25 0.25)))) .