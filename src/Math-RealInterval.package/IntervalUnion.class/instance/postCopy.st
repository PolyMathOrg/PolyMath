copying
postCopy
	super postCopy.
	array := array collect:[ :i|i copy].