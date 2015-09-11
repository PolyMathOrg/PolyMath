accessing
equalityTest: aBlock
"you can set your own equality test to decide when the fixpoint is reached" 
self assert: aBlock argumentCount=2.
^equalityTest:=aBlock