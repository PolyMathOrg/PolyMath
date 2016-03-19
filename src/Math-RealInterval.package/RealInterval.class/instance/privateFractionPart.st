private
privateFractionPart
"works for positive recipient"
	|distance lower upper|
self isEmpty  ifTrue: [ ^RealInterval new ] .
upper :=sup isInfinite ifFalse: [sup truncated] ifTrue:[sup] .
lower :=inf isInfinite ifFalse: [inf truncated] ifTrue:[inf].
distance := upper - lower .
upper :=sup - upper.
lower :=inf - lower.
^distance >1 
	ifTrue:[RealInterval inf: 0 sup: 1]
	ifFalse: [distance =0 
		ifTrue: [RealInterval inf: lower sup: upper ]
		ifFalse: [(RealInterval inf: 0 sup: upper)union:(RealInterval inf: lower sup: 1 )]]. "distance=1"