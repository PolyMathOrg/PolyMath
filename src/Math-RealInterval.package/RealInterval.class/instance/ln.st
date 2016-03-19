mathematical functions
ln
^sup<0 
	ifTrue:[  RealInterval new]
	ifFalse:[ RealInterval inf: ((inf<0) ifTrue: [Float infinity negated ] ifFalse:[inf ln]) sup: sup ln]