converting
split:at
(at<inf or:[at>sup]) ifTrue: [ ^nil ].
self isAtomic ifTrue: [ ^(ConsistsOfFloatsOnly and:[self isNumber not])
	ifFalse: [ nil ] 
	ifTrue:[ 	Array with: (self class fromNumber: inf) with: (self class fromNumber: sup)] ]
  ifFalse:[(at=inf or:[at=sup])ifTrue:[^nil]].
^Array  with: (self class inf: inf sup: at) with: (self class inf: at sup: sup)