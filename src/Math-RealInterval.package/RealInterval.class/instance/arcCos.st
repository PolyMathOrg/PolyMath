mathematical functions
arcCos
(self isEmpty or:[(sup< -1)or:[inf>1]])ifTrue: [ ^RealInterval new ].
^ RealInterval inf: (sup min:1) arcCos sup: (inf max: -1) arcCos 