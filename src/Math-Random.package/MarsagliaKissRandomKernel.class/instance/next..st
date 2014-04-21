accessing
next: anInteger
	" Answer an Array of anInteger pseudo-random 
	32 bits integers between 0 and 16rFFFFFFFF. "

	^ ( 1 to: anInteger ) 
			collect: [ :i | self next ]