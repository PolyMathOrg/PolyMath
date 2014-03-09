initialize-release
initialize 
"can also be used for resetting as eg in testEqual2"
lastUsedIndex :=0.
maxDistance := ((self size = 0) ifTrue: [ 0.0 - Float infinity ]ifFalse: [ Float infinity ]). "(self size = 0) ifTrue: is necessary here, ifEmpty wouldnt work"
