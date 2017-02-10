initializing
initSinTable
	| d |
	d := n // 2.
	sinTable := (0 to: n // 4) collect: [ :i | (Float pi * i / d) sin ]