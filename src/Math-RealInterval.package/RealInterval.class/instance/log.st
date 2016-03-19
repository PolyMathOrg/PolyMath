mathematical functions
log
^sup<0 
	ifTrue:[  RealInterval new]
	ifFalse:[ RealInterval inf: ((inf<0) ifTrue: [Float infinity negated ] ifFalse:[inf log]) sup: sup log]