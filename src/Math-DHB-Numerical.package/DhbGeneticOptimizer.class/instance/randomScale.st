information
randomScale
		"Private"
		"changes take care of divide by zero error"
	| norm fBest fWorst answer|
	fBest := bestPoints first value.
	fWorst := bestPoints last value.
	norm :=fBest - fWorst.
	norm =0 ifTrue: [
	norm:= 1 / bestPoints size.
	answer := bestPoints collect: [:each| norm] ] ifFalse: [
		norm := 1 / norm.
		answer := bestPoints collect: [ :each | (each value - fWorst) * norm] ].
	norm := 1 / ( answer inject: 0 into: [ :sum :each | each + sum]).
	fBest := 0.
	^answer collect: [ :each | fBest := each * norm + fBest. fBest]

