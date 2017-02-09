transformation
higherOrderSum
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	| x newSum |
	x := step / 2 + from.
	newSum := 0.
	[ x < to ]
		whileTrue: [ newSum := ( functionBlock value: x) + newSum.
					 x := x + step.
				   ].
	sum := ( step * newSum + sum) / 2.
	step := step / 2.
	^sum