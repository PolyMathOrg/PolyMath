enumerating
with: anICollection intervalCollect: aBlock 
"combine everything in receiver with everything in anICollection. not comparable with #with:collect: . 
 necessary for binary methods like #+, #- etc. 
result of aBlock can be a RealInterval or an IntervalCollection; not a Number (!), as i think at the moment its not really necessary.
final result can reduce to a RealInterval ."
	| newCollection i| 
	newCollection := self class new: (self size * anICollection size).
	self do: [:each |anICollection do: [:x|
			i:=aBlock value: each value: x.
			i isIntervalUnion 
				ifTrue: [ newCollection addAll: i ]
				ifFalse: [ newCollection addLast: i]]].
	^newCollection reSort strongReduce.
