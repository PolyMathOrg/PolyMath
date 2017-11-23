running
numberOfRejectionsFor: aDistribution
	| n |
	ks populationDistribution: aDistribution.
	n := 0.
	1 to: 100 do: [ :j | 
		ks data: ((1 to: 300) collect: [ :i | nd random ]).
		(ks rejectEqualityHypothesisWithAlpha: 0.05)
			ifTrue: [ n := n + 1 ] ].
	^ n