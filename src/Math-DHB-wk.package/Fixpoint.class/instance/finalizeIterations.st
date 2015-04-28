operation
finalizeIterations
self hasConverged 
	ifTrue:[
		(cycleFlag 
			ifTrue:[result=result1 and:[result~=result2]] 
			ifFalse:[result=result2 and:[result~=result1]])
		ifTrue: [self cycleInfo: 2] 
		ifFalse:[	self simpleInfo]]
	ifFalse: [ self cycleLength 
		ifNil:[self unfinishedInfo]
		ifNotNilDo: [ :x|self adjustIteratorFor: x. self cycleInfo: x]].