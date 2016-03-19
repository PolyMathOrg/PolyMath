converting
splitTimes:anInteger
|i s w c|
w:=self width / anInteger.
i:=inf.
c:=OpenIntervalUnion  new:anInteger .
1 to: anInteger do:[:n|
	s :=  inf+ ( n * w ).
	c add: (self class inf: i sup: s).
	i:=s].
c last sup: sup.
^c