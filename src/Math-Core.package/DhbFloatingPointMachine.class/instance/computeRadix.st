information
computeRadix
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	| one zero a b tmp1 tmp2|
	one := 1.0.
	zero := 0.0.
	a := one.
	[ a := a + a.
	  tmp1 := a + one.
	  tmp2 := tmp1 - a.
	  tmp2 - one = zero] whileTrue:[].
	b := one.
	[ b := b + b.
	  tmp1 := a + b.
	  radix := ( tmp1 - a) truncated.
	  radix = 0 ] whileTrue: [].