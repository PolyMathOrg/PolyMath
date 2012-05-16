information
randomScale
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	| norm fBest fWorst answer|
	fBest := bestPoints first value.
	fWorst := bestPoints last value.
	norm := 1 / ( fBest - fWorst).
	answer := bestPoints collect: [ :each | (each value - fWorst) * norm].
	norm := 1 / ( answer inject: 0 into: [ :sum :each | each + sum]).
	fBest := 0.
	^answer collect: [ :each | fBest := each * norm + fBest. fBest]