tests
testHash
self assert: one hash=onec hash.
self assert: zero hash=zeroc hash.
self assert: one hash=1 hash.
self assert: three hash=3 hash.
self assert: one hash~=zero hash.
self assert: 1.1 hash=(DualNumber value: 1.1 eps:2)hash.
self assert: (1/3) hash=(DualNumber value: (1/3) eps:(2/3))hash.
self assert: 1/3.0 hash~=(DualNumber value: (1/3)eps:2)hash.





