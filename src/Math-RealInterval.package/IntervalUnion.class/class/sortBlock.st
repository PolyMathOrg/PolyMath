sorting
sortBlock
^[ :int1 :int2|
	int2 isEmpty or:
	[(int1 inf = int2 inf) 
		ifTrue:  [ int1 sup<int2 sup ] 
		ifFalse: [ int1 inf < int2 inf ] ]]