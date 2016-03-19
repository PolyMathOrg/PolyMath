enumerating
intervalCollect: aBlock 
"result of aBlock can be a Number, a RealInterval, or an IntervalCollection. the final result can reduce to a RealInterval. "
	| newCollection i| 
	newCollection := self class new: self size.
	self do: [:each | 
		i:=aBlock value: each .
		i isIntervalUnion 
			ifTrue: [ newCollection addAll: i ]
			ifFalse:[	(i isRealInterval) ifFalse:[i:=RealInterval fromNumber: i]. 	newCollection addLast: i]].
	^ newCollection reSort strongReduce 