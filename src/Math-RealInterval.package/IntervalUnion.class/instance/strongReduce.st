converting
strongReduce
|x|
"at the moment in IntervalUnion only used by split, split:, icollect: and with:icollect:. also used in SkelboeMoore algo. can be a bit tricky"
self reduce.
self isEmpty 
	ifTrue: [ x:=RealInterval new . self become: x ] 
	ifFalse:[self size =1 ifTrue:[x:=self first copy. self become: x]].
