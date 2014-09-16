operation
eirCrossover: aChromosome1 and: aChromosome2
"the Extended Intermediate Recombination  0.5 operator, slightly changed to make it more similar to linecrossover (distribution is more centered around Chromosome1, which is better than C2)"
| r new1 new2 dif|
dif:=aChromosome2 - aChromosome1.
dif norm=0 ifTrue:[^Array with:( self mutate: aChromosome2) with: (self mutate: aChromosome1) ].
r:=(1 to: aChromosome1 size) collect:[:i| 2.0 random -0.5] .
new1 := aChromosome1+ (r * dif).
r:=(1 to: aChromosome1 size) collect:[:i| 1.0 random -0.5] .
new2 := aChromosome1+ (r * dif).
^Array with: new1 with: new2
