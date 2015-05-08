tests-testing
testSmaller
self assert: one<1.1.
self deny: one<0.
self assert: 1>zeroc.
self deny: -0.1>zeroc.
self deny: three<3.
self assert: three<=3.
self assert: 4>=three.
self deny: three<=2.9.
self deny: onec<=0.9.
self assert: one<three.
self assert: three>one.
self deny: three<three.





