tests-testing
testEqual
self assert: one=onec.
self assert: zero=zeroc.
self assert: one=1.0.
self assert: three=3.
self assert: one~=zero.
self assert: 1.1=(DualNumber value: 1.1 eps:2).
self assert: (1/3)=(DualNumber value: (1/3) eps:(2/3)).
self assert: 1/3.0~=(DualNumber value: (1/3)eps:2)hash.





