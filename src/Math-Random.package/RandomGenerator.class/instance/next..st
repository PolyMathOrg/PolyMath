accessing
next: anInteger
	" Answer an Array of anInteger pseudo-random 
	Floats between 0 and 1. "

	^ ( 1 to: anInteger ) 
			collect: [ :i | self next ]
