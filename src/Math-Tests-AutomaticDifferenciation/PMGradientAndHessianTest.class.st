Class {
	#name : #PMGradientAndHessianTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-AutomaticDifferenciation'
}

{ #category : #tests }
PMGradientAndHessianTest >> test [
	| f g h r |
	f := [ :i | 
	| x y |
	x := i first.
	y := i second.
	(x raisedToInteger: 3) + (x squared * y) - y squared - (4 * y) ].
	g := PMGradient of: f.
	h := PMHessian of: f.
	r := #(0 0).
	self assert: (g value: #(0 -2)) equals: r.
	self
		assert:
			(g
				value:
					{1.
					(-3 / 2)})
		equals: r.
	self assert: (g value: #(-4 6)) equals: r.
	self
		assert: (h value: #(0 -2))
		equals: (PMMatrix rows: #(#(-4 0) #(0 -2))).
	self assert: h gradient equals: r
]

{ #category : #tests }
PMGradientAndHessianTest >> test2 [
|f g h r|
f := [:i||x y|x:=i first.y:=i second.
	 (x exp + y exp )ln].
g := PMGradient of: f.
(h := PMHessian of: f)value:#(0 0).
r:=#(0.5 0.5).
self assert: ((g value:#(0 0))equalsTo:r).
self assert: (h gradient equalsTo:r).
r:=(-1 exp + 1 exp)reciprocal. 
self assert: ((g value:#(-1 1))equalsTo:(r * #(-1  1)exp)).
self assert: (h result equalsTo: (PMMatrix rows: #((0.25 -0.25)(-0.25 0.25)))) .
]
