mathematical functions
arcSin
(self isEmpty or:[(sup< -1)or:[inf>1]])ifTrue: [ ^RealInterval new ].
^ RealInterval inf: (inf max: -1) arcSin sup: (sup min:1) arcSin 