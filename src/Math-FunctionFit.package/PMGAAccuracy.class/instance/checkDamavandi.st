tests
checkDamavandi
	| g origin range optimizer  |
	g := [:x| |x1 x2| 
				x1:=x at:1. 
				x2:=x at:2.
				( 1 - ( ( ((x1 - 2)* Float pi)sin * ((x2 - 2) * Float pi)sin /(Float pi squared *(x1 - 2)*(x2 - 2)) )abs raisedToInteger: 5)) *(2 + (x1 - 7) squared + (2 * (x2 -7)squared)) ].
	origin := #(0 0 ).
	range :=#(  14    14 ).
	optimizer:= PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range. 
	optimizer chromosomeManager populationSize: 570.
	self setManager: optimizer chromosomeManager with: self parameter.
	^g value: optimizer evaluate