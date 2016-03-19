mathematical functions
sqrt
(self isEmpty or: [sup <0]) ifTrue: [ ^RealInterval new ].
sup=0 ifTrue:[^0].
^self isMixed ifTrue: [ RealInterval inf: 0 sup: (sup sqrt) ] ifFalse: [ RealInterval inf: inf sqrt sup: sup sqrt ]
	