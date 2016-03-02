initialize
initialize

	super initialize.
	random := Random new.
	seedA := (random nextInt: 2147483562) asFloat.
	seedB := (random nextInt: 2147483398) asFloat