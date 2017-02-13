operation
lineCrossOver: aChromosome1 and: aChromosome2
"BGA Line Recombination; expects C1 to be better than C2, which is not correct at the moment, need to change that!!! mhm i think i did that."
	| new1 new2 line norm|
	line :=(aChromosome2 - aChromosome1).
	norm := line norm.
	norm =0 ifTrue:[^Array with: (self mutate: aChromosome1)with: (self mutate: aChromosome1)].
	line :=line/norm * (self smallDistribution).
	new1 :=aChromosome1 + line.
	new2 :=	aChromosome1 - line.
	^Array with: new1 with: new2